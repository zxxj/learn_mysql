
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