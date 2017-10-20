FROM multiarch/debian-debootstrap:armhf-jessie

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget curl

RUN curl -sL https://repo.mosquitto.org/debian/mosquitto-repo.gpg.key | gpg --import
RUN gpg -a --export 8277CCB49EC5B595F2D2C71361611AE430993623 | apt-key add -
RUN wget -q -O /etc/apt/sources.list.d/mosquitto-jessie.list https://repo.mosquitto.org/debian/mosquitto-jessie.list
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y mosquitto mosquitto-clients
RUN adduser --system --disabled-password --disabled-login mosquitto

RUN mkdir -p /mqtt/config /mqtt/data

COPY config /mqtt/config

RUN chown -R mosquitto:mosquitto /mqtt

VOLUME /mqtt/config /mqtt/data

EXPOSE 1883 9001

CMD /usr/sbin/mosquitto -c /mqtt/config/mosquitto.conf
