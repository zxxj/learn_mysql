# mysql

## 一. 安装/环境配置/连接数据库/基本命令

1. 安装mysql

   ```js
   mysql官网下载msi,双击安装,一路next,配置mysql密码
   ```

2. 检查mysql是否运行

   ```js
   1.右键我的电脑 => 管理 => 服务 => 搜索Mysql会发现 mysql服务的状态
   2.命令行窗口 => net stop mysql84 停止数据库运行, net start mysql84 启动数据库
   ```

3. 配置环境变量

   ```js
   1.系统环境变量新建: MYSQL_HOME 值为 C:\Program Files\MySQL\MySQL Server 8.4
   2.Path中新建: %MYSQL_HOME%\bin
   3.命令行中输入 mysql 可以确认环境配置完成
   ```

4. 如何连接mysql?

   ```js
   -u <username> 用于指定你要连接的mysql用户名
   -p <password> 表示密码,后面紧跟密码
   -h <hostname> 用于指定连接mysql服务器的地址
   -P <post> 指定数据库的端口号
   <databasename> 是你要连接的数据库的名称
   
   1. mysql -u root -p你的密码...
   或 mysql -u root -p 回车后,可以密文输入密码登录
   2. mysql -u root -p你的密码 -h127.0.0.1 -P 3006
   ```

   5.查询mysql版本与退出数据库连接

   ```js
   数据库连接成功后,可使用 select version(); 来查看数据库的版本
   exit 来退出数据库连接
   ```

## 二. DDL



1. 数据库操作

   ```sql
   # 创建数据库
   create database 数据库名;
   
   # 判断创建数据库
   create database if not exists 数据库名;
   
   # 创建数据库指定字符集
   create database 数据库名 character set 字符集;
   
   # 创建数据库的指定排序方式
   create database 数据库名 collate 排序方式;
   
   # 创建数据库的指定字符集和排序方式
   create database 数据库名 character set 字符集 collate 排序方式;
   
   # mysql8的默认字符集是 utf8mb4_0900_ai_ci
   
   # 查看当前数据库的字符集或排序方式
   show variables like 'character_set_database';
   show variables like 'collation_database';
   
   # 创建一张名为 ddl_d1的表,字符集为utf8,排序规则为区分大小写
   create database if not exists ddl_d1 character set utf8mb4 collate utf8mb4_0900_as_cs;
   ```

2. 常见字符集与排序规则

   ```sql
   字符集: 
   	utf8: 早起版本的字符集 最多3字节存储一个字符,3字节无法覆盖全部unicode编码,有显示乱码的可能
       utfmb4(8+默认): 解决了utf8的存储限制,使用4字节进行字符存储,可以覆盖更广的unicode编码,包括表情符号等
   排序规则: 
   	utf8mb4_0900_ai_ci: utf-8不区分大小写的排序规则 'a' === 'A'
   	utf8mb4_0900_as_cs: utf8的unicode的排序规则,区分大小写 'a' !== 'A'
   ```

   