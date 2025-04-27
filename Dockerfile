# Version 1 (app-v1)
FROM node:14-alpine
WORKDIR /app
COPY . .
RUN npm install
CMD ["node", "server.js"]
