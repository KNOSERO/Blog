# https://github.com/vercel/next.js/discussions/16995
FROM node:16.14 AS development
WORKDIR /opt/blogdev
ENV HOST=0.0.0.0
ENV PORT=3000
ENV NODE_ENV=development
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
RUN yarn generate
EXPOSE 3000
CMD [ "yarn", "run" , "dev"]

FROM node:16.14 AS dependencies
ENV NODE_ENV=production
WORKDIR /opt/blog
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

FROM node:16.14 AS builder
ENV NODE_ENV=development
WORKDIR /opt/blog
COPY . .
RUN yarn install --frozen-lockfile && NODE_ENV=production yarn build

FROM node:16.14 AS production
WORKDIR /opt/blog
ENV HOST=0.0.0.0
ENV PORT=3000
ENV NODE_ENV=production
COPY --chown=node --from=builder /app/next.config.js ./
COPY --chown=node --from=builder /app/public ./public
COPY --chown=node --from=builder /app/.next ./.next
COPY --chown=node --from=builder /app/yarn.lock /app/package.json ./
COPY --chown=node --from=dependencies /app/node_modules ./node_modules
USER node
EXPOSE 3000
CMD [ "yarn", "start" ]