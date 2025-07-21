-- 1]  WAQTD ENAME, DNAME of all the employees.
SELECT ENAME ,DNAME
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO;

-- 2] WAQTD ENAME, SAL & LOC of all the employees.
    SELECT ENAME ,SAL ,LOC
    FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
    ON E.DEPTNO = D.DEPTNO;

-- 3] WAQTD ENAME, DEPTNO & DNAME of all the employees. 
 SELECT ENAME ,D.DEPTNO ,DNAME
    FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
    ON E.DEPTNO = D.DEPTNO;

--4] WAQTD ENAME, DEPTNO & DNAME of employees working in 
--DEPTNO 20
 SELECT ENAME ,D.DEPTNO ,DNAME
    FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
    ON E.DEPTNO = D.DEPTNO
    where d.deptno = 20;


-- 5] WAQTD ENAME, DNAME of employees who are earning less than 
--Rs.2000. 
 SELECT ENAME ,DNAME
    FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
    ON E.DEPTNO = D.DEPTNO
    WHERE SAL<  2000;

-- 6] WAQTD ENAME, LOC of employees working in ‘DALLAS’. 
SELECT ENAME , LOC 
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE LOC = 'DALLAS'

-- 7 WAQTD ENAME, SAL & DNAME of employees whose name starts with 
--character ‘A’ & DNAME ends with character ‘S’. 
SELECT ENAME , SAL ,DNAME 
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE  ENAME LIKE 'A%' AND
  DNAME LIKE '%S';

  --8 WAQTD ENAME, SAL, DNAME of all the employees who are earning 
--more than ‘SCOTT’ in ‘ACCOUNTING’ department.
 SELECT ENAME , SAL ,DNAME 
 FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
 ON E.DEPTNO = D.DEPTNO
  WHERE SAL > (SELECT SAL
                FROM SCOTT.EMP
                WHERE ENAME = 'SCOTT') AND
                DNAME = 'ACCOUNTING';

-- NOT MATCH WITH SIR
--9] WAQTD number of employees hired before ‘ALLEN’ in ‘RESEARCH’ department using joins.
 SELECT COUNT(*) 
 FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
 ON E.DEPTNO = D.DEPTNO
 WHERE HIREDATE <(SELECT HIREDATE 
                   FROM SCOTT.EMP
                   WHERE  ENAME = 'ALLEN') AND
                   DNAME = 'RESEARCH';

--10 WAQTD maximum SAL given to the employees working in same 
-- designation as that of ‘BLAKE’ in ‘DALLAS’. 
SELECT MAX(SAL)
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB IN(SELECT JOB
             FROM SCOTT.EMP
             WHERE ENAME = 'BLAKE') AND
             LOC = 'DALLAS';

--11  WAQTD ENAME, HIREDATE & DNAME of employees hired in the 
-- month of ‘FEB’ & his DNAME must have second character as ‘A’. 
SELECT ENAME , HIREDATE ,DNAME 
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE HIREDATE LIKE '%FEB%' AND
DNAME LIKE '_A%' ;

--12   WAQTD ENAME earning more than ‘MILLER’ in ‘NEW YORK’ using both Sub-query & joins.
SELECT ENAME 
FROM SCOTT.EMP
WHERE  SAL > (SELECT SAL
               FROM SCOTT.EMP
               WHERE ENAME = 'MILLER') AND
               DEPTNO IN(SELECT DEPTNO
                          FROM SCOTT.DEPT
                          WHERE LOC = 'NEW YORK');

--13 WAQTD ENAME & DNAME of employee who is having exactly 4 
--characters in his name & his DNAME should have 2 consecutive 'CC'.
SELECT ENAME , DNAME 
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE ENAME LIKE '____' AND
  DNAME LIKE '%CC%';

  --14] WAQTD DNAME, ENAME & LOC of employees hired before 1981 in 
--‘DALLAS’. 
SELECT DNAME ,ENAME ,LOC
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE HIREDATE <= '31-DEC-1980' AND
LOC ='DALLAS'

--15] WAQTD ENAME, JOB, LOC of employees working in same 
--designation as that of ‘JONES’ in ‘CHICAGO’. 
SELECT ENAME , JOB , LOC
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB IN(SELECT JOB 
             FROM SCOTT.EMP
             WHERE ENAME = 'JONES') AND
             LOC = 'CHICAGO'

--16  WAQTD ENAME, LOC of employees who is searching same SAL as 
-- that of ‘SCOTT‘ in ‘DALLAS’ & he was hired in the month of ‘DEC’. 
SELECT ENAME , LOC 
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL = (SELECT SAL
            FROM SCOTT.EMP
            WHERE ENAME = 'SCOTT') AND
            LOC = 'DALLAS' AND
            HIREDATE  LIKE '%DEC%'

--17] WAQTD ENAME, DNAME of employees whose designation ends with 
--string ‘MAN’ & his name must have 2 consecutive ‘LL’. 
 SELECT ENAME ,DNAME
 FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB LIKE '%MAN' AND
ENAME LIKE '%LL%'

--18] WAQTD ENAME, DEPTNO & DNAME of employees working in same 
--designation as that of ‘SMITH’ in ‘NEW YORK’. 
SELECT ENAME , D.DEPTNO ,DNAME
 FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB IN (SELECT JOB
             FROM SCOTT.EMP
             WHERE ENAME = 'SMITH') AND
             LOC = 'NEW YORK'

-- 19] WAQTD ENAME & DNAME of employees hired after 1980 into 
--‘RESEARCH’ department & working as an ‘ANALYST’. 
SELECT ENAME , DNAME 
 FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE HIREDATE > '31-DEC-80' AND
DNAME = 'RESEARCH' AND 
JOB = 'ANALYST'

-- 20] WAQTD ENAME, SAL, LOC of employees whose SAL ends with 50 in 
--‘CHICAGO’ & his name must start with ‘M’ & ends with ‘N’. 
SELECT ENAME , SAL , LOC
 FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL LIKE '%50' AND
LOC = 'CHICAGO' AND
ENAME LIKE 'M%N'

--21 WAQTD ENAME, DNAME of employees earning less than ‘JAMES’ & 
--must be hired in the year 1980 in ‘DALLAS’.
SELECT ENAME , DNAME 
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL <(SELECT SAL 
            FROM SCOTT.EMP
            WHERE ENAME = 'JAMES') AND
            HIREDATE LIKE '%80' AND
            LOC = 'DALLAS'

--  * NOT SOLVED *
-- 22] WAQTD ENAME & DEPTNO & DNAME of employees working as 
--‘SALESMAN’ or ‘MANAGER’ in DEPTNO 20 or 30 & he must be earning 
--more than ‘WARD’ in ‘SALES’ or ‘RESEARCH’ department & he must get 
--commission. 
SELECT ENAME ,E.DEPTNO ,DNAME 
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB IN ('SALESMAN' , 'MANAGER') AND
  E.DEPTNO IN(20,30) AND
   SAL >(SELECT SAL 
         FROM SCOTT.EMP W INNER JOIN SCOTT.DEPT D1
         ON W.DEPTNO = D1.DEPTNO
         WHERE W.ENAME = 'WARD' 
          AND 
           DNAME IN('SALES' , 'RESEARCH') 
          ) AND
          COMM IS NOT NULL 
         

--23 WAQTD ENAME of the employees & their LOC of all the employees. 
SELECT ENAME ,LOC
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO

--24 WAQTD DNAME & SAL for all the employee working in  ‘ACCOUNTING‘ department. 
SELECT DNAME , SAL 
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE DNAME = 'ACCOUNTING'

-- sal value not matched
--25] WAQTD DNAME & ANNUALSAL for all employees whose SAL is more than Rs.2340. 
SELECT DNAME , SAL*12 AS ANNUALSAL
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL > 2340



--26] WAQTD ENAME & DNAME for employees having character ‘A’ in their DNAME. 
SELECT ENAME , DNAME
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE DNAME LIKE '%A%'

--27] WAQTD ENAME & DNAME for all the employees working as ‘SALESMAN’

SELECT ENAME , DNAME
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB = 'SALESMAN'

--28] WAQTD ENNAME, DNAME & JOB for all the employees whose JOB & DNAME starts with character ‘S’.
SELECT ENAME , DNAME , JOB
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB LIKE 'S%' AND
 DNAME LIKE 'S%'

 --29 WAQTD ENAME, DNAME & MGR for employees reporting to 7839. 
 SELECT ENAME , DNAME ,MGR
 FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE EMPNO IN(SELECT EMPNO 
                 FROM SCOTT.EMP 
                 WHERE MGR = 7839)
      
--30] WAQTD ENAME, DNAME & HIREDATE for employees hired after 83 
--into ‘ACCOUNTING’ or ‘RESEARCH’ department. 

 SELECT ENAME , DNAME ,HIREDATE
 FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE HIREDATE >'31-DEC-81' AND
DNAME IN ('ACCOUNTING' ,'RESEARCH')

--31] WAQTD ENAME, DNAME, COMMISSION & DEPTNO of the 
--employees who are getting COMM in DEPTNO 10 or 30. 
 SELECT ENAME , DNAME ,COMM ,E.DEPTNO
 FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE COMM IS NOT NULL AND
E.DEPTNO IN(10,30)

-- 32] WAQTD DNAME & EMPNO for all the employees whose EMPNO are (7839, 7902) & are working in LOC = ‘NEW YORK’. 
 SELECT  DNAME ,EMPNO
 FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE EMPNO IN(7839 , 7920) AND
LOC = 'NEW YORK'

--33] WAQTD ENAME & DNAME who are earning more than ‘SMITH’. 
 SELECT  ENAME ,DNAME
 FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO = D.DEPTNO AND
SAL > (SELECT SAL
       FROM SCOTT.EMP
       WHERE ENAME = 'SMITH')