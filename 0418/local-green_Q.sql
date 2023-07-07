-- 1. 사원 테이블에서 커미션이 NULL이 아닌 상태의
-- 사원 번호와 이름, 급여를 기준으로
-- 오름차순 정렬한 결과를 나타내는 저장 프로시저를 생성하세요.

SELECT * FROM employee;

CREATE OR REPLACE PROCEDURE p_commission
IS
    CURSOR p_c
    IS
    SELECT * FROM employee
    WHERE commission IS NOT NULL
    ORDER BY eno, ename, salary ASC;
BEGIN
    dbms_output.put_line('사원번호    이름    급여');
    FOR v_emp IN p_c LOOP
        EXIT WHEN p_c%NOTFOUND;
        dbms_output.put_line(v_emp.eno || '    ' || v_emp.ename || '    ' || v_emp.salary);
    END LOOP;
END;

EXECUTE p_commission;
DROP PROCEDURE p_commission;

-- 2. 저장 프로시저를 수정하여 커미션 컬럼을 하나 더 출력하고
-- 이름을 기준으로 내림차순으로 정렬하세요.
CREATE OR REPLACE PROCEDURE p_commission
IS
    CURSOR p_c
    IS
    SELECT * FROM employee
    WHERE commission IS NOT NULL
    ORDER BY ename DESC;
BEGIN
    dbms_output.put_line('사원번호    이름    급여    커미션');
    FOR v_emp IN p_c LOOP
        EXIT WHEN p_c%NOTFOUND;
        dbms_output.put_line(v_emp.eno || '       ' || 
                            v_emp.ename || '    ' || 
                            v_emp.salary || '    ' || 
                            v_emp.commission);
    END LOOP;
END;

-- 3. 생성된 저장 프로시저를 제거하세요.
DROP PROCEDURE p_commission;