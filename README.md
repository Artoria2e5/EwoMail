# EwoMail-ng

EwoMail是基于Linux的开源邮件服务器软件，集成了众多优秀稳定的组件，是一个快速部署、简单高效、多语言、安全稳定的邮件解决方案，帮助你提升运维效率，降低 IT 成本，兼容主流的邮件客户端，同时支持电脑和手机邮件客户端。

## 2.0.0更新说明

* rainloop换成snappymail：
  * 更新插件API
  * 将补丁转换为submodule形式
  * 未完成：需要PHP7.4，需要更新lnmp包
* 增加CentOS 9 Stream支持

## 集成组件


* Postfix：SMTP服务
* Dovecot：IMAP/POP3/邮件存储
* Amavisd：反垃圾和防病毒
* LNAMP：Linux，nginx，mysql，php
* EwoMail-Admin：WEB邮箱管理后台
* Snappymail：webmail，兼容rainloop

## 安装环境

centos 7/8/9系统，服务器需要干净环境，全新安装的系统。

最低配置要求

* CPU：1核
* 内存：2G
* 硬盘：40G
* 带宽：1-3M


**国外网络** 请在安装域名后面加空格加en，例如 `sh ./start.sh ewomail.cn en`

## centos7/8

```
yum -y install git
cd /root
wget https://github.com/Reedbeta/git-partial-submodule/raw/main/git-partial-submodule.py
git clone https://github.com/Artoria2e5/EwoMail.git
cd EwoMail
python ../git-partial-submodule.py clone
cd install
#需要输入一个邮箱域名，不需要前缀，列如下面的ewomail.cn
sh ./start.sh ewomail.cn
```

**国外网络** 请在安装域名后面加空格加en，例如 `sh ./start.sh ewomail.cn en`
 
安装教程：http://doc.ewomail.com/docs/ewomail/install

更新教程：http://doc.ewomail.com/docs/ewomail/update

## 邮箱后台

![ewomail-admin](https://box.kancloud.cn/c362878ba731559b09eae36b7236bde5_1366x609.png "ewomail-admin")

## webmail

![webmail](https://box.kancloud.cn/3de1da2809f14048fb4cb3b32d0408d1_1183x476.png "webmail")


## 安装或使用过程遇到问题

http://doc.ewomail.com/docs/ewomail/solve
