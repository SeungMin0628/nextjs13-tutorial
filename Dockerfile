FROM node:19.3.0-slim

ENV NEXT_TELEMETRY_DISABLED=1

RUN set -eu \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    git \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./package.json ./package-lock.json .

RUN set -eu && npm ci

COPY . .

RUN npm run build
