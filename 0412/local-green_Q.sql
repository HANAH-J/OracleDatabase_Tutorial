-- 0. 아래 표를 사용해서 테이블을 만드세요.
-- 테이블명(emp01)
-- 컬럼명      자료형     크기
-- empno      number    4
-- ename      varchar2  10
-- hiredate   date

CREATE TABLE emp01(
    empno NUMBER(4),
    ename VARCHAR2(10),
    hiredate DATE
);

DESC emp01;

-- 1. 사원테이블의 사원번호가 자동으로 생성되도록 시퀀스를 생성하시오.
-- (시작값: 1, 증가값: 1, 최대값: 100000)
CREATE SEQUENCE eno_ex
START WITH 1
INCREMENT BY 1
MAXVALUE 100000
NOCYCLE
NOCACHE;

SELECT * FROM user_sequences;

SELECT ENO_EX.nextval FROM dual;
SELECT ENO_EX.currval FROM dual;
DROP SEQUENCE eno_ex;

-- 2. 사원번호를 시퀀스로부터 발급받아서 오른쪽 테이블에 데이터를 입력하세요.
-- 1) 사원이름: Julia, 입사일: sysdate
-- 2) 사원이름: Alice, 입사입: 2020/12/31
INSERT INTO emp01
VALUES(eno_ex.nextval, 'Julia', sysdate);
INSERT INTO emp01
VALUES(eno_ex.nextval, 'Alice', TO_DATE('2020-12-31', 'YYYY/MM/DD'));

SELECT * FROM emp01;

-- 3. EMP01 테이블의 이름 칼럼을 인덱스로 설정하되
-- 인덱스 이름을 IDX_EMP01_EName로 지정하세요.

-- 기본키나 유니크키의 제약조건을 붙이면 자동으로 인덱스가 붙는다.
-- 기본키X, 유니크키X 컬럼에 임의의 인덱스를 붙이는 쿼리
CREATE INDEX IDX_EMP01_EName 
ON emp01(ename);

DROP INDEX IDX_EMP01_EName;