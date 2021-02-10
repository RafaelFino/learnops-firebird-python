FROM ubuntu:20.04

RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata \
    && apt install -y wget curl vim python3 python3-pip libicu-dev libtommath-dev 

RUN DEBIAN_FRONTEND=noninteractive apt install -y firebird3.0-server

RUN pip3 install firebird
RUN pip3 install firebird.driver

ADD app/main.py /tmp
ADD scripts/create_db.sql /tmp

RUN firebird &

RUN isql-fb -i /tmp/create_db.sql

CMD python3 /tmp/main.py
