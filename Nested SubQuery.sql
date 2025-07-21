--1] WAQTD NAME OF AN EMP EARNING 2ND MAX SAL. 
SELECT ENAME 
FROM SCOTT.EMP
WHERE SAL IN (SELECT MAX(SAL) 
                FROM SCOTT.EMP
                WHERE SAL< (SELECT MAX(SAL)
                          FROM SCOTT.EMP
                            ))

--2] WAQTD  NAME OF EMP WHO ARE EARNING MORE THAN WARD & WORKING 
--IN SAME DEPTNO AS THAT OF BLAKE & HIRED BEFORE TURNER. 
SELECT ENAME 
FROM SCOTT.EMP
WHERE SAL > (SELECT SAL
              FROM SCOTT.EMP
              WHERE ENAME = 'WARD') AND
               
               DEPTNO IN (SELECT DEPTNO
                           FROM SCOTT.EMP
                           WHERE ENAME = 'BLAKE') AND
            HIREDATE <(SELECT HIREDATE 
                        FROM SCOTT.EMP
                        WHERE ENAME = 'TURNER');

--3] WAQTD NAMES OF AN EMP HIRED AFTER SMITH, BEFORE MILLER & WORKING 
--IN SAME DESIGNATION AS THAT OF JONES IN SALES DEPTARTMENT. 
SELECT ENAME 
FROM SCOTT.EMP
WHERE HIREDATE >(SELECT HIREDATE 
                 FROM SCOTT.EMP
                 WHERE ENAME = 'SMITH') AND
     HIREDATE <(SELECT HIREDATE 
                 FROM SCOTT.EMP
                 WHERE ENAME = 'MILLER') AND
                 JOB IN (SELECT JOB
                 FROM SCOTT.EMP
                 WHERE ENAME = 'JONES')AND
        DEPTNO IN (SELECT DEPTNO 
                    FROM SCOTT.DEPT
                    WHERE DNAME = 'SALES');

-- WAQTD NAMES OF AN EMP EARNING LESS THAN KING & HIRED BEFORE 
--MILLER IN NEW YORK
SELECT ENAME 
FROM SCOTT.EMP
WHERE SAL < (SELECT SAL
              FROM SCOTT.EMP
              WHERE ENAME = 'KING') AND
            HIREDATE <(SELECT HIREDATE 
                        FROM SCOTT.EMP
                        WHERE ENAME = 'MILLER') AND
                         DEPTNO IN (SELECT DEPTNO 
                    FROM SCOTT.DEPT
                    WHERE LOC = 'NEW YORK');

--5
SELECT ENAME 
FROM SCOTT.EMP
WHERE SAL IN (SELECT MIN(SAL) 
                FROM SCOTT.EMP
                WHERE SAL >(SELECT MIN(SAL)
                          FROM SCOTT.EMP
                            WHERE SAL >(SELECT MIN(SAL)
                                    FROM SCOTT.EMP
                            )));

--6
SELECT LOC
FROM SCOTT.DEPT
WHERE DEPTNO IN(SELECT DEPTNO 
            FROM SCOTT.EMP
           WHERE SAL IN (SELECT MAX(SAL) 
                FROM SCOTT.EMP
                WHERE SAL <(SELECT MAX(SAL)
                          FROM SCOTT.EMP
                            WHERE SAL <(SELECT MAX(SAL)
                                    FROM SCOTT.EMP
                            ))));

--7 WAQTD NAMES OF EMP HIRED LAST. 
SELECT ENAME 
FROM SCOTT.EMP
WHERE HIREDATE = (SELECT MAX(HIREDATE)
                      FROM SCOTT.EMP
                      );


-- WRONG ANS NOT MATCHING WITH SIR :- SCOTT INSEAD ALLEN
--8  WAQTD NAME OF THE AN EMP HIRED 2ND. 
SELECT ENAME 
FROM SCOTT.EMP
WHERE HIREDATE IN (SELECT MAX(HIREDATE)
                      FROM SCOTT.EMP
                      WHERE HIREDATE <(SELECT MAX(HIREDATE)
                                    FROM SCOTT.EMP
                                    ));


   --9   
SELECT LOC 
FROM SCOTT.DEPT
WHERE DEPTNO IN( 
                SELECT DEPTNO 
                FROM SCOTT.EMP
                WHERE HIREDATE IN (SELECT MAX(HIREDATE)
                      FROM SCOTT.EMP
                      WHERE HIREDATE <(SELECT MAX(HIREDATE)
                                    FROM SCOTT.EMP
                                    )));             

--10
SELECT ENAME 
FROM SCOTT.EMP
WHERE SAL IN (SELECT MIN(SAL) 
                FROM SCOTT.EMP
                WHERE SAL >(SELECT MIN(SAL)
                          FROM SCOTT.EMP
                            WHERE SAL >(SELECT MIN(SAL)
                                    FROM SCOTT.EMP
                                      WHERE SAL >(SELECT MIN(SAL)
                                        FROM SCOTT.EMP
                                          WHERE SAL >(SELECT MIN(SAL)
                                           FROM SCOTT.EMP
                            )))));

--11
SELECT LOC
FROM SCOTT.DEPT
WHERE DEPTNO IN(SELECT DEPTNO 
            FROM SCOTT.EMP
           WHERE SAL IN (SELECT MIN(SAL) 
                FROM SCOTT.EMP
                WHERE SAL >(SELECT MIN(SAL)
                          FROM SCOTT.EMP)));

--12 WRONG ANS 2 ROWS
SELECT ENAME 
FROM SCOTT.EMP
WHERE SAL IN (SELECT MIN(SAL) 
                FROM SCOTT.EMP
                WHERE SAL >(SELECT MIN(SAL)
                          FROM SCOTT.EMP
                            WHERE SAL >(SELECT MIN(SAL)
                                    FROM SCOTT.EMP
                                      WHERE SAL >(SELECT MIN(SAL)
                                               FROM SCOTT.EMP
                                      ))));
                                       

--13  WAQTD DNAME OF EMP WHOSE NAME IS SMITH. 
SELECT DNAME 
FROM SCOTT.DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                     FROM SCOTT.EMP
                     WHERE ENAME ='SMITH');

--14  ] WAQTD DNAME, LOC OF THE EMP'S WHOSE NAME IS KING. 

SELECT DNAME ,LOC
FROM SCOTT.DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                     FROM SCOTT.EMP
                     WHERE ENAME ='KING');

--15
SELECT LOC
FROM SCOTT.DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                     FROM SCOTT.EMP
                     WHERE EMPNO = 7902);

--16
SELECT * 
FROM SCOTT.EMP
WHERE SAL > (SELECT SAL
              FROM SCOTT.EMP
              WHERE ENAME = 'SCOTT') AND
               JOB IN (SELECT JOB
                           FROM SCOTT.EMP
                           WHERE JOB = 'PRESIDENT') AND
            HIREDATE >(SELECT HIREDATE 
                        FROM SCOTT.EMP
                        WHERE ENAME = 'SMITH');