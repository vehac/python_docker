FROM python:3.8-alpine

RUN apk update && apk add --no-cache gcc musl-dev linux-headers build-base postgresql postgresql-dev libpq git openssh

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

WORKDIR /usr/src/app

COPY ./requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8007