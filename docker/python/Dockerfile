FROM python:3.7-slim

RUN apt-get update \
 && apt-get install -y python3-dev

WORKDIR /app

RUN python3 -m pip install --upgrade pip

COPY app/requirements.txt requirements.txt

RUN pip3 install -r requirements.txt
