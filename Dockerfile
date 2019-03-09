FROM node:10 as builder
WORKDIR /build
COPY . /build/
RUN npm ci --prod

FROM node:10-slim
VOLUME /vol-tmp /vol-extract
WORKDIR /app
COPY --from=builder /build/ /app/
USER node
EXPOSE 3000
ENV PORT=3000
ENV DEBUG=dman:*
CMD [ "node", "server.js" ]