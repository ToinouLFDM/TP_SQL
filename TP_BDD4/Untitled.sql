/*UPDATE emp
SET sal=sal+100
WHERE job='CLERK'*/
SELECT *
FROM DEPT;
/*INSERT INTO DEPT
VALUES (50,'COMPUTER','PARIS');
*/

/*CREATE TABLE PROMOTION(ENAME varchar(10), JOB varchar(9),SAL number(7,2),COMM number(7,2) );*/

/*INSERT INTO promotion (ENAME,JOB,SAL)
VALUES ('DUPONT','COMPUTER',2000);*/

/*DELETE FROM promotion
WHERE ename='DUPONT';*/

/*INSERT INTO promotion
SELECT ENAME,JOB,SAL,COMM
FROM emp
WHERE COMM>25;*/


/*DROP TABLE promotion;*/

/*CREATE TABLE PROMOTION
AS SELECT *
   FROM emp
   WHERE COMM>25;*/
   
/*UPDATE promotion
SET sal= sal- (sal/10)
WHERE DEPTNO in (Select deptno
                 FROM dept
                 WHERE loc='CHICAGO' or loc='NEW YORK');*/
           
/*DELETE FROM promotion
WHERE sal>1000 and deptno in (SELECT deptno
                             FROM dept
                             WHERE loc='NEW YORK' or loc='CHICAGO');*/
   
SELECT *
FROM promotion;


SELECT ename
FROM emp
WHERE comm is NULL and deptno in (SELECT deptno
                 FROM dept
                 WHERE loc='DALLAS');

SELECT COUNT(DISTINCT (ename)),AVG(SAL)
FROM emp;

SELECT COUNT(DISTINCT (job))
FROM emp;

SELECT AVG(SAL),MAX(SAL),MIN(SAL),(MAX(sal)-MIN(SAL))
FROM emp;



SELECT ename
FROM emp
WHERE SAL> (SELECT MIN(sal)
            FROM emp
            WHERE deptno =30);

/*SELECT deptno,min(sal)
FROM emp
GROUP BY deptno;*/

SELECT ename
FROM emp
WHERE SAL> (SELECT MAX(sal)
            FROM emp
            WHERE deptno =30);
            
SELECT loc
FROM dept
WHERE deptno not in (SELECT DISTINCT(deptno)
                     FROM emp);
                     
SELECT loc
FROM dept,emp
WHERE dept.deptno!=emp.deptno ;