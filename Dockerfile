FROM nginx:alpine

# to install network tools
RUN apk update && apk add --no-cache iputils curl

# copy file page
COPY index.html /usr/share/nginx/html/index.html

# search for جاري التحميل... sentence in html page and replace it with ip address for nginx
CMD sh -c "sed -i 's/جاري التحميل.../'\$(hostname -i)'/g' /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"