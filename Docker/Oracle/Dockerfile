FROM alpine:3.7
USER root
RUN apk update && apk upgrade
RUN apk add --no-cache php5 php5-cli php5-dev php5-pear
#RUN apk add --no-cache php5-pear php5-dev gcc musl-dev make

#RUN apk update && apk add unzip php5 php5-cli php5-dev php-db php-pear build-essential libaio1 re2c ldconfig




FROM adminer
USER root
RUN pecl install pdo
RUN pecl install oci8
#RUN OCI8 PDO_OCI
