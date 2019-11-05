---
title: centos7 将普通用户加入sudoers中，获取sudo执行权限
categories:
  - 学习
tags:
  - Linux
  - CentOS
  - sudo
  - 权限
abbrlink: cc1b02ec
date: 2019-11-04 19:03:53
---

# centos7.x 将普通用户加入sudoers中，获取sudo执行权限

## 0 问题由来
&emsp;&emsp;你在提起兴致学习的时候，兴冲冲地往黑洞洞的文本窗口输入下一行：
```  
[pan@localhost ~]$ sudo ls  
```
&emsp;&emsp;按照系统验证需求，你输入用户密码，结果返回的是冰冷的一串错误信息：
> pan is not in the sudoers file. This incident will be reported.  
## 1 定位sudoers文件
&emsp;&emsp;按照错误信息的提示，我们获知由于用户“pan”不在sudoers文件中，导致了该命令行执行失败。  
&emsp;&emsp;很自然地，我们要定位一下这个文件在哪里，使用这个命令可以达到这个目的：
```
[pan@localhost ~]$ whereis sudoers
```
&emsp;&emsp;系统返回我们想要的结果：/etc/sudoers  
> sudoers:&emsp; /etc/sudoers.d&emsp; /etc/sudoers&emsp; /usr/share/man/man5/&emsp;sudoers.5.gz  
## 2 将普通用户添加进sudoers文件
&emsp;&emsp;既然找到了目标文件，我们的目的——往sudoers文件中添加用户“pan”，就完成了一半。那剩下的一半怎么做，我们不禁会问。我需要看看sudoers文档里的内容，也许文档注释里就告诉了如何按照要求添加一个用户。  
&emsp;&emsp;尝试查看 /etc/sudoers 里的内容：  
```
[pan@localhost ~]$ ls -l /etc/sudoers && cat /etc/sudoers  
```  
&emsp;&emsp;返回的是一串错误信息：
> -r--r-----. 1 root root 3938 4月  11 2018 /etc/sudoers  
cat:&emsp; /etc/sudoers:&emsp; Permission denied  

&emsp;&emsp;从返回信息中可以获知，该文件属主root拥有读权限，属组root拥有读权限，只有上述用户才可以查看文件 /etc/sudoers 的内容。  
&emsp;&emsp;切换到root用户完成查看文件 /etc/sudoers 的内容并添加用户“pan”进sudoers文件：    
```
[pan@localhost ~]$ su - root  
```  
&emsp;&emsp;查看 /etc/sudoers 里的内容：
```
[root@localhost ~]# vim /etc/sudoers  
```  
&emsp;&emsp;我们重点查看这一段内容：  
> \#\# Allow root to run any commands anywhere  
root&emsp;    ALL=(ALL)&emsp;       ALL    

&emsp;&emsp;既然用户root是这样写入sudoers文件，很自然我们想到把用户root替换成用户“pan”：  
```
[root@localhost ~]# echo "pan    ALL=(ALL)       ALL" >> /etc/sudoers  
```  
## 3 验证  
&emsp;&emsp;切换回用户“pan”并验证sudo的执行权限：  
```
[pan@localhost ~]$ sudo ls  
```  

## 4 结语  
&emsp;&emsp;这是一个很小的问题，本来是不值得一记的，但我生性太懒惰了，学东西时兴冲冲的，学了一段时间后就弃置迤逦、不管不顾了。写下来，就是为了磨性子。