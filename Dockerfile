# 1st base image
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# 2nd image
# this directly starts container no need for starting the container manually
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
