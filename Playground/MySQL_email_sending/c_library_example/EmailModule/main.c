#include <my_global.h>
#include <mysql.h>
#include <string.h>
#include <ctype.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <unistd.h>
#include "time.h"


my_bool SendEmail_init(UDF_INIT *initid,UDF_ARGS *arg,char *message);
void SendEmail_deinit(UDF_INIT *initid __attribute__((unused)));
char* SendEmail(UDF_INIT *initid, UDF_ARGS *arg,char *result,unsigned long *length, char *is_null,char* error);

/*
 * base64
 */
int Base64encode_len(int len);
int Base64encode(char * coded_dst, const char *plain_src,int len_plain_src);

int Base64decode_len(const char * coded_src);
int Base64decode(char * plain_dst, const char *coded_src);

/* aaaack but it's fast and const should make it shared text page. */
static const unsigned char pr2six[256] =
{
    /* ASCII table */
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 62, 64, 64, 64, 63,
    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 64, 64, 64, 64, 64, 64,
    64,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
    15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 64, 64, 64, 64, 64,
    64, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64
};

int Base64decode_len(const char *bufcoded)
{
    int nbytesdecoded;
    register const unsigned char *bufin;
    register int nprbytes;

    bufin = (const unsigned char *) bufcoded;
    while (pr2six[*(bufin++)] <= 63);

    nprbytes = (bufin - (const unsigned char *) bufcoded) - 1;
    nbytesdecoded = ((nprbytes + 3) / 4) * 3;

    return nbytesdecoded + 1;
}

int Base64decode(char *bufplain, const char *bufcoded)
{
    int nbytesdecoded;
    register const unsigned char *bufin;
    register unsigned char *bufout;
    register int nprbytes;

    bufin = (const unsigned char *) bufcoded;
    while (pr2six[*(bufin++)] <= 63);
    nprbytes = (bufin - (const unsigned char *) bufcoded) - 1;
    nbytesdecoded = ((nprbytes + 3) / 4) * 3;

    bufout = (unsigned char *) bufplain;
    bufin = (const unsigned char *) bufcoded;

    while (nprbytes > 4) {
    *(bufout++) =
        (unsigned char) (pr2six[*bufin] << 2 | pr2six[bufin[1]] >> 4);
    *(bufout++) =
        (unsigned char) (pr2six[bufin[1]] << 4 | pr2six[bufin[2]] >> 2);
    *(bufout++) =
        (unsigned char) (pr2six[bufin[2]] << 6 | pr2six[bufin[3]]);
    bufin += 4;
    nprbytes -= 4;
    }

    /* Note: (nprbytes == 1) would be an error, so just ingore that case */
    if (nprbytes > 1) {
    *(bufout++) =
        (unsigned char) (pr2six[*bufin] << 2 | pr2six[bufin[1]] >> 4);
    }
    if (nprbytes > 2) {
    *(bufout++) =
        (unsigned char) (pr2six[bufin[1]] << 4 | pr2six[bufin[2]] >> 2);
    }
    if (nprbytes > 3) {
    *(bufout++) =
        (unsigned char) (pr2six[bufin[2]] << 6 | pr2six[bufin[3]]);
    }

    *(bufout++) = '\0';
    nbytesdecoded -= (4 - nprbytes) & 3;
    return nbytesdecoded;
}

static const char basis_64[] =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

int Base64encode_len(int len)
{
    return ((len + 2) / 3 * 4) + 1;
}

int Base64encode(char *encoded, const char *string, int len)
{
    int i;
    char *p;

    p = encoded;
    for (i = 0; i < len - 2; i += 3) {
    *p++ = basis_64[(string[i] >> 2) & 0x3F];
    *p++ = basis_64[((string[i] & 0x3) << 4) |
                    ((int) (string[i + 1] & 0xF0) >> 4)];
    *p++ = basis_64[((string[i + 1] & 0xF) << 2) |
                    ((int) (string[i + 2] & 0xC0) >> 6)];
    *p++ = basis_64[string[i + 2] & 0x3F];
    }
    if (i < len) {
    *p++ = basis_64[(string[i] >> 2) & 0x3F];
    if (i == (len - 1)) {
        *p++ = basis_64[((string[i] & 0x3) << 4)];
        *p++ = '=';
    }
    else {
        *p++ = basis_64[((string[i] & 0x3) << 4) |
                        ((int) (string[i + 1] & 0xF0) >> 4)];
        *p++ = basis_64[((string[i + 1] & 0xF) << 2)];
    }
    *p++ = '=';
    }

    *p++ = '\0';
    return p - encoded;
}

/*
 end of base64
 */

const char* GetIPAddress(const char* target_domain) {
    const char* target_ip;
    struct in_addr *host_address;
    struct hostent *raw_list = gethostbyname(target_domain);
    int i = 0;
    for (i; raw_list->h_addr_list[i] != 0; i++) {
        host_address = raw_list->h_addr_list[i];
        target_ip = inet_ntoa(*host_address);
    }
    return target_ip;
}

char * MailHeader(const char* from, const char* to, const char* subject, const char* mime_type, const char* charset) {

    time_t now;
    time(&now);
    char *app_brand = "Codevlog Test APP";
    char* mail_header = NULL;
    char date_buff[26];
    char Branding[6 + strlen(date_buff) + 2 + 10 + strlen(app_brand) + 1 + 1];
    char Sender[6 + strlen(from) + 1 + 1];
    char Recip[4 + strlen(to) + 1 + 1];
    char Subject[8 + 1 + strlen(subject) + 1 + 1];
    char mime_data[13 + 1 + 3 + 1 + 1 + 13 + 1 + strlen(mime_type) + 1 + 1 + 8 + strlen(charset) + 1 + 1 + 2];

    strftime(date_buff, (33), "%a , %d %b %Y %H:%M:%S", localtime(&now));

    sprintf(Branding, "DATE: %s\r\nX-Mailer: %s\r\n", date_buff, app_brand);
    sprintf(Sender, "FROM: %s\r\n", from);
    sprintf(Recip, "To: %s\r\n", to);
    sprintf(Subject, "Subject: %s\r\n", subject);
    sprintf(mime_data, "MIME-Version: 1.0\r\nContent-type: %s; charset=%s\r\n\r\n", mime_type, charset);

    int mail_header_length = strlen(Branding) + strlen(Sender) + strlen(Recip) + strlen(Subject) + strlen(mime_data) + 10;

    mail_header = (char*) malloc(mail_header_length);

    memcpy(&mail_header[0], &Branding, strlen(Branding));
    memcpy(&mail_header[0 + strlen(Branding)], &Sender, strlen(Sender));
    memcpy(&mail_header[0 + strlen(Branding) + strlen(Sender)], &Recip, strlen(Recip));
    memcpy(&mail_header[0 + strlen(Branding) + strlen(Sender) + strlen(Recip)], &Subject, strlen(Subject));
    memcpy(&mail_header[0 + strlen(Branding) + strlen(Sender) + strlen(Recip) + strlen(Subject)], &mime_data, strlen(mime_data));
    return mail_header;
}

my_bool SendEmail_init(UDF_INIT *initid,UDF_ARGS *arg,char *message){
     if (!(arg->arg_count == 2)) {
        strcpy(message, "Expected two arguments");
        return 1;
    }

    arg->arg_type[0] = STRING_RESULT;// smtp server address
    arg->arg_type[1] = STRING_RESULT;// email body
    initid->ptr = (char*) malloc(2050 * sizeof (char));
    memset(initid->ptr, '\0', sizeof (initid->ptr));
    return 0;
}

void SendEmail_deinit(UDF_INIT *initid __attribute__((unused))){
    if (initid->ptr) {
        free(initid->ptr);
    }
}

char* SendEmail(UDF_INIT *initid, UDF_ARGS *arg,char *result,unsigned long *length, char *is_null,char* error){
   char *header = MailHeader(From_header, TO_header, "Hello Its a test Mail from Codevlog", "text/plain", "US-ASCII");
    int connected_fd = socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
    struct sockaddr_in addr;
    memset(&addr, 0, sizeof (addr));
    addr.sin_family = AF_INET;
    addr.sin_port = htons(25);
    if (inet_pton(AF_INET, GetIPAddress(arg->args[0]), &addr.sin_addr) == 1) {
        connect(connected_fd, (struct sockaddr*) &addr, sizeof (addr));
    }
    if (connected_fd != -1) {
        int recvd = 0;
        const char recv_buff[4768];
        int sdsd;
        sdsd = recv(connected_fd, recv_buff + recvd, sizeof (recv_buff) - recvd, 0);
        recvd += sdsd;

        char buff[1000];
        strcpy(buff, "EHLO "); //"EHLO sdfsdfsdf.com\r\n"
        strcat(buff, domain);
        strcat(buff, "\r\n");
        send(connected_fd, buff, strlen(buff), 0);
        sdsd = recv(connected_fd, recv_buff + recvd, sizeof (recv_buff) - recvd, 0);
        recvd += sdsd;

        char _cmd2[1000];
        strcpy(_cmd2, "AUTH LOGIN\r\n");
        int dfdf = send(connected_fd, _cmd2, strlen(_cmd2), 0);
        sdsd = recv(connected_fd, recv_buff + recvd, sizeof (recv_buff) - recvd, 0);
        recvd += sdsd;

        char _cmd3[1000];
        Base64encode(&_cmd3, UID, strlen(UID));
        strcat(_cmd3, "\r\n");
        send(connected_fd, _cmd3, strlen(_cmd3), 0);
        sdsd = recv(connected_fd, recv_buff + recvd, sizeof (recv_buff) - recvd, 0);
        recvd += sdsd;

        char _cmd4[1000];
        Base64encode(&_cmd4, PWD, strlen(PWD));
        strcat(_cmd4, "\r\n");
        send(connected_fd, _cmd4, strlen(_cmd4), 0);
        sdsd = recv(connected_fd, recv_buff + recvd, sizeof (recv_buff) - recvd, 0);
        recvd += sdsd;

        char _cmd5[1000];
        strcpy(_cmd5, "MAIL FROM: ");
        strcat(_cmd5, From);
        strcat(_cmd5, "\r\n");
        send(connected_fd, _cmd5, strlen(_cmd5), 0);
        char skip[1000];
        sdsd = recv(connected_fd, skip, sizeof (skip), 0);

        char _cmd6[1000];
        strcpy(_cmd6, "RCPT TO: ");
        strcat(_cmd6, To); //
        strcat(_cmd6, "\r\n");
        send(connected_fd, _cmd6, strlen(_cmd6), 0);
        sdsd = recv(connected_fd, recv_buff + recvd, sizeof (recv_buff) - recvd, 0);
        recvd += sdsd;

        char _cmd7[1000];
        strcpy(_cmd7, "DATA\r\n");
        send(connected_fd, _cmd7, strlen(_cmd7), 0);
        sdsd = recv(connected_fd, recv_buff + recvd, sizeof (recv_buff) - recvd, 0);
        recvd += sdsd;

        send(connected_fd, header, strlen(header), 0);
        send(connected_fd, arg->args[1], strlen(arg->args[1]), 0);
        char _cmd9[1000];
        strcpy(_cmd9, "\r\n.\r\n.");
        send(connected_fd, _cmd9, sizeof (_cmd9), 0);
        sdsd = recv(connected_fd, recv_buff + recvd, sizeof (recv_buff) - recvd, 0);
        recvd += sdsd;

        char _cmd10[1000];
        strcpy(_cmd10, "QUIT\r\n");
        send(connected_fd, _cmd10, sizeof (_cmd10), 0);
        sdsd = recv(connected_fd, recv_buff + recvd, sizeof (recv_buff) - recvd, 0);

        memcpy(initid->ptr, recv_buff, strlen(recv_buff));
        *length = recvd;
    }
    free(header);
    close(connected_fd);
    return initid->ptr;
}