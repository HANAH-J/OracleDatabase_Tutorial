DROP TABLE EMPLOYEE;
DROP TABLE DEPARTMENT;
DROP TABLE SALGRADE;

CREATE TABLE DEPARTMENT
        (DNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
         DNAME VARCHAR2(14),
	 LOC   VARCHAR2(13) ) ;
CREATE TABLE EMPLOYEE 
        (ENO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	 ENAME VARCHAR2(10),
 	 JOB   VARCHAR2(9),
	 MANAGER  NUMBER(4),
	 HIREDATE DATE,
	 SALARY NUMBER(7,2),
	 COMMISSION NUMBER(7,2),
	 DNO NUMBER(2) CONSTRAINT FK_DNO REFERENCES DEPARTMENT);
CREATE TABLE SALGRADE
        (GRADE NUMBER,
	 LOSAL NUMBER,
	 HISAL NUMBER );

INSERT INTO DEPARTMENT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPARTMENT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPARTMENT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPARTMENT VALUES (40,'OPERATIONS','BOSTON');

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','CLERK',    7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7499,'ALLEN','SALESMAN', 7698,to_date('20-2-1981', 'dd-mm-yyyy'),1600,300,30);
INSERT INTO EMPLOYEE VALUES
(7521,'WARD','SALESMAN',  7698,to_date('22-2-1981', 'dd-mm-yyyy'),1250,500,30);
INSERT INTO EMPLOYEE VALUES
(7566,'JONES','MANAGER',  7839,to_date('2-4-1981',  'dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981', 'dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMPLOYEE VALUES
(7698,'BLAKE','MANAGER',  7839,to_date('1-5-1981',  'dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMPLOYEE VALUES
(7782,'CLARK','MANAGER',  7839,to_date('9-6-1981',  'dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMPLOYEE VALUES
(7788,'SCOTT','ANALYST',  7566,to_date('13-07-1987', 'dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7839,'KING','PRESIDENT', NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMPLOYEE VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981',  'dd-mm-yyyy'),1500,0,30);
INSERT INTO EMPLOYEE VALUES
(7876,'ADAMS','CLERK',    7788,to_date('13-07-1987', 'dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7900,'JAMES','CLERK',    7698,to_date('3-12-1981', 'dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMPLOYEE VALUES
(7902,'FORD','ANALYST',   7566,to_date('3-12-1981', 'dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7934,'MILLER','CLERK',   7782,to_date('23-1-1982', 'dd-mm-yyyy'),1300,NULL,10);

INSERT INTO SALGRADE VALUES (1, 700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

COMMIT;


-- 주석
DESC employee;

SELECT sysdate FROM dual;

SELECT eno, ename, job, manager, salary FROM employee;

SELECT * FROM GREEN01.employee;

SELECT eno, ename, salary, salary*12 FROM employee;

SELECT eno, ename, salary, salary*12+commission FROM employee;

SELECT eno, ename, 
salary, salary*12+NVL(commission,0) "연 봉" 
FROM employee;

SELECT DISTINCT dno, ename FROM employee;

--------------------------------------------------
-- WHERE 조건절
-- 예시 급여가 1500 이상인 사람 정보
SELECT * FROM employee 
WHERE salary >= 1500;

-- 예시 사원 이름이 SCOTT인 사람의 사원번호, 이름, 급여 조회
SELECT eno, ename, salary FROM employee 
WHERE ename='SCOTT';

SELECT eno, ename, salary FROM employee 
WHERE ename>'SCOTT';

-- 입사일이 1981.01.01 이전인 사람의 모든 정보 출력
SELECT * FROM employee
WHERE hiredate <= '1981/01/01';

-- 급여가 1000에서 1500 사이인 사원의 모든 정보 조회
SELECT * FROM employee 
WHERE salary >= 1000 AND salary <= 1500;

-- 급여가 1000 미만이거나 1500 초과인 사원을 모든 정보 조회
SELECT * FROM employee 
WHERE salary < 1000 OR salary > 1500;

SELECT * FROM employee 
WHERE NOT (salary >= 1000 AND salary <= 1500);

-- 커미션이 300 이거나 500이거나 1400인 사원을 모든 정보 조회
SELECT * FROM employee 
WHERE commission = 300 OR commission = 500 OR commission = 1400;

-- 급여가 1000에서 1500 사이인 사원의 모든 정보 조회
SELECT * FROM employee 
WHERE salary BETWEEN 1000 AND 1500;

-- 급여가 1000 미만이거나 1500 초과인 사원의 모든 정보 조회
SELECT * FROM employee 
WHERE salary NOT BETWEEN 1000 AND 1500;

-- 입사년도가 1982년인 사원의 모든 정보를 조회하는 예
SELECT * FROM employee 
WHERE hiredate BETWEEN '1982/01/01' AND '1982/12/31';

-- 커미션이 300 이거나 500이거나 1400인 사원의 모든 정보 조회
SELECT * FROM employee 
WHERE commission IN (300, 500, 1400);

-- 사원 이름이 'F'로 시작하는 사원의 모든 정보 조회
SELECT * FROM employee 
WHERE ename LIKE 'F%';

-- 사원 이름이 'F'로 시작하지 않는 사원의 모든 정보 조회
SELECT * FROM employee 
WHERE ename NOT LIKE 'F%';

-- 사원 이름에 'M'이 포함된 사원의 모든 정보 조회
SELECT * FROM employee 
WHERE ename LIKE '%M%';

-- 사원 이름이 'N'으로 끝나는 사원의 모든 정보 조회
SELECT * FROM employee 
WHERE ename LIKE '%N';

-- 사원 이름의 두 번째 글자가 A인 사원의 모든 정보 조회
SELECT * FROM employee 
WHERE ename LIKE '_A%';

-- 사원 이름의 세 번째 글자가 A인 사원의 모든 정보 조회
SELECT * FROM employee 
WHERE ename LIKE '__A%';

-- 커미션이 NULL인 사원의 모든 정보 조회
SELECT * FROM employee 
WHERE commission is null;

-- 커미션이 NULL이 아닌 사원의 모든 정보 조회
SELECT * FROM employee 
WHERE commission is not null;

-- 급여를 기준으로 오름차순 정렬
SELECT * FROM employee 
ORDER BY salary ASC;

SELECT * FROM employee 
ORDER BY salary;

-- 급여를 기준으로 내림차순 정렬
SELECT * FROM employee 
ORDER BY salary DESC;

-- 이름을 기준으로 오름차순 정렬
SELECT * FROM employee 
ORDER BY ename ASC;

-- 입사일 기준으로 내림차순 정렬
SELECT * FROM employee 
ORDER BY hiredate DESC;

-- 급여를 기준으로 오름차순 정렬
-- 동일한 급여를 받는 사람은 이름을 기준으로 내림차순 정렬
SELECT * FROM employee 
ORDER BY salary ASC, ename DESC;

SELECT * FROM employee 
WHERE salary >= 0
ORDER BY ename;

--------------------------------------------------
-- 타입
-- 문자열 변환 함수 to_char()
SELECT ename, hiredate, 
TO_CHAR(hiredate, 'YY-MM'), TO_CHAR(hiredate, 'YY-MM-DD DAY'), 
TO_CHAR(hiredate, 'YY-MM-DD DAY AM HH:MI:SS') 
FROM employee;

SELECT TO_CHAR(12345, '0000000') FROM dual;
-- 0012345
SELECT TO_CHAR(12345, '9999999') FROM dual;
-- 12345
SELECT TO_CHAR(12345, 'L9,999,999') FROM dual;

--------------------------------------------------
-- 문자를 날짜로
SELECT * FROM employee
WHERE hiredate = TO_DATE('19810220', 'YYYYMMDD');

-- 문자를 숫자로
SELECT '10000' - '5000' FROM dual;
SELECT TO_NUMBER ('10,000', '999,999') - TO_NUMBER('5,000', '999,999') FROM dual;

--------------------------------------------------
-- 내장 함수
-- 문자열 함수
SELECT ASCII('b') FROM dual;
SELECT ASCII('W') FROM dual;

SELECT CHR('87') FROM dual;
SELECT CHR('98') FROM dual;

-- 한글 -> 유니코드
SELECT ASCIISTR('응') FROM dual;

-- 유니코드 -> 한글
SELECT UNISTR('\C751') FROM dual;

-- 문자열 길이를 알려주는 함수
SELECT LENGTH('apple') FROM dual;
SELECT LENGTH('apple pen') FROM dual;

SELECT LENGTH('자바 스크립트') FROM dual;

SELECT LENGTHB('apple') FROM dual;
SELECT LENGTHB('자바') FROM dual;
SELECT LENGTHB('자바 스크립트') FROM dual;

SELECT ename, LENGTH(ename) FROM employee;

-- 문자열 결합
SELECT CONCAT('그린', '아카데미') FROM dual;
SELECT '고길동'||'씨 안녕하세요' FROM dual;

SELECT INSTR('고길동씨 안녕하세요. 황길동씨 반갑습니다.', '황길동') FROM dual;

SELECT INSTR('고길동씨 안녕하세요. 고길동씨 반갑습니다.', '고길동', 5) FROM dual;

SELECT REPLACE('고길동씨 안녕하세요. 황길동씨 반갑습니다.', '황길동', '또치') FROM dual;

SELECT REPLACE(ename||'씨 반갑습니다.', '씨', '님') FROM employee;

SELECT TRANSLATE('고길동씨 안녕하세요. 황길동씨 반갑습니다.', '황길동', '뽀로로') FROM dual;

SELECT LTRIM('     1234') FROM dual;
SELECT RTRIM('1234     ') FROM dual;
SELECT TRIM('     1234     ') FROM dual;

SELECT TRIM(LEADING 'ㅋ' FROM 'ㅋㅋㅋㅋ만나서 반가워ㅋㅋㅋㅋ') FROM dual;
SELECT TRIM(TRAILING 'ㅋ' FROM 'ㅋㅋㅋㅋ만나서 반가워ㅋㅋㅋㅋ') FROM dual;
SELECT TRIM(BOTH 'ㅋ' FROM 'ㅋㅋㅋㅋ만나서 반가워ㅋㅋㅋㅋ') FROM dual;

SELECT RPAD('안녕', 10, 'ㅋ') FROM dual;
-- 글자 길이를 10 바이트 만큼 늘리고 오른쪽을 'ㅋㅋ'로 채운다.

SELECT SUBSTR('고길동', 2, 2) FROM dual;

-- 날짜 시간 함수
SELECT sysdate - 5 FROM dual;

SELECT ADD_MONTHS('2023-04-05', 5), ADD_MONTHS('2023-04-05', -5) FROM dual;

SELECT LAST_DAY(sysdate) FROM dual;

SELECT NEXT_DAY(sysdate, '월요일') FROM dual;
-- 요일에 해당하는 숫자
-- 일:1, 월:2, 화:3, 수:4, 목:5, 금:6, 토:7
SELECT NEXT_DAY(sysdate, 2) FROM dual;

SELECT MONTHS_BETWEEN(sysdate, '1994-02-22') FROM dual;

-- 날짜 반올림
-- 연 단위 반올림 기준: 7월 1일
SELECT ROUND(TO_DATE('2023/04/17', 'YYYY/MM/DD'),'YEAR') FROM dual;
-- 2023/01/01

SELECT ROUND(TO_DATE('2023/08/15', 'YYYY/MM/DD'),'YEAR') FROM dual;
-- 2024/01/01

--월 단위 반올림 기준: 16일
SELECT ROUND(TO_DATE('2023/04/07', 'YYYY/MM/DD'),'MONTH') FROM dual;
-- 2023/04/01

SELECT ROUND(TO_DATE('2023/04/20', 'YYYY/MM/DD'),'MONTH') FROM dual;
-- 2023/05/01

--분기 단위 반올림 기준: 중간 달 16일
SELECT ROUND(TO_DATE('2023/04/07', 'YYYY/MM/DD'),'Q') FROM dual;
-- 2023/04/01

SELECT ROUND(TO_DATE('2023/06/07', 'YYYY/MM/DD'),'Q') FROM dual;
-- 2023/07/01

-- 일 단위 반올림 기준: 낮 12시
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
SELECT sysdate FROM dual;
SELECT ROUND(TO_DATE('2023/04/07 10:30:15', 'YYYY/MM/DD HH24:MI:SS'),'DDD') FROM dual;
-- 2023/04/07 00:00:00

SELECT ROUND(TO_DATE('2023/04/07 14:30:15', 'YYYY/MM/DD HH24:MI:SS'),'DDD') FROM dual;
-- 2023/04/08 00:00:00

-- 시 기준 반올림 기준: 30분
SELECT ROUND(TO_DATE('2023/04/07 10:20:15', 'YYYY/MM/DD HH24:MI:SS'),'HH') FROM dual;
-- 2023/04/07 10:00:00

SELECT ROUND(TO_DATE('2023/04/07 10:40:15', 'YYYY/MM/DD HH24:MI:SS'),'HH') FROM dual;
-- 2023/04/07 11:00:00

SELECT NUMTODSINTERVAL(12.764, 'DAY') FROM dual;
SELECT NUMTODSINTERVAL(18772, 'HOUR') FROM dual;
SELECT NUMTODSINTERVAL(18772, 'MINUTE') FROM dual;
SELECT NUMTODSINTERVAL(18772, 'SECOND') FROM dual;

SELECT NUMTOYMINTERVAL(12.764, 'YEAR') FROM dual;
SELECT NUMTOYMINTERVAL(187, 'MONTH') FROM dual;

-- 기타 함수
-- 컬럼의 데이터가 NULL인지 아닌지 체크하고 대체 데이터로 교체
SELECT commission, 
NVL(commission, 0), 
NVL2(commission, '보너스', '대상아님') 
FROM employee;

SELECT ename, job, NULLIF(job, 'MANAGER') 
FROM employee;
-- NULLIF: 같으면 null, 다르면 1번 값 출력

SELECT ename, COALESCE(commission, salary, 0) 
FROM employee;

-- DECODE: 함수로 조건식(switch ~ case)을 사용하고 싶을 때
SELECT ename, dno, DECODE(dno, 10, '회계', 
                              20, '연구', 
                              30, '영업', 
                              40, '총무',
                              '대기발령') AS "부서명"
FROM employee;

-- CASE ~ WHEN ~ 구문 (if ~ else if ~)
SELECT ename, dno, 
    CASE
        WHEN dno=10 THEN '회계'
        WHEN dno=20 THEN '연구'
        WHEN dno=30 THEN '영업'
        WHEN dno=40 THEN '총무'
        ELSE '대리발령'
    END AS "부서명"
FROM employee;