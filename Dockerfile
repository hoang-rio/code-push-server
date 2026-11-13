FROM node:24.22.3-alpine3.24 AS node

FROM node AS runner
COPY . .
COPY .env.example .env
RUN npm install
RUN npm run build

ENV PORT=3000

EXPOSE ${PORT}

CMD [ "npm", "run", "start:env" ]