# Stage 1: Build
FROM node:18 as builder

WORKDIR /build

COPY package*.json ./
RUN npm install

COPY tsconfig.json tsconfig.json
COPY src/ src/

RUN npm run build

# Stage 2: Runtime
FROM node:18 as runner

WORKDIR /app

COPY --from=builder /build/package*.json ./
COPY --from=builder /build/node_modules ./node_modules
COPY --from=builder /build/dist ./dist

ENV PORT=8000

EXPOSE 8000

CMD ["npm", "start"]
