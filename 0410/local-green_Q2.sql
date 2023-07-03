-- 1.다음 표에 명시된대로 DEPT 테이블을 생성하세요.
-- 칼럼명  데이터 타입  크기
-- DNO    number      2
-- DNAME  varchar2    14
-- LOC    varchar2    13
CREATE TABLE DEPT(
    DNO number(2),
    DNAME varchar2(14),
    LOC varchar2(13)
);

DESC DEPT;

-- 2. 다음 표에 명시된대로 EMP 테이블을 생성하세요.
-- 칼럼명  데이터 타입  크기
-- ENO    number      4
-- ENAME  varchar2    10
-- DNO    varchar2    2
CREATE TABLE EMP(
    ENO number(4),
    ENAME varchar2(10),
    DNO Number(2)
);

DESC EMP;

-- 3. 긴 이름을 저장할 수 있도록 EMP 테이블을 수정하세요. (ENAME 칼럼)
ALTER TABLE EMP 
MODIFY ENAME varchar(25);

-- 4. EMPLOYEE 테이블을 복사해서 EMPLOYEE2란 이름의 테이블을 생성하되
-- 사원번호, 이름, 급여, 부서번호 칼럼만 복사하고
-- 새로 생성된 칼럼명을 각각 EMP_ID, NAME, SAL, DEPT_ID로 지정하세요,
CREATE TABLE employee2
AS
SELECT eno EMP_ID, ename NAME, salary SAL, dno DEPT_ID
FROM employee;

CREATE TABLE employee2(EMP_ID, NAME, SAL, DEPT_ID)
AS
SELECT eno, ename, salary, dno 
FROM employee;

SELECT * FROM employee2;

-- 5. EMP 테이블을 삭제하세요.
DROP TABLE EMP;

-- 6. EMPLOYEE2 테이블의 이름을 EMP로 변경하세요.
RENAME employee2 TO EMP;

-- 7. DEPT 테이블에서 DNAME 칼럼을 제거하세요.
ALTER TABLE DEPT
DROP COLUMN DNAME;

-- 8. DEPT 테이블에서 LOC칼럼을 UNUSED로 표시하세요.
ALTER TABLE DEPT
SET UNUSED (LOC);

-- 9. UNUSED 칼럼을 모두 제거하세요.
ALTER TABLE DEPT
DROP UNUSED COLUMNS;