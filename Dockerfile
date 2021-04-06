FROM node:14 AS build-env
ADD . /app
WORKDIR /app
RUN yarn install --production

FROM gcr.io/distroless/nodejs:14
COPY --from=build-env /app /app
WORKDIR /app
ENV NODE_ENV=production
CMD ["index.js"]