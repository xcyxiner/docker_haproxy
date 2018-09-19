# 前言
通过haproxy代理redis，使对外提供一个地址和端口


# 参考资料

* [haproxy镜像](https://hub.docker.com/_/haproxy/)
* [企业实战-KeepAlived+Redis+Haproxy实现主从热备、负载均衡、秒级切换](http://blog.51cto.com/yw666/1940272)
* [haproxy配置监控redis主备切换](https://blog.csdn.net/gsying1474/article/details/49179651)

# 集群下的redis只有master可以执行写操作

使用之前修改1.sh中的net网络，保证跟redis处于同一网络(aaa 等等需要需要替换)

```
--net=aaa 
```

之后修改haproxy.cfg中的redis镜像的配置(比如 redis-master 以及 redis-slave1）

```
server redis1  redis-master:6379 check inter 5s rise 2 fall 3
server redis2  redis-slave1:6379 check inter 5s rise 2 fall 3
```

获取haproxy镜像

```
docker pull haproxy
```

开启redis镜像后再执行下面的脚本

```
sh 1.sh
```

打开网络浏览状态

```
http://宿主机IP:5669/haproxy?stats 

账号密码查看  haproxy.cfg,比如 admin admin

eg:
http://192.168.31.15:5669/haproxy?stats
```


关于测试

```
使用redis客户端连接
redis-cli -h  宿主机IP -p 7379

eg:
redis-cli -h 192.168.31.15 -p 7379
```
