#!/bin/sh

echo "window._env_={" > ./config.js
echo "SERVER_PORT:${SERVER_PORT}"  >> ./config.js
echo "}" >> ./config.js

mv config.js /usr/share/nginx/html/config.js
