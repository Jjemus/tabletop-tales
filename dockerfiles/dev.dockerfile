FROM alpine:latest

ENV HOST=0.0.0.0    

RUN apk update 
RUN apk add --update nodejs npm
RUN apk add nano
RUN apk add git
RUN git config --global user.name "Jemus"

USER root

EXPOSE 3000

ENTRYPOINT [ "npm", "run", "dev" ]