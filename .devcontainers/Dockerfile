FROM mcr.microsoft.com/devcontainers/base:ubuntu

RUN apt update &&  apt install python3.10-venv nodejs npm -y

WORKDIR /app

COPY . /app

RUN make prequisite
