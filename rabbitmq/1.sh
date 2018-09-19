docker run -d -p 5669:5669 -p 5670:5670 -p 5671:5671 -v $(pwd)/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg --name=haproxyrabbitmq --net=aaa haproxy
