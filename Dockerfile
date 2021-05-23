FROM nginx:stable-alpine
COPY build /usr/share/nginx/html

#for environment variable config generation
COPY ./env.sh /docker-entrypoint.d/env.sh
RUN chmod +x /docker-entrypoint.d/env.sh

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

