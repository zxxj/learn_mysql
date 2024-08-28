
CREATE TABLE IF NOT EXISTS employess(
	emp_num INT(11),
	last_name VARCHAR(20),
	frist_name VARCHAR(30),
	mobile VARCHAR(11),
	`code` INT,
	job_title VARCHAR(60),
	birth DATE,
	note VARCHAR(255),
	sex VARCHAR(5)
) CHARSET = utf8mb4 COMMENT '数据定义-综合案例';

# 查看表结构
DESC employess;

# 将表的mobile字段修改到code字段后面
ALTER TABLE employess MODIFY mobile VARCHAR(11) AFTER `CODE`;

# 将表的brith字段修改为brithday
ALTER TABLE employess CHANGE birth brithday DATE;

# 修改sex字段,数据类型为char(1)
ALTER TABLE employess MODIFY sex CHAR(1);

# 删除字段note
ALTER TABLE employess DROP note;

# 增加字段名height,数据类型为double(4,1)
ALTER TABLE employess ADD height DOUBLE(4,1);

# 将表名修改为test
ALTER TABLE employess RENAME test;