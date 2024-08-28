# 修改表与删除表

CREATE DATABASE learn_changeOrdelete_table;

use learn_changeordelete_table;

CREATE TABLE IF NOT EXISTS test(
	username VARCHAR(20) COMMENT '用户名',
	password VARCHAR(30) COMMENT '密码'
) CHARSET = utf8mb4 COMMENT '修改表与删除表';

# 添加列: ALTER TABLE 表名 列名 类型 [first | after 原列名]
ALTER TABLE test ADD gender CHAR;

# 修改列名: ALTER TABLE 表名 change 原列名 新列名 原类型 新类型 [first | after 原列名]
ALTER TABLE test CHANGE gender sex VARCHAR(10);

# 修改列类型: ALTER TABLE 表名 MODIFY 列名 新类型 [first | after 原列名]
ALTER TABLE test MODIFY sex TINYINT;

# 删除列: ALTER TABLE 表名 drop 列名
ALTER TABLE test DROP sex;

# 修改表名: ALTER TABLE 表名 RENAME 新表名
ALTER TABLE test RENAME test1;

# 删除表: DROP TABLE IF EXISTS 表名
DROP TABLE IF EXISTS test1;

# 清空表中数据: TRUNCATE TABLE 表名
TRUNCATE TABLE test1;