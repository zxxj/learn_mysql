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