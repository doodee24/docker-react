FROM node:alpine as builder
WORKDIR '/doodee24/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /doodee24/app/build /usr/share/nginx/html