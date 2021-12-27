#第四章 运算符

#1.算术运算符： + - * / div(除)  %（mod）

SELECT 100,100+0,100-0,100+50
from DUAL

SELECT 100+'1' #在java语言中，结果是1001
from DUAL   #这里是101

SELECT 100+'a'  #此时将 'a'看做0处理
from DUAL

SELECT 100+NULL  #null值参与运算结果为 Null
from DUAL

#取模运算 ：% mod
SELECT 12%3,12%5,12 mod -5,-12%5,-12%-5
FROM DUAL

#练习：查询员工id为偶数的员工信息
SELECT employee_id,last_name,salary
FROM employees
WHERE employee_id %2=0;

#2.比较运算符
#2.1 =   安全等于<=>   不等于<> !=