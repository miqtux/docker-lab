docker run -d \
   --name haproxy \
   --net svr-miqcluster \
   -p 80:80 \
   -p 8404:8404 \
   haproxytech/haproxy-alpine:2.4

    #  --volume /var/run/docker.sock:/var/run/docker.sock \
 #  --volume haproxy:/usr/local/etc/haproxy \