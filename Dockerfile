FROM index.tenxcloud.com/docker_library/alpine:edge

RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories
RUN apk update && apk upgrade
RUN apk add --no-cache nodejs-lts@edge

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
RUN npm install


COPY . /usr/src/app

EXPOSE 8080

CMD [ "npm","start" ]
