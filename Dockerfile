FROM node:24-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci --no-audit --no-fund

COPY . .
RUN npm run build

FROM node:24-alpine AS runner

WORKDIR /app
ENV NODE_ENV=production

# Production dependencies only: no compilers, linters or test tooling in the image.
COPY package.json package-lock.json ./
RUN npm ci --omit=dev --no-audit --no-fund && rm -rf /root/.npm

COPY --from=builder /app/bin ./bin
COPY .env.example .env

ENV PORT=3000

EXPOSE 3000

CMD [ "npm", "run", "start:env" ]
