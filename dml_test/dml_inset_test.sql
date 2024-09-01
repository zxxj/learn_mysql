
-- 创建数据库
CREATE DATABASE IF NOT EXISTS dml_test;

-- 创建学习inset插入的表
CREATE TABLE IF NOT EXISTS students(
	stu_name VARCHAR(22) COMMENT '学生姓名',
	stu_age INT COMMENT '学生年龄',
	stu_id_number LONG COMMENT '学号',
	stu_height DOUBLE(4,1) COMMENT '学生身高, 保留1位小数',
	stu_brithday DATE COMMENT '学生生日'
) CHARSET utf8mb4;

-- 1.插入一名学生的所有信息
-- 写法1
INSERT INTO students VALUES('zhangxin', 15, 100, 155.5, '1997-09-10')
-- 写法2(推荐)
INSERT INTO students (stu_id_number, stu_name, stu_age, stu_height, stu_brithday) VALUES (101,'zhangxinxin', 18, 188.8, '1999-10-1');

-- 2.插入一名学生的学号,名字,年龄,其他列使用默认值
INSERT INTO students (stu_id_number, stu_name, stu_age) VALUES (102, 'jay', 23);

-- 3.插入两名学生的信息,包含学号,名字,年龄,生日和身高
INSERT INTO students (stu_id_number, stu_name, stu_age, stu_brithday, stu_height) VALUES (103, 'jack', 30, '2000-10-03', 177.7), (104, 'kobe', 40, '2001-03-20', 201.3);

-- 4.插入一名学生的信息,只提供学号,名字和年龄,其他列为空值
INSERT INTO students (stu_id_number, stu_name, stu_age, stu_height, stu_brithday) VALUES (104, 'james', 35, NULL, NULL);