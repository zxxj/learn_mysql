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