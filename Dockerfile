FROM node:alpine as builder
WORKDIR '/app'
RUN npm config set registry https://artifacthub-tip.oraclecorp.com/api/npm/npmjs-remote
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html