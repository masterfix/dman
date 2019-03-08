FROM node:10

VOLUME /vol-tmp /vol-extract

WORKDIR /app
COPY . /app/

RUN npm install

USER node

EXPOSE 3000
ENV PORT=3000

ENV DEBUG=dman:*

CMD [ "npm", "start" ]