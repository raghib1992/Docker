FROM node:18-alpine
LABEL maintainer="Raghib nadim"
ENV NODE_ENV=production
COPY . /app
WORKDIR /app
RUN npm install pm2 -get
RUN npm install
CMD [ "pm2-runtime", "--no-auto-exit", "server.js" ]
