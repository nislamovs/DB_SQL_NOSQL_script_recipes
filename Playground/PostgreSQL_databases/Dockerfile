FROM postgres

COPY requirements.txt ./

RUN apt-get update
RUN apt -y install python3 pip
RUN apt-get -y install postgresql-plpython3-15
RUN apt -y install libcurl4-openssl-dev libssl-dev


RUN pip install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir -r requirements.txt

#RUN #apt-get update && apt-get -y install git build-essential postgresql-server-dev-11

#RUN git clone https://github.com/citusdata/pg_cron.git
#RUN cd pg_cron && make && make install
#
#RUN cd / && \
#        rm -rf /pg_cron && \
#        apt-get remove -y git build-essential postgresql-server-dev-11 && \
#        apt-get autoremove --purge -y && \
#        apt-get clean && \
#        apt-get purge

