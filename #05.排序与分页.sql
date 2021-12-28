#第五章 排序与分页

#1.排序
#如果没有使用排序操作，默认情况下的查询返回的数据是按照添加数据的顺序显示

SELECT * FROM employees;

#练习：按照salary从高到低的顺序显示员工信息

#1.1基本使用
#使用 ORDER BY 对查询到的数据进行排序操作
#升序：ASC
#降序：DESC
SELECT employee_id,last_name,salary 
FROM employees
ORDER BY salary DESC;

SELECT employee_id,last_name,salary
from employees
ORDER BY salary ASC;

SELECT employee_id,last_name,salary
from employees
ORDER BY salary;#如果在ORDER BY后面没有显示的知名排列顺序，则按照升序排列

#我们可以使用列的别名，进行排序

#2.列的别名可以排序
#列的别名只能在 order by中使用，不能再where中使用
#如下操作会报错！！！
SELECT employee_id,salary,salary*12 annual_sal
FROM employees;
WHERE annual_sal>81600;

#3.强调格式：WHERE 需要声明在FROM后，ORDER BY之前
SELECT employee_id,salary
FROM employees;
WHERE deparment_id IN(50,60,70)
ORDER BY department_id DESC;

#04.二级排序

#练习：显示员工信息，按照department_id的降序排序，salary的升序排序
SELECT employee_id,salary,department_id
FROM employees 
ORDER BY department_id DESC,salary DESC;

#2.分页
#2.1 mysql使用limit实现数据的分页显示

#需求：每页显示20条记录，此时显示第一页

SELECT employee_id,last_name
FROM employees
LIMIT 0,20

#需求：每页显示20条记录，此时显示第二页
SELECT employee_id,last_name
FROM employees
LIMIT 20,20;

#需求：每页显示20条记录，此时显示第三页
SELECT employee_id,last_name
FROM employees
LIMIT 40,20;

#需求：每页显示pageSize条记录，此时显示第pageNo页
#公式：LIMIT (pageNo-1)*pageSize,pageSize;

#2.2 WHERE ...ORDER BY ...LIMIT 生命顺序如下

#LIMIT的格式：严格来说：limit 位置偏移量，条目数
#limit 0，条目数  ==   limit 条目数

SELECT employee_id,last_name,salary
FROM employees
WHERE salary>6000
ORDER BY salary DESC
#LIMIT 0,10;
LIMIT 10;

#练习：表里有107条数据，我们只想要显示第32，33条数据怎么办？
SELECT employee_id,last_name
FROM employees
LIMIT 31,2;

#2.3 MySQL8.0新特性：LIMIT...OFFSET...
SELECT employee_id,last_name
FROM employees
LIMIT 2 OFFSET 31;

#练习： 查询员工表中工资最高的员工信息
SELECT employee_id,last_name,salary
FROM employees
ORDER BY salary DESC
LIMIT 1;

#2.4 LIMIT 可以使用在mysql，pgsql,mariadb,sqlite等数据库中使用，表示分页
#不能使用在SQL Server,DB2,Oracle!

