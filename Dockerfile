FROM node:12-alpine3.9

COPY ./src ./src
COPY ./package.json .

RUN npm install --omit=dev

CMD ["node", "src/index.js"]
