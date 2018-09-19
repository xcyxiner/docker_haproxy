# docker_haproxy
haproxy 代理 rabbitmq,redis,mongodb


# 参考资料
* [docker搭建 Haproxy+rabbitmq集群](https://blog.csdn.net/fqydhk/article/details/80430503)
* [企业实战-KeepAlived+Redis+Haproxy实现主从热备、负载均衡、秒级切换](http://blog.51cto.com/yw666/1940272)
* [haproxy镜像](https://hub.docker.com/_/haproxy/)
* [haproxy配置监控redis主备切换](https://blog.csdn.net/gsying1474/article/details/49179651)
* [RabbitMQ3.6.3集群搭建+HAProxy1.6做负载均衡](https://www.cnblogs.com/lion.net/p/5725474.html)
* [haproxy代理mongodb](http://www.bubuko.com/infodetail-1701537.html)

# 具体步骤参考各自目录下的README文件

使用之前修改1.sh中的net网络，保证跟rabbitmq,mongodb,redis处于同一网络(aaa 等等需要需要替换)

```
--net=aaa 
```

修改haproxy.cfg中的redis镜像的配置(比如 redis-master 以及 redis-slave1）

```
server redis1  redis-master:6379 check inter 5s rise 2 fall 3
server redis2  redis-slave1:6379 check inter 5s rise 2 fall 3
```

之后修改haproxy.cfg中的mongodb镜像的配置(比如 mongo-1-1 以及 mongo-1-2）

```
server monogo1 mongo-1-1:27017 check inter 2000 rise 2 fall 3
server monogo2 mongo-1-2:27017 check inter 2000 rise 2 fall 3
```

之后修改haproxy.cfg中的rabbitmq镜像的配置(比如 rabbit1 以及 rabbit2 rabbit3）

```
server rabbitmq1 rabbit1:15672
server rabbitmq2 rabbit2:15672
server rabbitmq3 rabbit3:15672


server   rabbitmq1 rabbit1:5672 check inter 5s rise 2 fall 3 
server   rabbitmq2 rabbit2:5672 check inter 5s rise 2 fall 3
server   rabbitmq3 rabbit3:5672 check inter 5s rise 2 fall 3
```


获取haproxy镜像

```
docker pull haproxy
```

开启rabbitmq,mongodb,redis镜像后再执行下面的脚本

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

