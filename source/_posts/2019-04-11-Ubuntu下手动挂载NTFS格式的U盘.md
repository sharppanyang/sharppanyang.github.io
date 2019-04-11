---
title: Ubuntu下手动挂载NTFS格式的U盘
categories:
  - 学习
tags:
  - Linux
  - Ubuntu
  - mount
  - unmount
  - NTFS
abbrlink: 3c503eab
date: 2019-04-11 21:52:12
---


# Ubuntu下手动挂载NTFS格式的U盘


&ensp;&ensp;&ensp;&ensp;我们都知道，在Linux下使用U盘、硬盘等移动设备时，需要手动挂载这些设备。现在的很多Linux桌面发行版本，如我使用的Ubuntu 18在检测到有移动设备插入时，将会自动完成挂载该设备。但凡事都会有意外，今天我插入的U盘居然有莫名的错误（我猜测可能是未正确卸载导致的），这时候我可怜的Ubuntu兄弟就没能自动挂载了。

&ensp;&ensp;&ensp;&ensp;有需求就要学习新知识，这不我赶紧趁着这样的机会学习下，手动挂载移动设备。

&ensp;&ensp;&ensp;&ensp;我们先来理一下，达成目标的学习思路：

>>1.查看插入U盘在系统下分配的设备名称

>>2.查看该U盘的文件存储格式

>>3.修复U盘上莫名的错误

>>4.创建挂载点并完成手动挂载

>>5.卸载设备

## 1.查看插入U盘在系统下分配的设备名称

&ensp;&ensp;&ensp;&ensp;我们将学会使用下面这个shell命令来比对出，插入U盘后比插入U盘前多出来的设备名称。

``` bash
$ cat /proc/partitions
```

&ensp;&ensp;&ensp;&ensp;通过以下截图我们比对出系统给U盘分配出来的设备名称：

{% asset_img unexist_sdb.png 未插入U盘前的设备名称详情 %}

{% asset_img exist_sdb.png 插入U盘后的设备名称详情 %}

&ensp;&ensp;&ensp;&ensp;由此可知，我们插入的U盘设备名称叫做 /dev/sdb1 。

## 2.查看该U盘的文件存储格式


## 3.修复U盘上莫名的错误


## 4.创建挂载点并完成手动挂载


## 5.卸载设备
