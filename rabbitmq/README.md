# 前言
通过haproxy代理rabbitmq，使对外提供一个地址和端口


# 参考资料

* [haproxy镜像](https://hub.docker.com/_/haproxy/)
* [docker搭建 Haproxy+rabbitmq集群](https://blog.csdn.net/fqydhk/article/details/80430503)
* [RabbitMQ3.6.3集群搭建+HAProxy1.6做负载均衡](https://www.cnblogs.com/lion.net/p/5725474.html)

# rabbitmq集群不区分master或者slave

使用之前修改1.sh中的net网络，保证跟Rabbitmq处于同一网络(aaa 等等需要需要替换)

```
--net=aaa 
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

开启rabbitmq镜像后再执行下面的脚本

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
http://宿主机IP:5671

默认的账号密码guest guest不能远程登录，添加管理后进行登录

eg:
http://192.168.31.15:5671
```
