FROM node:14

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

# PORT variable is mention inthe code, passsing through docker file via ENV
ENV PORT 80

EXPOSE $PORT

VOLUME [ "/app/feedback" ]

CMD [ "npm", "start" ]