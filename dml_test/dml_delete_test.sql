SELECT * FROM `students`

-- dml,学习update

-- 1.将年龄大于23的人删除
DELETE FROM students WHERE stu_age > 23;

-- 2.将学号为102并且年龄为23的人删除
DELETE FROM students WHERE stu_id_number = 102 AND stu_age = 23;

-- 3.将学号为100或年龄为15的人删除
DELETE FROM students WHERE stu_id_number = 100 OR stu_age = 15;

-- 4.将所有数据删除
DELETE FROM students;

-- delete删除和清空表truncate删除都会删除表中的全部数据,truncate不仅会删除表数据,也会删除数据库id的最大记录值