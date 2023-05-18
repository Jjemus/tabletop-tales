FROM alpine:latest AS builder

WORKDIR /app

COPY ./../. .

USER root

RUN apk update 
RUN apk add --update nodejs npm

RUN npm install
RUN npm install --global nuxt
RUN nuxt build

FROM alpine:latest

RUN apk update 
RUN apk add --update nodejs

WORKDIR /app

COPY --from=builder /app/.output/ /app/

ENV HOST 0.0.0.0
EXPOSE 3000

ENTRYPOINT ["node", "server/index.mjs"]
