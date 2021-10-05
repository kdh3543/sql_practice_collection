
--1
select * from employee where hire_date > '90/01/01' and hire_date < '00/01/01';

--2
select * from employee where bonus is null;

--3
select * from employee where emp_id in(200, 201);

--4
select * from employee where emp_id in(200, 201, 202, 203);

--5
select * from employee where emp_name like '%��%';

--6
select emp_name, phone from employee where phone like '%010%';

--7
select * from employee where emp_no like '%12%' and substr(emp_no,8,1) = 1;

--8
select emp_name, emp_id, bonus, dept_code from employee
where dept_code is null;

--9
select emp_name, nvl(dept_code,0) from employee;

--10
select emp_name, emp_no, salary, hire_date from employee
where floor((sysdate - hire_date)/365) between 5 and 10;

--11
select emp_name, dept_code from employee
where ent_yn = 'Y';

--12
select emp_name, salary*1.5, floor((sysdate-hire_date)/365) �ټӳ��
from employee where floor((sysdate-hire_date)/365) >= 10
order by 3;

--13
select emp_name, emp_no, salary, nvl(dept_code,'����') from employee
where (salary between 2000000 and 3000000) and substr(emp_no,8,1) = 2;

--14
select emp_name, emp_no, email, phone, salary from employee
where (hire_date between '99/01/01' and '10/01/01') and salary <= 2000000;

--15
select emp_name, floor((sysdate - hire_date)/1000)*salary*0.1 Ư�����ʽ� 
from employee where substr(emp_no,8,1) = 1 and bonus is null;

--16
select emp_name, replace(email,'kh.or.kr','iei.or.kr') from employee;

--17
select emp_name, substr(emp_no,1,8)||'******' �ֹι�ȣ, 
salary*12 ����, emp_id from employee;

--18
select to_char(last_day(add_months(sysdate,1)),'yyyy/mm/dd(day)') from dual;

--19
select emp_name, to_char(hire_date,'yyyy"��"/mm"��"/dd"��"')
, ceil((sysdate-hire_date)/365)||'����' ���� from employee order by 2;

--20
select to_char(to_date(20881225), 'day') from dual;

--21
select emp_name, case when substr(emp_no,1,2) >=60 and substr(emp_no,1,2) <= 65 then '60���� �ʹ�'
when substr(emp_no,1,2) > 65 and substr(emp_no,1,2) <=69 then '60���� �Ĺ�' else '����'
end ��� from employee where substr(emp_no,1,2) between 60 and 69;

--22
select count(*) from employee where substr(emp_no,8,1) = 1;

--23
select max(salary) from employee where dept_code = 'D5';

--24
select emp_name, email, length(email) from employee;

--25
select emp_name, substr(email, 1, 5) from employee;

--26
select emp_name, substr(emp_no,1,2)||'���' ����, nvl(bonus,0) from employee
where substr(emp_no,1,2) between 60 and 69;

--27
select count(*) from employee where substr(phone,1,3) not like '010%';

--28
select emp_name, to_char(hire_date,'yyyy"��"mm"��"') �Ի��� from employee;

--29
select emp_name, substr(emp_no,1,8)||'******' �ֹι�ȣ from employee;

--30
select emp_name, job_code, to_char(salary*12,'L999,999,999') ���� from employee;

--31
select count(*) from employee where dept_code in ('D5','D9') 
and substr(hire_date,1,2) = 04;

--32
select emp_name, hire_date, floor(sysdate-hire_date) from employee;

--33
select min((substr(sysdate,1,2)+100-substr(emp_no,1,2))) ������������, 
max((substr(sysdate,1,2)+100-substr(emp_no,1,2))) ���帹������ from employee;

--34
select emp_name, dept_code, 
case when dept_code in('D5','D6','D9') then '�߱�'
else '�߱پ���' end from employee order by 2;

--35
select case when substr(emp_no,1,1) = 6 then '60����'
when substr(emp_no,1,1) = 7 then '70����'
when substr(emp_no,1,1) = 8 then '80����'
else '����' end ���, count(*) from employee 
group by case when substr(emp_no,1,1) = 6 then '60����'
when substr(emp_no,1,1) = 7 then '70����'
when substr(emp_no,1,1) = 8 then '80����'
else '����' end order by 1;

--36
select substr(emp_no,8,1) ����, count(*) from employee group by substr(emp_no,8,1);

--37
select emp_name, dept_title, job_name from employee e
join department d on (e.dept_code = d.dept_id)
join job j on (e.job_code = j.job_code);

--38
select to_char(to_date(20201225),'day') from dual;

--39
select emp_name, emp_no, dept_title, job_name from employee e
join department d on (e.dept_code = d.dept_id)
join job j on (e.job_code = j.job_code)
where substr(emp_no,1,1) = 7 and substr(emp_no,8,1) = 2 and emp_name like '��%';

--40
select emp_id, emp_name, dept_title from employee e join department d
on (e.dept_code = d.dept_id) where emp_name like '%��%';

--41
select emp_name, job_name, dept_code, dept_title from employee e
join job j on (e.job_code = j.job_code)
join department d on (e.dept_code = d.dept_id)
where dept_title like '�ؿܿ���%';

select * from department;
select * from location;
select * from national;
select * from employee;
--42
select emp_name, bonus, dept_title, national_code from employee e
join department d on (e.dept_code = d.dept_id)
join location l on (d.location_id = l.local_code) where bonus is not null;

--43
select emp_name, dept_title, job_name, national_code from employee e
join job j on (e.job_code = j.job_code)
join department d on (e.dept_code = d.dept_id)
join location l on (d.location_id = l.local_code) where dept_code = 'D2';

--44
select emp_name, dept_title, local_name, national_name from employee e
join department d on (e.dept_code = d.dept_id)
join location l on (d.location_id = l.local_code)
join national n on (l.national_code = n.national_code)
where n.national_code in('KO','JP');

--45
select e1.emp_name, e1.dept_code, e2.emp_name from employee e1
join employee e2 on(e1.dept_code = e2.dept_code) 
where e1.emp_name != e2.emp_name;

--46
select emp_name, job_name, salary from employee e
join job j on (e.job_code = j.job_code) where job_name = '����' and bonus is null;

--47
select ent_yn, count(*) from employee group by ent_yn;