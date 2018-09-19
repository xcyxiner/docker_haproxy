docker run -d -p 7379:6379 -p 5669:5669 -v $(pwd)/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg --name=haproxyredis --net=aaa haproxy
