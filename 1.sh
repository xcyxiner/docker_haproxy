docker run -d -p 28017:27017 -p 7379:6379 -p 5669-5671:5669-5671 -v $(pwd)/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg --name=haproxy --net=aaa haproxy
