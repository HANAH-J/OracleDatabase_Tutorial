-- 1. IF문을 사용하여 KING 사원의 부서번호를 얻어와서
-- 부서 번호에 따른 부서명을 출력하세요.
DECLARE
    k_dno employee.dno%type;
    k_dname department.dname%type;
BEGIN
    SELECT dno INTO k_dno
    FROM employee
    WHERE ename = 'KING';
    
    IF k_dno = 10 THEN
        k_dname := 'ACOOUNTING';
    ELSIF k_dno = 20 THEN
        k_dname := 'RESEARCH';
    ELSIF k_dno = 30 THEN
        k_dname := 'SALES';
    ELSE
        k_dname := 'OPERATIONS';
    END IF;
    dbms_output.put_line('부서번호  부서명');
    dbms_output.put_line(k_dno || '      ' || k_dname);
END;

DECLARE
    k_dno employee.dno%type;
    k_dname department.dname%type;
BEGIN
    SELECT dno INTO k_dno
    FROM employee
    WHERE ename = 'KING';
    
    SELECT dname INTO k_dname
    FROM department
    WHERE dno = k_dno;
    dbms_output.put_line('부서번호  부서명');
    dbms_output.put_line(k_dno || '      ' || k_dname);
END;

DECLARE
--    k_dno employee.dno%type;
    k_dname department.dname%type;
BEGIN
--    SELECT dno INTO k_dno
--    FROM employee
--    WHERE ename = 'KING';
    
    SELECT dname INTO k_dname
    FROM department
    WHERE dno = (SELECT dno
                FROM employee
                WHERE ename = 'KING');
    dbms_output.put_line('부서명' || k_dname);
END; ---

-- 2. BASIC LOOP문으로 1부터 10 사이의 자연수의 합을 구하여 출력하세요.
DECLARE
    i NUMBER := 1;
    tot NUMBER := 0;
BEGIN
    LOOP
        tot := tot + i;
        i := i + 1;
        EXIT WHEN i = 11;
    END LOOP;
    dbms_output.put_line('1부터 10 사이의 자연수의 합 : ' || tot);
END;

-- 3.  FOR LOOP문으로 1부터 10사이의 자연수의 합을 구하여 출력하세요.
DECLARE
    i NUMBER;
    tot NUMBER := 0;
BEGIN
    FOR i IN 1..10 LOOP
        tot := tot + i;
    END LOOP;
    dbms_output.put_line('1부터 10 사이의 자연수의 합 : ' || tot);
END;

-- 4. WHILE LOOP문으로 1부터 10사이의 자연수의 합을 구하여 출력하세요.
DECLARE
    i NUMBER := 1;
    tot NUMBER := 0;
BEGIN
    WHILE i <= 10 LOOP
        tot := tot + i;
        i := i + 1;
    END LOOP;
    dbms_output.put_line('1부터 10 사이의 자연수의 합 : ' || tot);
END;

-- 5. 사원 테이블에서 커미션이 NULL 아닌 사원의 사원번호, 이름, 급여를
-- 이름 기준으로 오름차순으로 정렬한 결과를 출력하세요.
DECLARE
    re_emp employee%rowtype;
    CURSOR c
    IS
    SELECT eno, ename, salary, commission 
    FROM employee;
BEGIN
    dbms_output.put_line('사원번호     이름     급여');
    FOR re_emp IN c LOOP
        EXIT WHEN c%NOTFOUND;
        IF re_emp.commission IS NOT NULL THEN
        dbms_output.put_line(re_emp.eno || '     ' || re_emp.ename || '     ' || re_emp.salary);
        END IF;
    END LOOP;
END;

DECLARE
    v_emp employee%rowtype;
    CURSOR e1
    IS
    SELECT * 
    FROM employee
    WHERE commission IS NOT NULL
    ORDER BY ename ASC;
BEGIN
    dbms_output.put_line('사원번호     이름     급여');
    FOR v_emp IN e1 LOOP
        dbms_output.put_line(v_emp.eno || '     ' || v_emp.ename || '     ' || v_emp.salary);
    END LOOP;
END;

SELECT eno, ename, salary, commission
FROM employee;

-- 6. 다음과 같은 테이블(Student)을 만들고 데이터를 입력한다.
CREATE TABLE student(
    sid NUMBER CONSTRAINT student_id_pj PRIMARY KEY,
    sname NVARCHAR2(5) CONSTRAINT student_sname_nn NOT NULL,
    kscore NUMBER(3) CONSTRAINT student_kscore_range CHECK(0 <= kscore AND kscore <= 100),
    escore NUMBER(3) CONSTRAINT student_escore_range CHECK(0 <= escore AND escore <= 100),
    mscore NUMBER(3) CONSTRAINT student_mscore_range CHECK(0 <= mscore AND mscore <= 100)
);

-- 1) 학번은 시퀀스(seq_stu_id)로 저장한다.
CREATE SEQUENCE seq_stu_id
NOCACHE;

INSERT INTO student
VALUES(seq_stu_id.nextval, '고길동', 78, 64, 82);
INSERT INTO student
VALUES(seq_stu_id.nextval, '김길동', 85, 71, 64);
INSERT INTO student
VALUES(seq_stu_id.nextval, '이길동', 74, 69, 57);
INSERT INTO student
VALUES(seq_stu_id.nextval, '박길동', 74, 77, 95);
INSERT INTO student
VALUES(seq_stu_id.nextval, '홍길동', 68, 95, 84);

COMMIT;

SELECT * FROM student;

ALTER TABLE student
DROP PRIMARY KEY CASCADE;
DROP TABLE student;

SELECT seq_stu_id.currval FROM dual;
SELECT seq_stu_id.nextval FROM dual;
DROP SEQUENCE seq_stu_id;

-- 2) 학생별 총점과 평균을 구하세요.
DECLARE
    sname_tot NUMBER;
    sname_avg NUMBER;
    s_sname student.sname%type;
    k_tot student.kscore%type;
    e_tot student.escore%type;
    m_tot student.mscore%type;
    CURSOR st
    IS
    SELECT sname, kscore, escore, mscore
    FROM student;
BEGIN
    dbms_output.put_line('학생명   총점   평균');
    OPEN st;
    LOOP
        FETCH st INTO s_sname, k_tot, e_tot, m_tot;
        EXIT WHEN st%NOTFOUND;
        sname_tot := (k_tot + e_tot + m_tot);
        sname_avg := ROUND((k_tot + e_tot + m_tot)/3, 2);
        dbms_output.put_line(s_sname || '   ' || 
                            sname_tot || '   ' || 
                            sname_avg);
    END LOOP;
    CLOSE st;
END;

-- 3) 과목별 총점과 평균을 구하세요.
DECLARE
    k_tot student.kscore%type;
    e_tot student.escore%type;
    m_tot student.escore%type;
    
    s_k_tot NUMBER := 0;
    s_e_tot NUMBER := 0;
    s_m_tot NUMBER := 0;
    CURSOR st
    IS
    SELECT kscore, escore, mscore
    FROM student;
BEGIN
    OPEN st;
    LOOP
        FETCH st INTO k_tot, e_tot, m_tot;
        EXIT WHEN st%NOTFOUND;
        s_k_tot := s_k_tot + k_tot;
        s_e_tot := s_e_tot + e_tot;
        s_m_tot := s_m_tot + m_tot;
    END LOOP;
    CLOSE st;
    dbms_output.put_line('과목    총점    평균');
    dbms_output.put_line('국어    ' || s_k_tot || '    ' || s_k_tot/5);
    dbms_output.put_line('영어    ' || s_e_tot || '    ' || s_e_tot/5);
    dbms_output.put_line('수학    ' || s_m_tot || '    ' || s_m_tot/5);
END;