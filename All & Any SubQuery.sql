--1.WAQTD NAME OF THE EMPLOYEES EARNING SALARY MORE 
--THAN THE SALESMAN. 

SELECT ENAME 
FROM SCOTT.EMP
WHERE SAL >ALL(SELECT SAL
             FROM SCOTT.EMP
             WHERE JOB ='SALESMAN');

--2 .WAQTD DETAILS OF THE EMPLOYEES HIRED AFTER ALL THE 
--CLERKS. 
-- not match
SELECT *
FROM SCOTT.EMP
WHERE HIREDATE >ALL(SELECT HIREDATE 
                  FROM SCOTT.EMP
                  WHERE JOB = 'CLARK');


--3 .WAQTD NAME AND SALARY FOR ALL THE EMPLOYEES IF THEY 
--ARE EARNING LESS THAN ATLEST A MANAGER. 
SELECT ENAME , SAL
from scott.emp
WHERE SAL <ANY(SELECT SAL
                 FROM SCOTT.EMP
                 WHERE JOB = 'MANAGER');

--.WAQTD NAME AND HIREDATE OF EMPLOYEES HIRED BEFORE 
--ALL THE MANAGERS.

SELECT ENAME ,HIREDATE
FROM SCOTT.EMP
WHERE HIREDATE <ALL(SELECT HIREDATE 
                      FROM SCOTT.EMP
                      WHERE JOB = 'MANAGER');

--5
SELECT ENAME
FROM SCOTT.EMP
WHERE HIREDATE >ALL(SELECT HIREDATE
                     FROM SCOTT.EMP
                     WHERE JOB = 'MANAGER') AND

                    SAL >ALL(SELECT SAL
                         FROM SCOTT.EMP
                         WHERE JOB = 'CLERKS');

--6.WAQTD DETAILS OF THE EMPLOYEES WORKING AS CLERK 
--AND HIRED BEFORE ATLEST A SALESMAN. 
SELECT *
FROM SCOTT.EMP
WHERE JOB = 'CLERK' AND
    HIREDATE <ANY(SELECT HIREDATE 
                FROM SCOTT.EMP
                WHERE JOB = 'SALESMAN' );

--7
SELECT *
FROM SCOTT.EMP
WHERE DEPTNO IN (SELECT DEPTNO
                 FROM SCOTT.DEPT
                 WHERE DNAME IN('ACCOUNTING' ,'SALES'))

--8
SELECT DNAME 
FROM SCOTT.DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                  FROM SCOTT.EMP
                  WHERE ENAME IN('SMITH' ,'KING' ,'MILLER'))

--9
SELECT *
FROM SCOTT.EMP
WHERE DEPTNO IN (SELECT DEPTNO
                 FROM SCOTT.DEPT
                 WHERE LOC IN('NEW YORK' ,'CHICAGO'))

--10
SELECT ENAME 
FROM SCOTT.EMP
WHERE HIREDATE >ALL(SELECT HIREDATE 
                     FROM SCOTT.EMP
                     WHERE DEPTNO = 10);