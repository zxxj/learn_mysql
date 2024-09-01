-- 创建表,学习dml的修改操作
CREATE TABLE IF NOT EXISTS profile(
	profile_name VARCHAR(10) COMMENT '姓名',
	profile_age TINYINT UNSIGNED COMMENT '年龄',
	profile_brithday DATE COMMENT '生日',
	profile_height DOUBLE(4,1) COMMENT '身高'
) CHARSET utf8mb4;

-- 1.将姓名为谭安琪的人的年龄修改为30
UPDATE profile SET profile_age = 30 WHERE profile_name = "谭安琪";

-- 2.将所有小于30岁的人的身高在原有身高基础上增加2.0厘米
UPDATE profile SET profile_height = profile_height + 2 WHERE profile_age < 30;

-- 3.将姓名为沈嘉伦的人的年龄修改为33岁,生日修改为2003-08-15
UPDATE profile SET profile_age = 33, profile_brithday = '2003-08-15' WHERE profile_name = '沈嘉伦';

-- 4.将所有人的年龄增加1岁
UPDATE profile SET profile_age = profile_age + 1;