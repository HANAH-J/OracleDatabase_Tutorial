-- 1. Equi 조인을 사용하여 SCOTT 사원의 부서번호와 부서이름을 출력하세요.
SELECT employee.ename, employee.dno, department.dname
FROM employee, department
WHERE employee.dno = department.dno
AND ename = 'SCOTT';

SELECT e.eno, e.ename, e.dno, d.dname
FROM employee e, department d
WHERE e.dno = d.dno
AND ename = 'SCOTT';

-- 2. Inner 조인과 on 연산자를 사용하여 사원이름과 함께
-- 그 사원이 소속된 부서이름과 지역명을 출력하세요.
SELECT e.ename, d.dname, d.loc
FROM employee e INNER JOIN department d
ON e.dno = d.dno;

-- 3. INNER 조인, Using 연산자를 사용하여 10번 부서에 속하는
-- 모든 담당업무의 고유목록을 부서의 지역명을 포함하여 출력하세요.
SELECT dno, job, loc
FROM employee e INNER JOIN department d
USING(dno)
WHERE dno = 10;

-- 4. Natural 조인을 사용하여 커미션을 받는 모든 사원의 이름, 부서이름, 지역명을 출력하세요.
SELECT ename, dname, loc
FROM employee NATURAL JOIN department
WHERE commission IS NOT NULL;

-- 5. Equal 조인과 Wild 카드를 사용해서
-- 이름에 A가 포함된 모든 사원의 이름과 부서명을 출력하세요.
SELECT ename, dname
FROM employee e, department d
WHERE e.dno = d.dno
AND ename LIKE '%A%';

-- 6. Natural 조인을 사용하여 NEW York에 근무하는
-- 모든 사원의 이름, 업무 부서번호 및 부서명을 출력하세요.
SELECT ename, job, dno, dname, loc 
FROM employee NATURAL JOIN department 
WHERE loc = 'NEW YORK';

-- 7. Self Join을 사용하여 사원의 이름 및 사원번호를 관리자이름 및 관리자번호와 함께 출력하세요.
-- 각 열의 별칭은 사원이름(Employee), 사원번호(emp#), 관리자이름(Manager), 관리자번호(Mgr#)
SELECT emp.ename "Employee", emp.eno "emp#", mng.ename "Manager", emp.manager "Mgr#"
FROM employee emp, employee mng
WHERE emp.manager = mng.eno;

-- 8. Outter 조인, self 조인을 사용하여 관리자가 없는 사원을 포함하여
-- 사원번호를 기준으로 내림차순 정렬하여 클릭하세요.
-- 각 열의 별칭은 사원이름(Employee), 사원번호(emp#), 관리자이름(Manager), 관리자번호(Mgr#)
SELECT e.ename "Employee", e.eno "emp#", m.ename "Manager", e.manager "Mgr#"
FROM employee e LEFT OUTER JOIN employee m
ON e.manager = m.eno
ORDER BY e.dno DESC;

SELECT emp.ename "Employee", emp.eno "emp#", mng.ename "Manager", emp.manager "Mgr#"
FROM employee emp, employee mng
WHERE emp.manager = mng.eno(+)
ORDER BY emp.eno DESC;

-- 9. Self 조인을 사용하여 지정한 사원(SCOTT)의 이름, 부서번호,
-- 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하세요.
-- 각 열의 별칭은 이름, 부서번호, 동료로 지정하세요.
SELECT e.ename "이름", e.dno "부서번호", c.ename "동료"
FROM employee e, employee c
WHERE e.dno = c.dno
AND e.ename = 'SCOTT'
AND c.ename <> 'SCOTT';

-- 10. Self 조인을 사용하여 WARD 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하세요.
SELECT c.ename, c.hiredate, e.ename, e.hiredate
FROM employee e, employee c
WHERE e.ename = 'WARD'
AND e.hiredate < c.hiredate
ORDER BY c.hiredate;

-- 11. Self 조인을 사용하여 관리자보다 먼저 입사한
-- 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사입과 함께 출력하세요.
-- 각 열의 별칭은 사원이름(Ename), 사원입사일(HIERDATE), 관리자이름(Ename), 관리자입사입(HIERDATE)로 출력하세요.
SELECT e.ename "Ename", e.hiredate "HIERDATE", m.ename "Ename", m.hiredate "HIERDATE"
FROM employee e, employee m
WHERE e.manager = m.eno
AND e.hiredate < m.hiredate;