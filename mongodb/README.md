# 前言
通过haproxy代理mongodb，使对外提供一个地址和端口


# 参考资料

[haproxy镜像](https://hub.docker.com/_/haproxy/)
[haproxy代理mongodb](http://www.bubuko.com/infodetail-1701537.html)

# 集群下的mongodb 只有primary可以执行写操作，这里只考虑写操作

使用之前修改1.sh中的net网络，保证跟MongoDB处于同一网络(aaa 等等需要需要替换)

```
--net=aaa 
```

之后修改haproxy.cfg中的mongodb镜像的配置(比如 mongo-1-1 以及 mongo-1-2）

```
server monogo1 mongo-1-1:27017 check inter 2000 rise 2 fall 3
server monogo2 mongo-1-2:27017 check inter 2000 rise 2 fall 3
```
获取haproxy镜像

```
docker pull haproxy
```

开启mongodb镜像后再执行下面的脚本

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
使用MongoDB客户端连接
mongo 宿主机IP:28017

eg:
mongo 192.168.31.15:28017
```
