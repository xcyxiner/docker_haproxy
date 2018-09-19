docker run -d -p 28017:27017 -p 5669:5669 -v $(pwd)/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg --name=haproxymongo --net=aaa haproxy
