FROM flashspys/nginx-static

# gettext is needed for getting ENVs
RUN apk add --no-cache gettext

# make the templates folder and copy the default one :)
RUN mkdir -p /etc/nginx/templates
COPY default.conf.template /etc/nginx/templates

# copy the entrypoints
COPY docker-entrypoint.sh /
COPY docker-entrypoint.d/ /docker-entrypoint.d/

# adjust permissions
RUN chmod +x /docker-entrypoint.sh /docker-entrypoint.d/*.sh

ENV PORT=80
ENV ROOT=/static
ENV INDEX="index.html index.htm"
ENV SERVER_NAME=localhost

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx","-g","daemon off;"]
