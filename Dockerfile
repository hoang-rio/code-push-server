FROM node:20.11.1-alpine3.19 AS node

FROM node as runner
COPY . .
COPY .env.example .env
RUN npm install
RUN npm run build

ENV PORT=3000

EXPOSE ${PORT}

CMD [ "npm", "run", "start:env" ]