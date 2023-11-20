FROM node:14

WORKDIR /app

COPY ./package.json .

RUN npm install

COPY . .

ENV MONGODB_USERNAME=admin
ENV MONGODB_PASSWORD=secret

CMD ["node", "app.js"]

