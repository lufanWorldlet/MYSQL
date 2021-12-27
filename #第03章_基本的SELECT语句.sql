#第03章_基本的SELECT语句

#1.sql的分类
/*
DDL：数据定义语言
CREATE(创建)\ALTER（修改）\DROP(删除结构)\RENAME\TRUNCATE清空表，但是表结构还在

DML：数据操作语言 
INSERT\DELETE（删一条记录）\UPDATE\SELECT
增删改查

DCL：数据控制语言
COMMIT\ROLLBACK(回滚){事务}\SAVEPOINT\GRANT\REVOKE


学习技巧：大处着眼，小处着手
*/
/*
2.1 SQL的规则 ---必须要遵守

2.2 SQL的规范 ---建议遵守

3.Mysql的三种注释的方式


*/
USE dbtest1;

SELECT *FROM employees;
INSERT INTO employees VALUES(1004,"二狗子")
SELECT *FROM employees;
SHOW CREATE table employees; 

/*
4.导入现有的数据表，表的数据
方式1： source文件的全路径名

source D:\workspace_mysql

方式2： 基于具体的图形化界面工具可以导入数据


*/

SELECT * FROM employees

#5.最基本的select语句：SELECT 字段1，字段2...FROM 表明
SELECT 1+1,3+2 FROM DUAL; #dual：伪表
# *表中所有的字段（或列）
select *from employees
SELECT employee_id,last_name,salary FROM employees;

#6.列的别名  通过查询语句查询，得到的结果叫做结果集

#as全程：alias（别名），可以省略
#列的别名可以使用一对双引号引起来,不要使用单引号
SELECT employee_id emp_id,last_name AS lname,department_id "dept_id",
salary*12 "annual salary"
FROM employees;

#7.去除重复行

SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;

#错误的：
SELECT salary,DISTINCT department_id FROM employees;
#仅仅是没有报错，但是没有实际意义
SELECT DISTINCT salary, department_id FROM employees;

#8.空值参与运算
#1.空值：Null
#2.null不等同于0，''，，null
SELECT * from employees;

#3.空值参与运算:结果一定也为空
SELECT employee_id,salary "月工资",salary*(1+commission_pct)*12 "年工资",commission_pct from employees
#解决方案  把null弄成0
SELECT employee_id,salary "月工资",salary*(1+IFNULL(commission_pct,0)commission_pct)*12 "年工资",commission_pct from employees

#9.着重号 '',强调自己是表名而不是关键字
SELECT * from `order`

#10.查询常数
SELECT '尚硅谷',123,employee_id,last_name FROM employees;

#11.显示表结构(查看表结构)
DESCRIBE employees #显示了表中字段的详细信息
DESC employees

#12.过滤数据
SELECT * FROM employees#过滤条件
WHERE department_id=90;

#练习
SELECT * from employees WHERE last_name='King';

