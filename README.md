# Super Lightweight Nginx Image (with envs & template)

## Inspired on flashspys/nginx-static

This image contains Nginx's "template function", which translates vars into values,<br>
giving you full control, just by setting envs on the container

Like the flashspys's image, this Nginx is super stripped down and only does static serving over HTTP.<br>
It's also pretty stripped down, takes roughly 1MB on RAM and 10MB on disk.


---

envs example:

```
PORT=80
ROOT=/static
SERVER_NAME=localhost
INDEX=index.html
```

then default.conf becomes:
```
server {
    charset      utf-8;
    listen       80
    server_name  localhost;
    location / {
        root   /static;
        index  index.html;
    }
}

```

If you have any doubts on how the nginx-static behaves in general, you should check out the original page

https://hub.docker.com/r/flashspys/nginx-static
