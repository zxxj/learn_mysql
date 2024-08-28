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

3. 查看和使用库

   ```sql
   # 查看当前所有库
   show databases;
   
   # 查看当前使用的库
   select database();
   
   # 查看指定库下的所有表
   show tables from 数据库名;
   
   # 查看创建库的信息
   show create database 数据库名;
   
   # 切换库
   use 数据库名;
   ```

4. 数据库的修改与删除

   ```sql
   # 数据库的修改
   
   # 修改数据库的字符集
   ALTER DATABASE ddl_d1 CHARACTER set utf8mb4;
   
   # 修改数据库的排序规则
   ALTER DATABASE ddl_d1 COLLATE utf8mb4_0900_as_cs;
   
   # 同时修改字符集与排序规则
   ALTER DATABASE ddl_d1 CHARACTER set utf8mb4 COLLATE utf8mb4_0900_as_cs;
   
   # 数据库删除
   
   # 直接删除
   DROP DATABASE ddl_d1;
   
   # 判断删除
   DROP DATABASE IF EXISTS ddl_d1;
   ```

5. 认识表,创建一张表

   ```sql
   # 数据库定义 => 表管理 => 创建表demo
   
   # 创建book_libs数据库并指定编码与排序规则
   CREATE DATABASE IF NOT EXISTS book_libs CHARACTER set utf8mb4 COLLATE utf8mb4_0900_as_cs;
   
   # 切换到book_libs数据库
   use book_libs;
   
   # 创建books表
   CREATE TABLE IF NOT EXISTS books(
   # 列的信息
   	book_name VARCHAR(20) COMMENT '图书名称',
   	book_price DOUBLE(4,1) COMMENT '图书价格',
   	book_author VARCHAR(20) COMMENT '图书作者',
   	book_count INT COMMENT '图书数量'
   ) CHARSET = utf8mb4 COMMENT '图书表';
   
   SHOW TABLES FROM book_libs;
   ```

6. 约束类型

   ```sql
   CREATE DATABASE learn_data_type;
   
   # mysql支持多种数据类型,包括整数,浮点数,定点数,字符串,日期时间等.
   
   # 1 整数
   # TINYINT 1字节 -128 ~ 127 / 无符号 0 ~ 255
   # SMALLINT 2字节 -32768 ~ 32767 / 无符号 0 ~ 65535
   # MEDIUMINT 3字节 -8388608 ~ 16777215 / 无符号 0 ~ 8388607
   # INT 4字节 -2147483648 ~ 4294967295 / 无符号 0 ~ 2147483647
   # BIGINT 8字节 -2的62次幂 ~ 2的62次幂减一 / 无符号 0 ~ 2的62次幂减一
   
   # 无符号是什么意思? 无符号===无负号, 整数类型都可以添加unsigned修饰符,添加以后对应列的数据类型就会变为无负号类型,值会从0开始
   
   # demo
   
   CREATE TABLE IF NOT EXISTS demo(
   	d_age TINYINT UNSIGNED COMMENT '年龄',
   	d_number BIGINT UNSIGNED COMMENT '学号'
   ) CHARSET = utf8mb4 COMMENT 'demo';
   
   # 2 浮点数
   
   # FLOAT(M,D) 4字节 M最大为24 D最大为8
   # DOUBLE(M,D) 8字节 M最大为53 D最大为30
   
   # 定点数
   
   # DECIMAL(M, D) 动态计算字节长度 M最大为65 D最大为30, DECIMAL类型的存储空间是可变的,他的存储大小受DECIMAL类型定义时指定的精度和规模影响,如果D位数为0,DECIMAL则值不包含小数点或小数部分
   
   CREATE TABLE IF NOT EXISTS demo2(
   	d_score FLOAT(3,1) COMMENT '成绩',
   	d_height DOUBLE(4,1) COMMENT '身高',
   	d_weighht DECIMAL(5,2) COMMENT '体重' 
   ) CHARSET = utf8mb4 COMMENT '浮点数与定点数类型';
   
   # 3 字符串
   
   # CHAR 固定长度类型 一旦声明固定占有对应的空间, M最大为255
   # VARCHAR 动态长度类型 声明后可以插入小于的长度,会自动进行伸缩,M占有的空间不能超过一行的最大显示 65535 字节
   
   /** 
   	细节: 
   		1. char声明的时候不写m默认为char(1)
   		2. char声明了最大长度限制,但输入的文本小于声明的长度,那么会在右侧补全空格 例如长度为5,但输入的是3, 'abc' => 'abc  '
   		3. char类型在读取的时候,会自动移除右侧补全的空格 'abc  ' => 'abc'
   		4. varchar声明的时候必须添加M限制:  varcahr(M)
   		5. mysql4.0以下版本默认是varchar(20)
   		6. varchar类型中识别空格,如果插入了空格,那么读取的时候也会返回空格
   */
   
   CREATE TABLE IF NOT EXISTS demo3(
   	d_age CHAR COMMENT '年龄',
   	d_desc VARCHAR(16000) COMMENT '介绍',
   	d_text TEXT COMMENT '文本'
   ) CHARSET = utf8mb4 COMMENT '字符与字符串类型';
   
   # 4 时间类型
   
   /** 
   	YEAR 年 1字节 YYYY或YY 
   	TIME 时间 3字节 HH:MM:SS
   	DATE 日期 3字节 YYYY-MM-DD
   	DATETIME 日期时间 8字节 YYYY-MM-DD HH:MM:SS
   	TIMESTAMP 时间戳 4字节 YYYY-MM-DD HH:MM:SS
   */
   
   CREATE TABLE IF NOT EXISTS demo4(
   	username VARCHAR(20),
   	create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
   	update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE  CURRENT_TIMESTAMP COMMENT '更新时间'
   ) CHARSET = utf8mb4 COMMENT '时间类型';
   ```

   