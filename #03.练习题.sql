# 1.查询员工12个月的工资总和，并起别名为ANNUAL SALARY
SELECT employee_id,last_name,salary*12 "ANNUAL SALARY" from employees  WHERE first_name='Patrick'

SELECT *from employees

SELECT employee_id,last_name,salary*12*(IFNULL(commission_pct,0)) "ANNUAL SALARY" from employees WHERE first_name='Patrick'
 
# 2.查询employees表中去除重复的job_id以后的数据
SELECT DISTINCT job_id from employees ;
# 3.查询工资大于12000的员工姓名和工资
SELECT last_name,salary from employees WHERE salary>12000;
# 4.查询员工号为176的员工的姓名和部门号
SELECT last_name,department_id from employees WHERE employee_id='176'
# 5.显示表 departments 的结构，并查询其中的全部数据
desc departments;
SELECT * from departments;
