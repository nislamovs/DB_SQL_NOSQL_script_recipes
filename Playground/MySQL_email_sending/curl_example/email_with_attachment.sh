#!/bin/bash

rtmp_url="smtp://smtp.gmail.com:587"
rtmp_from="sender@gmail.com"
rtmp_to="receiver@gmail.com"
rtmp_credentials="sender@gmail.com:secretpassword"

mail_from="Some Name <$rtmp_from>"
mail_to="Some Name <$rtmp_to>"
mail_subject="example of mail"
mail_reply_to="Some Name <$rtmp_from>"
mail_cc=""

file_upload="/var/lib/mysql-files/data.txt"
PAYLOAD_FNAME="/var/lib/mysql-files/$1"

# html message to send
echo "<html>
<body>
    <div>
        <p>Hello, </p>
        <p>Please see the log file attached</p>
        <p>Admin Team</p>
    </div>
</body>
</html>" > /var/lib/mysql-files/message.html

# log.txt file to attached to the mail
#echo "some log in a txt file to attach to the mail" > log.txt

# add an image to data.txt :
# $1 : type (ex : image/png)
# $2 : image content id filename (match the cid:filename.png in html document)
# $3 : image content base64 encoded
# $4 : filename for the attached file if content id filename empty
function add_file {
    echo "--MULTIPART-MIXED-BOUNDARY
Content-Type: $1
Content-Transfer-Encoding: base64" >> "$file_upload"

    if [ ! -z "$2" ]; then
        echo "Content-Disposition: inline
Content-Id: <$2>" >> "$file_upload"
    else
        echo "Content-Disposition: attachment; filename=$4" >> "$file_upload"
    fi
    echo "$3

" >> "$file_upload"
}

message_base64=$(cat /var/lib/mysql-files/message.html | base64)

echo "From: $mail_from
To: $mail_to
Subject: $mail_subject
Reply-To: $mail_reply_to
Cc: $mail_cc
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=\"MULTIPART-MIXED-BOUNDARY\"

--MULTIPART-MIXED-BOUNDARY
Content-Type: multipart/alternative; boundary=\"MULTIPART-ALTERNATIVE-BOUNDARY\"

--MULTIPART-ALTERNATIVE-BOUNDARY
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64
Content-Disposition: inline

$message_base64
--MULTIPART-ALTERNATIVE-BOUNDARY--" > "$file_upload"

# add an image with corresponding content-id (here admin.png)
#image_base64=$(curl -s "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_116x41dp.png" | base64)
#add_file "image/png" "admin.png" "$image_base64"

# add the log file
PAYLOAD=$(cat $PAYLOAD_FNAME | base64)
#add_file "text/plain" "" "$log_file" "log.txt"
add_file "text/plain" "" "$PAYLOAD" "$PAYLOAD_FNAME"

# add another image
#image_base64=$(curl -s "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_116x41dp.png" | base64)
#add_file "image/png" "something.png" "$image_base64"

# end of uploaded file
echo "--MULTIPART-MIXED-BOUNDARY--" >> "$file_upload"

# send email
echo "sending ...."
curl -s "$rtmp_url" \
     --mail-from "$rtmp_from" \
     --mail-rcpt "$rtmp_to" \
     --ssl -u "$rtmp_credentials" \
     -T "$file_upload" -k --anyauth
res=$?
if test "$res" != "0"; then
   echo "sending failed with: $res"
else
    echo "OK"
fi