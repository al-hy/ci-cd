FROM node:alpine
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . . 
RUN npm run build

FROM nginx
# On elasticbeanstalk, it was automatically port map for us without having to explicitly port map in the command line
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
