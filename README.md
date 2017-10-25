# rpi-mqtt

[![Build Status](https://travis-ci.org/sofwerx/rpi-mqtt.svg)](https://travis-ci.org/sofwerx/rpi-mqtt)

This is the Dockerfile behind `sofwerx/rpi-mqtt:latest` on Docker Hub, setup to autobuild through travis.

Note: the base image of the Dockerfile is `FROM multiarch/debian-debootstrap:armhf-jessie`, which is to allow the x86_64 travis-ci servers to run qemu when building the ARM contents of this resultant image.

This runs an MQTT server.

The parent project to this is [sofwerx/rpi-tpms](https://github.com/sofwerx/rpi-tpms). There you will find the docker-compose that uses this container.

Here is the docker-compose snippet of this container image in use:

  mqtt:
    image: sofwerx/rpi-mqtt:latest
    container_name: mqtt
    hostname: mqtt
    restart: always
    volumes:
      - mqtt-data:/data
    depends_on:
      - multiarch
    logging:
      driver: json-file
      options:
        max-size: "20k"

