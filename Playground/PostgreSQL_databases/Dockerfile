FROM postgres

COPY requirements.txt ./

RUN apt update \
      && apt install -y --no-install-recommends \
      git \
      make \
      build-essential \
      ca-certificates \
      libcurl4-openssl-dev \
      libssl-dev \
      postgresql-server-dev-15 \
      postgresql-plpython3-15 \
      python3 \
      python3-dev \
      python3-pip \
      python3-setuptools \
      python3-wheel \
      cmake \
      && pip3 install --no-cache-dir -r requirements.txt

RUN git clone https://github.com/citusdata/pg_cron.git && cd pg_cron && make && make install

RUN touch /usr/lib/tmpfiles.d/postgresql.conf
RUN echo "shared_preload_libraries = 'pg_cron'" | tee -a /usr/lib/tmpfiles.d/postgresql.conf

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-cron.sh /docker-entrypoint-initdb.d/002-setup-cron.sh