
## MarkDown 编辑器 https://www.zybuluo.com/mdeditor




## sublime text 3  常见问题
<img src="https://github.com/fanhuajun/notes/blob/master/img/sublime.jpg" width="78" height="auto">

> 一. 中文乱码

- install package
1. 安装 ConvertToUTF8
2. 安装 GBK Support

> 二、json 格式化

- 安装 Pretty JSON  
  
  ctrl+alt+j  快捷键
  
## tomcat 常见问题
<img src="https://github.com/fanhuajun/notes/blob/master/img/Tomcat.jpg" width="78" height="auto">

> 启动慢  添加参数

```shell
JAVA_OPTS="$JAVA_OPTS -Djava.security.egd=file:/dev/./urandom"
```

## [Linux 服务器配置 链接](https://github.com/fanhuajun/initServer) ##
<img src="https://github.com/fanhuajun/notes/blob/master/img/linux.jpg" width="78" height="auto">

- 1、乱码问题

```shell
cat > /etc/locale.conf << END
LANG=en_US.UTF-8
export LC_ALL=zh_CN.UTF-8
END

source /etc/locale.conf
```

## Excel
<img src="https://github.com/fanhuajun/notes/blob/master/img/Excel.jpg.jpg" width="78" height="auto">

```sql
=CONCATENATE("insert into users (name,sex,age) values ('",A1,"','",B1,"','",C1,"');")
```