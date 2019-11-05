FROM node:alpine as builder
WORKDIR '/doodee24/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /doodee24/app/build /usr/share/nginx/html