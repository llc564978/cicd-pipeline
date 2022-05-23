FROM python:3.9.6-slim

WORKDIR /usr/src/app/

## Pass Environments
ARG ENV
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libpq-dev gcc make

COPY ./Pipfile ./Pipfile.lock ./
RUN pip install -r requirements/$ENV.txt

COPY . .