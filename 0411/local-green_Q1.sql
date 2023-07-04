-- 1. Employee 테이블의 구조를 복사하여 EMP_SAMPLE란 이름의 테이블을 만드세요.
-- 사원 테이블의 사원번호 칼럼에 테이블 레벨로 primary key 제약조건을 지정하되
-- 제약조건 이름은 my_emp_pk로 지정하세요.
SELECT * FROM EMP_SAMPLE;
DROP TABLE EMP_SAMPLE;

CREATE TABLE EMP_SAMPLE
AS
SELECT * FROM employee WHERE 1=0;

ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT my_emp_pk PRIMARY KEY(eno);

-- 2. department 테이블의 구조를 복사하여 dept_sample이란 테이블을 만드세요.
-- dept_sample의 부서번호 칼럼에 테이블 레벨로 primary key 제약조건을 지정하되
-- 제약조건 이름은 my_dept_pk로 지정하세요.
SELECT * FROM dept_sample;
DROP TABLE dept_sample;

CREATE TABLE dept_sample
AS
SELECT * FROM department WHERE 1=0;

ALTER TABLE dept_sample
ADD CONSTRAINT my_dept_pk PRIMARY KEY(dno);

-- 3. 사원테이블의 부서번호 칼럼에 존재하지 않는 부서의 사원이 배정되지 않도록
-- 외래키 제약조건을 지정하되 제약조건 이름은 my_emp_dept_fk로 지정하세요.
ALTER TABLE EMP_SAMPLE
DROP PRIMARY KEY;

SELECT dno, ename FROM EMP_SAMPLE;
UPDATE EMP_SAMPLE
SET dno = 20
WHERE dno IS NULL;

ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT my_emp_pk PRIMARY KEY(dno);

ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT my_emp_dept_fk FOREIGN KEY(dno) REFERENCES dept_sample(dno);

-- 4. 사원테이블의 커미션 컬럼에 0보다 큰 값만을 입력할 수 있도록 제약조건을 지정하세요.
ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT emp_commission_min CHECK (0 < commission);