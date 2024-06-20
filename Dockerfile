FROM node:16
WORKDIR /app

# Важно для кеширования слоев
COPY app/package.json package.json
COPY app/package-lock.json package-lock.json

RUN npm ci

COPY app/. .

EXPOSE 8080
RUN make setup
RUN make build
RUN make prepare-env

CMD make start