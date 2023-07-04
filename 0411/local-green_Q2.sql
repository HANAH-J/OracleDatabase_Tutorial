-- 1. 20번 부서에 소속된 사원의 사원번호와 이름, 부서번호를 출력하는
-- SELECT문을 하나의 뷰(v_em_dno)로 정의하세요.
CREATE OR REPLACE VIEW v_em_dno
AS
SELECT eno, ename, dno
FROM employee
WHERE dno = 20;

SELECT * FROM v_em_dno;

-- 2. 이미 생성된 뷰(v_em_dno)에 대해서 급여와 담당업무 역시 출력할 수 있도록 수정하세요.
CREATE OR REPLACE VIEW v_em_dno
AS
SELECT eno, ename, dno, salary, job
FROM employee
WHERE dno = 20;

SELECT * FROM v_em_dno;

-- 3. 담당업무별로 최대급여, 최소급여, 급여총액을 보여주는
-- 뷰(EMP_group_job)를 생성한 다음 조회해본다.
CREATE OR REPLACE VIEW EMP_group_job
AS
SELECT job, MAX(salary) max, MIN(salary) min, SUM(salary) sum
FROM employee
WHERE job IS NOT NULL
GROUP BY job;

SELECT * FROM EMP_group_job;
DROP VIEW EMP_group_job;

-- 4. 이미 생성된 뷰(v_em_dno)를 통해서 접근 가능한 데이터만 입력 가능하도록 제약을 걸어본다.
CREATE OR REPLACE VIEW v_em_dno
AS
SELECT eno, ename, dno, salary, job
FROM employee
WHERE dno = 20 WITH CHECK OPTION;

SELECT * FROM v_em_dno;

-- 5. 다음 데이터를 뷰(v_em_dno)를 통해서 입력을 한 뒤 뷰(EMP_group_job)를 통해서 조회해본다.
INSERT INTO v_em_dno
VALUES(5100, 'Belita', 10, 1500, 'CLERK');  -- 부서번호
INSERT INTO v_em_dno
VALUES(5200, 'Erica', 20, 2300, 'ANALYST');
INSERT INTO v_em_dno
VALUES(5300, 'Kali', 30, 1750, 'SALESMAN'); -- 부서번호
INSERT INTO v_em_dno
VALUES(5400, 'Mia', 20, 950, 'ANALYST');
INSERT INTO v_em_dno
VALUES(5500, 'Zinna', 10, 1050, 'CLERK');   -- 부서번호

SELECT * FROM EMP_group_job;

-- 6. 이미 생성된 뷰(v_em_dno)에 대해서 읽기전용 속성을 부여해보자.
CREATE OR REPLACE VIEW v_em_dno
AS
SELECT eno, ename, dno, salary, job
FROM employee
WHERE dno = 20 WITH READ ONLY;

-- 7. 사번, 사원이름, 부서번호와 부서이름을 보여주는 뷰(emp_dept)를 생성하세요.
CREATE OR REPLACE VIEW emp_dept
AS
SELECT eno, ename, dno, dname
FROM employee NATURAL JOIN department;

-- 8. 생성된 모든 뷰를 조회하세요. (데이터 사전에서 뷰를 찾아보세요.)
SELECT * FROM user_views;

SELECT * FROM v_em_dno;
SELECT * FROM EMP_group_job;
SELECT * FROM emp_dept;

-- 9. 생성된 뷰(v_em_dno,emp_group_job,emp_dept)를 제거하세요.
DROP VIEW v_em_dno;
DROP VIEW EMP_group_job;
DROP VIEW emp_dept;