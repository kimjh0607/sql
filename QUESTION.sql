-- 1. ��� ����� �̸�(FIRST_NAME, LAST_NAME)�� ��ȸ�϶�.
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES;
-- 2. ��� ����� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES;
-- 3. ��� ���� ���� ��ȸ�϶�.
SELECT CITY FROM  LOCATIONS;
-- 4. �̸�(FIRST_NAME)�� M ���� �����ϴ� ����� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE LIKE = 'M%' ;
-- 5. �̸�(FIRST_NAME)�� �� ��° ���ڰ� 'a'�� ����� �̸�(FIRST_NAME)�� ������ ��ȸ�϶�.
SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE FIRST_NAME LIKE '%_a%';
-- 6. ���� ���� �������� �����϶�.
SELECT CITY FROM  LOCATIONS ORDER BY CITY ASC;
-- 7. �μ� ���� �������� �����϶�.
SELECT DEPARTMENT_NAME FROM DEPARTMENTS ORDER BY DEPARTMENT_NAME DESC;
-- 8. ������ 7000 �̻��� ������� ��� ������ ������(��������)���� �����϶�.
SELECT * FROM EMPLOYEES WHERE SALARY>=7000 ORDER BY SALARY ASC;
-- 9. �μ�Ƽ��(COMMISSION_PCT)�� ���� �ʴ� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NULL; 
-- 10. �μ�Ƽ��(COMMISSION_PCT)�� �޴� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;
-- 11. 2007�� 06�� 21�Ͽ� �Ի��� ����� �����ȣ, �̸�(FIRST_NAME, LAST_NAME) 
--      �׸��� �μ���ȣ�� ��ȸ�϶�.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID 
FROM EMPLOYEES WHERE HIRE_DATE=TO_DATE('062107','MMDDYY');
-- 12. 2006�⿡ �Ի��� ����� �����ȣ�� �Ի����� ��ȸ�϶�.
SELECT EMPLOYEE_ID, HIRE_DATE FROM EMPLOYEES 
WHERE HIRE_DATE>TO_DATE('010106','MMDDYY')
AND HIRE_DATE<TO_DATE('123106','MMDDYY'); 
-- 13. �̸�(FIRST_NAME)�� ���̰� 5���� �̻��� ����� ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE LENGTH(FIRST_NAME)>5;
-- 14. �μ���ȣ�� ������� ��ȸ�϶�. (�μ���ȣ �������� ����)
SELECT DEPARTMENT_ID,COUNT(*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID ASC;
-- 15. ���� ���̵� ��� ������ ��ȸ�϶�. (���� ���̵� �������� ����)
SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID ORDER BY JOB_ID DESC;
-- 16. ��簡 �ִ� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE MANAGER_ID IS NOT NULL;
-- 17. ��簡 ���� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE MANAGER_ID IS NULL;
-- 18. ��� ������� �����ȣ, �̸�(FIRST_NAME, LAST_NAME), �μ���ȣ 
--   �׸��� �μ����� ��ȸ�϶�.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES;

-- 19. ��� �μ��� �μ���� ���ø��� ��ȸ�϶�.
SELECT D.DEPARTMENT_NAME, C.CITY FROM DEPARTMENTS D, LOCATIONS C;
-- 20. ��� ������� �����ȣ, �μ���, �������� ��ȸ�϶�.
SELECT EMPLOYEE_ID, DEPARTMENT_NAME, JOB_TITLE 
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID(+)  --
AND E.JOB_ID=J.JOB_ID;
-- 21. ��� ������� �����ȣ, �μ���, ������, ���ø��� ��ȸ�϶�.
SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, E.JOB_ID, L.CITY 
FROM EMPLOYEES E, LOCATIONS L;
-- 22. 10��, 20��, 30�� �μ����� �ٹ��ϴ� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES 
WHERE DEPARTMENT_ID = 10 -- AND �ƴϰ� 'OR'
OR DEPARTMENT_ID = 20 
OR DEPARTMENT_ID = 30; -- WHERE DEPARTMENT_ID IN(10,20,30); �� ����
-- 23. 6�� �̸��� ����� �ٹ��ϴ� �μ��� �̸��� ��ȸ�϶�.
SELECT D.DEPARTMENT_NAME
FROM DEPARTMENTS D
RIGHT JOIN EMPLOYEES E ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME HAVING COUNT(E.EMPLOYEE_ID)<6
ORDER BY D.DEPARTMENT_NAME;
-- 24. 4�� �̸��� ����� �ٹ��ϴ� �μ��� ��� ������ �μ����� ��ȸ�϶�.
SELECT D.DEPARTMENT_NAME, TRUNC(AVG(E.SALARY),2)
FROM EMPLOYEES E
RIGHT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME HAVING COUNT(E.EMPLOYEE_ID)<4;
-- 25. IT �μ��� ���� ������ ��ȸ�϶�.
SELECT SUM(E.SALARY)
FROM DEPARTMENTS D
JOIN EMPLOYEES E ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME HAVING D.DEPARTMENT_NAME='IT';

-- @@26. �����(REGIONS)�� ������ ������ ��ȸ�϶�.
--1
SELECT R.REGION_NAME, COUNT(L.CITY)
FROM LOCATIONS L
JOIN COUNTRIES C ON L.COUNTRY_ID=C.COUNTRY_ID
JOIN REGIONS R ON C.REGION_ID=R.REGION_ID
GROUP BY R.REGION_NAME; 
-->>>>>@@"GROUPȭ �Ҷ�" � @@"�÷�"�� �������� �Ұ����� ���� / HAVING ���ʿ�
--2
SELECT R.REGION_NAME, COUNT(CITY)
FROM LOCATIONS L, COUNTRIES C, REGIONS R
WHERE L.COUNTRY_ID = C.COUNTRY_ID
AND C.REGION_ID=R.REGION_ID
GROUP BY R.REGION_NAME;


-- 27. ���ø� �� �μ��� ������ ��ȸ�϶�.
SELECT L.CITY, COUNT(DEPARTMENT_ID)
FROM DEPARTMENTS D
LEFT JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID
GROUP BY CITY;

--@@28. �μ��� �������� �ʴ� ���ø� ��ȸ�϶�.
SELECT L.CITY
FROM LOCATIONS L
LEFT JOIN DEPARTMENTS D ON L.LOCATION_ID = D.LOCATION_ID
WHERE D.DEPARTMENT_ID IS NULL;

-- 29. ����� �������� �ʴ� ������ ��ȸ�϶�.
--1
SELECT DISTINCT  C.COUNTRY_NAME --DISTINCT �ߺ�����
FROM COUNTRIES C
LEFT JOIN LOCATIONS L ON C.COUNTRY_ID = L.COUNTRY_ID
LEFT JOIN DEPARTMENTS D ON L.LOCATION_ID=D.LOCATION_ID
LEFT JOIN EMPLOYEES E ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
WHERE EMPLOYEE_ID IS NULL;
--2
SELECT COUNTRY_NAME
FROM COUNTRIES
WHERE COUNTRY_ID NOT IN(SELECT DISTINCT L.COUNTRY_ID
                                               FROM LOCATIONS L, DEPARTMENTS D, EMPLOYEES E
                                               WHERE L.LOCATION_ID=D.LOCATION_ID
                                               AND D.DEPARTMENT_ID=E.DEPARTMENT_ID);
                                                
-- @@30. 150�� ������� ���� �Ի��� ��� �� ���� �ֽſ� �Ի��� ����� ��� ������ ��ȸ�϶�.
--1
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE <(SELECT HIRE_DATE FROM EMPLOYEES WHERE EMPLOYEE_ID=150)
AND HIRE_DATE=(SELECT MAX(HIRE_DATE) FROM EMPLOYEES);--WHERE ���� �����Լ� ����, HIRE_DATE�� ���� �־��༭ AND�� �̾��ش�

--2
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE = 
(SELECT MAX(HIRE_DATE) FROM EMPLOYEES WHERE HIRE_DATE<(SELECT HIRE_DATE FROM EMPLOYEES WHERE EMPLOYEE_ID=150));

-- @@31. ������ ��ȯ�� �̷��� �ִ� ����� ��� ������ ��ȸ�϶�.
--1 @@�ٽ�Ǯ��
SELECT DISTINCT E.* 
FROM EMPLOYEES E
LEFT JOIN JOB_HISTORY J ON E.EMPLOYEE_ID =J.EMPLOYEE_ID
WHERE J.EMPLOYEE_ID IS NULL; 

--2
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM JOB_HISTORY);

-- @@32. �μ��� �޴������� �ִ� ����� ��� ������ �μ����� ��ȸ�϶�.
--1 @@
SELECT E.*, D.DEPARTMENT_NAME FROM EMPLOYEES E
RIGHT JOIN DEPARTMENTS D ON E.MANAGER_ID=D.MANAGER_ID
WHERE D.MANAGER_ID IS NOT NULL;

--2
SELECT E.*, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.EMPLOYEE_ID = D.MANAGER_ID;

--3
SELECT E.*, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E. EMPLOYEE_ID IN(SELECT MANAGER_ID FROM DEPARTMENTS WHERE MANAGER_ID IS NOT NULL);

-- 33. �ٸ� ����� ����� ����� ��� ������ ��ȸ�϶�.--���� �������� ��� ���
SELECT DISTINCT A.*
FROM EMPLOYEES A
JOIN EMPLOYEES B ON A.EMPLOYEE_ID=B.MANAGER_ID; --LEFT �����Ұ�� WHERE�� NULL����
--WHERE B. MANAGER_ID IS NOT NULL; --MANAGER_ID �� ��Ī���� ���� ������� ���� - ���������� �Ŵ����� �ƴѻ���� - ����

-- 34. �̸�(FIRST_NAME)�� C�� �����ϰ� s�� ������ 
--    ����� �μ���, ������, ���ø�, ������, ������� ��ȸ�϶�.
--1
SELECT D.DEPARTMENT_NAME, J.JOB_TITLE, L.CITY, C.COUNTRY_NAME, R.REGION_NAME, E.FIRST_NAME
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
LEFT JOIN JOBS J ON E.JOB_ID = J.JOB_ID
LEFT JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
LEFT JOIN COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID
LEFT JOIN REGIONS R ON C.REGION_ID = R.REGION_ID
WHERE E.FIRST_NAME LIKE 'C%s';

--2
SELECT FIRST_NAME, DEPARTMENT_NAME, JOB_TITLE, CITY, COUNTRY_NAME, REGION_NAME
FROM EMP_DETAILS_VIEW
WHERE FIRST_NAME LIKE 'C%s';

-- 35. ������ ��ȯ�� �̷��� ���� ����� ��� ������ ��ȸ�϶�.
SELECT * 
FROM EMPLOYEES E 
LEFT JOIN JOB_HISTORY J ON E.EMPLOYEE_ID = J.EMPLOYEE_ID
WHERE J.EMPLOYEE_ID IS NULL;

-- 36. �ڽ��� '��簡 �ڽ� ���� �ʰ� �Ի�'�� ����� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES A
LEFT JOIN EMPLOYEES B ON A.MANAGER_ID=B.EMPLOYEE_ID
WHERE A.HIRE_DATE<B.HIRE_DATE;

-- 37. 100�� ����� ���� ���� �ΰ� �ִ� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES E
WHERE E.MANAGER_ID = 100;
-- 38. 100�� ����� ���� �ΰ� �ִ� ��� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES 
START WITH MANAGER_ID=100
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID
;
-- 38-1. 112�� ����� ������ ��� ��ȸ�ض�
SELECT* FROM EMPLOYEES
START WITH EMPLOYEE_ID = 112
CONNECT BY EMPLOYEE_ID = PRIOR MANAGER_ID;

-- 38-2. 150�� ����� ��� ������ �̸��� �μ����� ��ȸ�϶�
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME 
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
START WITH E.EMPLOYEE_ID = 150
CONNECT BY E.EMPLOYEE_ID = PRIOR E.MANAGER_ID;


-- @@39. ������� ���� ���� ������ �̸��� ��ȸ�϶�.
--SELECT L.CITY FROM LOCATIONS L
--LEFT JOIN DEPARTMENTS D ON L.LOCATION_ID=D.LOCATION_ID
--LEFT JOIN EMPLOYEES E ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
--GROUP BY L.CITY
--HAVING MAX(COUNT(E.EMPLOYEE_ID));
--2
SELECT CITY 
FROM
(
SELECT L.CITY, COUNT(*)
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND D.LOCATION_ID = L.LOCATION_ID
GROUP BY L.CITY
ORDER BY COUNT(*) DESC
)
WHERE ROWNUM=1;

-- @@40. ������ ������ ���� ���� �μ��� �̸��� ��ȸ�϶�.
SELECT D.DEPARTMENT_NAME FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
LEFT JOIN JOBS J ON E.JOB_ID = J.JOB_ID
WHERE J.JOB_ID = (SELECT MAX(COUNT(DISTINCT J.JOB_ID)) FROM JOBS J);

--2
SELECT DEPARTMENT_NAME
FROM
(
        SELECT E.DEPARTMENT_ID,COUNT(*) CO
        FROM EMPLOYEES E, JOBS J
        WHERE E.JOB_ID=J.JOB_ID
        GROUP BY E.DEPARTMENT_ID
        ORDER BY COUNT(*) DESC
) A
,DEPARTMENTS D
WHERE A.DEPARTMENT_ID=D.DEPARTMENT_ID
AND ROWNUM=1;

-- @@41. ��� ������ �ִ� ������ �ް� �ִ� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES 
JOIN (SELECT MAX(SALARY), JOB_ID FROM EMPLOYEES GROUP BY JOB_ID)
ON E.JOB.ID=JOB.ID AND E.SALARY=MAX(SALARY);

-- 42. ��� ������ �ּ� ������ �ް� �ִ� ������� ��� ������ ��ȸ�϶�.

--SELECT * FROM EMPLOYEES E
--JOIN (SELECT MIN(SALARY), JOB_ID FROM EMPLOYEES GROUP BY JOB_ID)
--ON E.JOB_ID=JOB_ID AND E.SALARY=MIN(SALARY);

--2
SELECT J.JOB_TITLE, E.*
FROM EMPLOYEES E, (SELECT JOB_ID , MIN(SALARY) MINSAL FROM EMPLOYEES GROUP BY JOB_ID) A, JOBS J 
WHERE E.JOB_ID = A.JOB_ID
AND E.JOB_ID = J.JOB_ID
AND E.SALARY = A.MINSAL;
--�� ��ĪMINSAL �� �ǰ� �����Լ�'MIN(SALARY)'�� �ȵǴ���? => �����Լ��� WHERE ������ ���Ұ�. ���������� SELECT�� �ȿ��� ��Ī�ٿ� ���

-- @@43. �μ��� ������ �ִ뿬��, �ּҿ���, ������� ��ȸ�϶�.
--DEPARTMENT_ID , JOB_ID
--MAX(SALARY), MIN(SALARY), COUNT(EMPLOYEE_ID)

-- 44. ������� ���� ���� ���ÿ��� �ٹ��ϴ� ��� ������� ���� ������ ��ȸ�϶�.

-- 45. ������� ���� ���� ���ÿ��� �ٹ��ϴ� ��� ������� �μ��� �� ������ ��� ������ ��ȸ�϶�.


-- @@46. �Ի����� ���� ������ ����� ��ȸ�϶�.
SELECT * FROM EMPLOYEES 
WHERE HIRE_DATE=(SELECT MIN(HIRE_DATE) FROM EMPLOYEES);

-- @@47. �Ի����� ���� �ֱ��� ����� ��ȸ�϶�.
SELECT * FROM EMPLOYEES 
WHERE HIRE_DATE=(SELECT MAX(HIRE_DATE) FROM EMPLOYEES);
-- @@48. ���� �ֱٿ� �Ի��� ����� ���� �������� �Ի��� ����� ������ ����� ��ȸ�϶�.
--SELECT A.HIRE_DATE FROM EMPLOYEES A
--WHERE A.HIRE_DATE = TRUNC((MONTHS_BETWEEN(MAX(HIRE_DATE)-MIN(HIRE_DATE))) * 30.5);

--2
--SELECT TO_DATE(MAX(HIRE_DATE)-MAX(HIRE_DATE)) FROM EMPLOYEES;

--3
SELECT A.HIRE_DATE FROM EMPLOYEES A 
WHERE A.HIRE_DATE = TO_DATE(MAX(HIRE_DATE), 'YYYYMMDD') - TO_DATE(MIN(HIRE_DATE),'YYYYMMDD');

-- 49. ���� �ֱٿ� �Ի��� ����� ���� �������� �Ի��� ����� �ð����� ����� ��ȸ�϶�.
--SELECT A.HIRE_DATE FROM EMPLOYEES A
--WHERE A.HIRE_DATE = (SELECT


-- 50. ������ 12000 �̻�Ǵ� �������� LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT LAST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY>=12000;

-- 51. �����ȣ�� 176 �� ����� LAST_NAME �� �μ� ��ȣ�� ��ȸ�Ѵ�.
SELECT LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE EMPLOYEE_ID=176;

-- 52. ������ 5000 ���� 12000�� ���� �̿��� ������� LAST_NAME �� ������ ��ȸ����.
SELECT LAST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY>=5000 AND SALARY <12000;

-- 53. 2000/02/20 �Ϻ��� 2010/05/01 ���̿� ���� ������� LAST_NAME ���, ������ڸ� ��ȸ�Ѵ�.
SELECT LAST_NAME, HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE >TO_DATE('2000/02/20','YYYY/MM/DD')
            AND HIRE_DATE <TO_DATE('2010/05/01','YYYY/MM/DD');

-- 54. 20 �� �� 50 �� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� 
--   �μ� ��ȣ�� ���ĺ������� ��ȸ�Ѵ�.
SELECT LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20 OR DEPARTMENT_ID=50
ORDER BY LAST_NAME;

-- 55. 20 �� �� 50 �� �μ��� �ٹ��ϸ�, ������ 5000 ~ 12,000 ������ 
--   ������� LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT LAST_NAME, SALARY FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20 OR DEPARTMENT_ID=50 AND
SALARY >=5000 AND SALARY<=12000;

-- @@56. 2005�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ѵ�.
SELECT LAST_NAME, HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE >= TO_DATE('20050101','YYYYMMDD') AND
            HIRE_DATE <= TO_DATE('20051231' , 'YYYYMMDD');


-- 57. �Ŵ����� ���� ������� LAST_NAME �� JOB_ID �� ��ȸ�Ѵ�.
SELECT LAST_NAME, JOB_ID FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 58. �Ŵ����� �ִ� ������� LAST_NAME �� JOB_ID �� ��ȸ�Ѵ�.
SELECT LAST_NAME, JOB_ID FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL;

-- 59. Ŀ�̼��� ���� ��� ������� LAST_ANME, ���� �� Ŀ�̼��� ��ȸ�Ѵ�.
--    ���� ����, Ŀ�̼� �������� �����Ѵ�.
SELECT LAST_NAME, SALARY, SALARY*COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- 60. LAST_NAME �� �׹�° ���ڰ� a �� ������� LAST_NAME �� ��ȸ�Ѵ�.
SELECT LAST_NAME FROM EMPLOYEES
WHERE LAST_NAME LIKE '___a%';

-- 61. LAST_NAME �� a ��(OR) e ���ڰ� �ִ� ������� LAST_NAME �� ��ȸ�Ѵ�.
SELECT LAST_NAME FROM EMPLOYEES
WHERE LAST_NAME LIKE '%a%' 
            OR LAST_NAME LIKE '%e%' ;

-- 62. ������ 2,500, 3,500, 7000 �� �ƴϸ� 
-- ������ SA_REP �̳� ST_CLERK �� ������� ��ȸ�Ѵ�.
SELECT * FROM EMPLOYEES E, JOBS S
WHERE E.SALARY != 2500 AND E.SALARY != 3500 AND E.SALARY != 7000 
            AND S.JOB_TITLE = 'SA_REP' OR S.JOB_TITLE = 'ST_CLERK'; 


-- 63.  ������ AD_PRESS �� ����� A �����, 
--  ST_MAN �� ����� B �����, IT_PROG �� ����� C �����,
--  SA_REP �� ����� D �����, ST_CLERK �� ����� E ����� 
--  ��Ÿ�� 0 �� �ο��Ͽ� ��ȸ�Ѵ�.

SELECT JOB_ID
,CASE
WHEN JOB_ID = 'AD_PRESS' THEN 'A'
WHEN JOB_ID = 'ST_MAN' THEN 'B'
WHEN JOB_ID = 'IT_PROG' THEN 'C'
WHEN JOB_ID = 'SA_REP' THEN 'D'
WHEN JOB_ID = 'ST_CLERK' THEN 'E'
ELSE  '0'
END 
FROM JOBS;

-- 64. ��� ������� LAST_NAME, �μ� �̸� �� �μ� ��ȣ�� ��ȸ�Ѵ�.
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, D.DEPARTMENT_ID
FROM DEPARTMENTS D
RIGHT JOIN EMPLOYEES E ON D.DEPARTMENT_ID=E.DEPARTMENT_ID;

-- 65. �μ���ȣ 30 ���� ��� �������� ������ ����(DISTINCT)���� ��ȸ�Ѵ�. 90 �μ� ���� �����Ѵ�.
SELECT DISTINCT J.JOB_ID FROM JOBS J
JOIN EMPLOYEES E ON J.JOB_ID=E.JOB_ID
WHERE E.DEPARTMENT_ID = 30 OR E.DEPARTMENT_ID=90;

-- 66. Ŀ�̼��� ���� ��� ������� LAST_NAME, �μ� ��, ���� ID �� ���� ���� ��ȸ�Ѵ�.
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, C.REGION_ID, L.CITY FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
LEFT JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID
LEFT JOIN COUNTRIES C ON L.COUNTRY_ID=C.COUNTRY_ID
WHERE COMMISSION_PCT IS NOT NULL;

-- 66-1. �þ�Ʋ�� ��� ��� �� Ŀ�̼��� ���� ��� ������� LAST_NAME, �μ� ��, ���� ID �� ���� ���� ��ȸ�Ѵ�.
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, C.REGION_ID, L.CITY FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
LEFT JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID
LEFT JOIN COUNTRIES C ON L.COUNTRY_ID=C.COUNTRY_ID
WHERE L.CITY='Seattle' AND E.COMMISSION_PCT IS NOT NULL;

----ã�ƺ��� 'SEATTLE ��� Ŀ�̼ǿ���'
--SELECT E.COMMISSION_PCT FROM EMPLOYEES E
--JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
--LEFT JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID
--WHERE L.CITY = 'Seattle';

-- 67. LAST_NAME �� DAVIES �� ������� �Ŀ� ���� ������� LAST_NAME �� HIRE_DATE �� ��ȸ�Ѵ�.
SELECT LAST_NAME,  HIRE_DATE FROM EMPLOYEES A
WHERE HIRE_DATE > (SELECT HIRE_DATE 
                                    FROM EMPLOYEES B 
                                    WHERE LAST_NAME='Davies');
                                    
-- 68. �ڽ��� �Ŵ������� ���� ���� ������� LAST_NAME �� ������� ��ȸ�Ѵ�.
SELECT A.LAST_NAME, A.HIRE_DATE FROM EMPLOYEES A
JOIN EMPLOYEES B ON A.MANAGER_ID=B.EMPLOYEE_ID
WHERE A.HIRE_DATE < B.HIRE_DATE;

-- 69. ȸ�� ��ü�� �ִ� ����, �ּ� ����, ���� �� �� �� ��� ������ �ڿ����� �����Ͽ� ��ȸ�Ѵ�.
SELECT TRUNC(MAX(SALARY)) AS BEST, TRUNC(MIN(SALARY)) AS WORST, TRUNC(SUM(SALARY)) AS TOTAL, TRUNC(AVG(SALARY)) AS AVG
FROM EMPLOYEES;

-- 70. �� JOB_ID ��, �ִ� ����, �ּ� ����, ���� �� �� �� ��� ������ �ڿ����� �����Ͽ� ��ȸ�Ѵ�.
SELECT MAX(SALARY), MIN(SALARY), SUM(SALARY), AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID;

-- 71. ������ ������ ���� ������� �� ���� ��ȸ�Ѵ�.
SELECT COUNT(*) FROM EMPLOYEES
GROUP BY JOB_ID
HAVING COUNT(*)>=2;


-- 72. �Ŵ����� �ٹ��ϴ� ������� �� ���� ��ȸ�Ѵ�.
--SELECT A.EMPLOYEE_ID, B.MANAGER_ID FROM EMPLOYEES A
--RIGHT JOIN EMPLOYEES B ON A.MANAGER_ID=B.EMPLOYEE_ID;
--WHERE B.EMPLOYEE_ID IS NULL;

-- 73. �系�� �ִ� ���� �� �ּ� ������ ���̸� ��ȸ�Ѵ�.
SELECT MAX(SALARY)-MIN(SALARY) FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL;

-- 74. �Ŵ����� ��� �� �� �Ŵ��� �� ����� �� �ּ� ������ �޴� ����� ������ ��ȸ�Ѵ�.
--     �Ŵ����� ���� ������� �����Ѵ�.
--     �ּ� ������ 6000 �̸��� ���� �����Ѵ�.
--     ���� ���� �������� ��ȸ�Ѵ�.
SELECT MANAGER_ID, SALARY FROM EMPLOYEES A
INNER JOIN
WHERE MANAGER_ID IS NOT NULL
            AND 6000 >(SELECT MIN(SAL) FROM EMPLOYEES GROUP BY )


-- 75. �μ� ��, ��ġ ID, �� �μ� �� ��� �� ��, �� �μ� �� ��� ������ ��ȸ�Ѵ�.
--     ��� ������ �Ҽ��� 2 �ڸ������� ǥ���Ѵ�.

-- 76. �� ��� �� �� 2001, 2003, 2005, 2006 �⵵ �� ���� ������� �� ���� ������ ���� ��ȸ�Ѵ�.
SELECT SUM(EMPLOYEE_ID), HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE = TO_DATE('2001', 'YYYY')
            OR HIRE_DATE = TO_DATE('2003', 'YYYY')
            OR HIRE_DATE = TO_DATE('2005', 'YYYY')
            OR HIRE_DATE = TO_DATE('2006', 'YYYY')
            GROUP BY HIRE_DATE;
            
-- 77.  �� '���� �� ���� �� ��' �� '�� �μ��� ���� �� ��'�� ��ȸ�Ѵ�. 
SELECT 
(
SELECT SUM(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID
),
(
SELECT SUM(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
)
FROM EMPLOYEES;


-- 78. LAST_NAME �� Zlotkey �� ������ �μ��� �ٹ��ϴ� ��� ������� ��� �� ��볯¥�� ��ȸ�Ѵ�.
--     ��������� Zlotkey �� �����Ѵ�.
--SELECT EMPLOYEE_ID, HIRE_DATE FROM EMPLOYEES
--WHERE LAST_NAME = Zlotkey ;

--1. LAST_NAME �� Zlotkey �� ������ �μ��� �ٹ��ϴ� ��� ������� ��� �� ��볯¥�� ��ȸ�Ѵ�.
----     ��������� Zlotkey �� �����Ѵ�.

SELECT EMPLOYEE_ID, HIRE_DATE FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
--WHERE DEPARTMENT_NAME =  

(SELECT DEPARTMENT_NAME FROM DEPARTMENTS D
JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE E.LAST_NAME = 'Zlotkey')

--2. -- ����� �������� �ʴ� ������ ��ȸ�϶�.
--3. --�ڽ��� ��簡 �ڽ� ���� �ʰ� �Ի��� ����� ��� ������ ��ȸ�϶�.
--4. --������� ���� ���� ������ �̸��� ��ȸ�϶�.
--5. --��� ������ �ִ� ������ �ް� �ִ� ������� ��� ������ ��ȸ�϶�.
--6. ������� ���� ���� ���ÿ��� �ٹ��ϴ� ��� ������� ���� ������ ��ȸ�϶�.



-- 79. ȸ�� ��ü ��� �������� �� �޴� ������� ��� �� LAST_NAME �� ��ȸ�Ѵ�.

-- 80. LAST_NAME �� u �� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� ��� �� LAST_NAME �� ��ȸ�Ѵ�.

-- 81. (VIEW �̿�) LAST_NAME �� u �� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� ��� �� LAST_NAME �� ��ȸ�Ѵ�.

-- 82. ��ġ ID �� 1700 �� �μ����� �ٹ��ϴ� ������� LAST_NAME, �μ� ��ȣ �� JOB_ID �� ��ȸ�Ѵ�.

-- 83. (VIEW �̿�)��ġ ID �� 1700 �� �μ����� �ٹ��ϴ� ������� LAST_NAME, �μ� ��ȣ �� JOB_ID �� ��ȸ�Ѵ�.

-- 84. King �� �Ŵ����� �ΰ� �ִ� ��� ������� LAST_NAME �� ������ ��ȸ�Ѵ�.

-- 85. EXECUTIVE �μ��� �ٹ��ϴ� ��� ������� �μ� ��ȣ, LAST_NAME, JOB_ID �� ��ȸ�Ѵ�.

-- 86. ȸ�� ��ü ��� ���� ���� �� ���� ����� �� LAST_NAME �� u �� �ִ� �������
--       �ٹ��ϴ� �μ����� �ٹ��ϴ� ������� ���, LAST_NAME �� ������ ��ȸ�Ѵ�.

-- 87. (VIEW �̿�)ȸ�� ��ü ��� ���� ���� �� ���� ����� �� LAST_NAME �� u �� �ִ� �������
--       �ٹ��ϴ� �μ����� �ٹ��ϴ� ������� ���, LAST_NAME �� ������ ��ȸ�Ѵ�.

-- 88. ST_CLERK �� ���� ID �� ���� ����� ���� �μ� ID �� ��ȸ�Ѵ�.
--       NULL ���� �����Ѵ�. (NOT EXISTS ���)

-- 89. ST_CLERK �� ���� ID �� ���� ����� �ִ� �μ� ID �� ��ȸ�Ѵ�.
--       NULL ���� �����Ѵ�. (NOT EXISTS ���)

-- 90. ��ġ�� �μ��� ���� ���� ID �� ���� �̸��� ��ȸ����.(NOT EXISTS ���)

-- 91. ��ġ�� �μ��� �ִ� ���� ID �� ���� �̸��� ��ȸ����.(EXISTS ���)

-- 92. ������ ������ ������ ������ �ִ� ������� ��� �� JOB_ID �� ��ȸ�Ѵ�.

-- 93. Ŀ�̼��� ���� ������� �μ��� ������ ������ ������� LAST_NAME, �μ� ��ȣ �� ������ ��ȸ�Ѵ�.

-- 94. ��ġ ID �� 1700 �� ������� ������ Ŀ�̼��� ������ ������� LAST_NAME, �μ� ��ȣ �� ������ ��ȸ�Ѵ�.

-- 95. LAST_NAME �� 'Kochhar' �� ����� ������ ���� �� Ŀ�̼��� ���� ������� LAST_NAME, �μ� ��ȣ �� ������ ��ȸ�Ѵ�.

-- 96. ���� ID �� SA_MAN �� ������� ���� �� �ִ� �ִ� ���� ���� ���� �޴� ������� LAST_NAME, JOB_ID �� ������ ��ȸ�Ѵ�.

-- 97. ���� �̸��� T �� �����ϴ� ������ ��� ������� ���, LAST_NAME �� �μ� ��ȣ�� ��ȸ�Ѵ�.

-- 98.  �� �μ��� ��� �������� �� �޴� ���Ϻμ� �ٹ��������
--      LAST_NAME, ����, �μ���ȣ �� �ش� �μ��� ��� ������ ��ȸ�Ѵ�.
--      ����� �μ��� ������ �������� �����Ѵ�.

-- 99. �ҼӺμ��� ��� �������� ���� ���� ������� last_name �� ��ȸ�Ѵ�.

-- 100. �� ��� �� �ҼӺμ����� �ڽź��� �ʰ� ���Ǿ����� ���� ���� ������ �޴� ����� �����ϴ� ��� ������� last_name �� ��ȸ�Ѵ�.

--101. ��å(Job Title)�� Sales Manager�� ������� �Ի�⵵�� �Ի�⵵(hire_date)�� ��� �޿��� ����Ͻÿ�. 
--   ��� �� �⵵�� �������� �������� �����Ͻÿ�. 

--102. �� ����(city)�� �ִ� ��� �μ� �������� ��ձ޿��� ��ȸ�ϰ��� �Ѵ�. 
--   ��ձ޿��� ���� ���� ���ú��� ���ø�(city)�� ��տ���, �ش� ������ �������� ����Ͻÿ�. 
--   ��, ���ÿ� �� ���ϴ� ������ 10�� �̻��� ���� �����ϰ� ��ȸ�Ͻÿ�.

--103. ��Public  Accountant���� ��å(job_title)���� ���ſ� �ٹ��� ���� �ִ� ��� ����� ����� �̸��� ����Ͻÿ�. 
--   (���� ��Public Accountant���� ��å(job_title)���� �ٹ��ϴ� ����� ��� ���� �ʴ´�.)      
--   �̸��� first_name, last_name�� �Ʒ��� �������� ���� ����Ѵ�.

--104. �ڽ��� �Ŵ������� ����(salary)�� ���� �޴� �������� ��(last_name)�� ����(salary)�� �� ���Ͻÿ�. 

--105. 2007�⿡ �Ի�(hire_date)�� �������� ���(employee_id), �̸�(first_name), ��(last_name), 
--   �μ���(department_name)�� ��ȸ�մϴ�.  
--   �̶�, �μ��� ��ġ���� ���� ������ ���, ��<Not Assigned>���� ����Ͻÿ�. 

--106. ������(job_title)�� ��Sales Representative���� ���� �߿��� ����(salary)�� 9,000�̻�, 10,000 ������ 
--   �������� �̸�(first_name), ��(last_name)�� ����(salary)�� ����Ͻÿ�

--107. �μ����� ���� ���� �޿��� �ް� �ִ� ������ �̸�, �μ��̸�, �޿��� ����Ͻÿ�. 
--   �̸��� last_name�� ����ϸ�, �μ��̸����� �������� �����ϰ�, 
--   �μ��� ���� ��� �̸��� ���� ���� �������� �����Ͽ� ����մϴ�. 

--108. EMPLOYEES ���̺��� �޿��� ���� �޴� ������� ��ȸ���� �� ���ó�� 6��°���� 10 ��°���� 
--   5���� last_name, first_name, salary�� ��ȸ�ϴ� sql������ �ۼ��Ͻÿ�.

--109. ����� �μ��� ���� ����(city)�� ��Seattle���� ����� �̸�, �ش� ����� �Ŵ��� �̸�, ��� �� �μ��̸��� ����Ͻÿ�. 
--   �̶� ����� �Ŵ����� ���� ��� ��<����>���̶�� ����Ͻÿ�. �̸��� last_name�� ����ϸ�, 
--   ����� �̸��� ������������ �����Ͻÿ�. 

--110. �� ����(job) ���� ����(salary)�� ������ ���ϰ��� �Ѵ�. ���� ������ ���� ���� �������� 
--    ������(job_title)�� ���� ������ ��ȸ�Ͻÿ�. �� ���������� 30,000���� ū ������ ����Ͻÿ�. 

--111. �� ���(employee)�� ���ؼ� ���(employee_id), �̸�(first_name), ������(job_title), 
--    �μ� ��(department_name)�� ��ȸ�Ͻÿ�. 
--    �� ���ø�(city)�� ��Seattle���� ����(location)�� �μ� (department)�� �ٹ��ϴ� ������ �����ȣ �������������� ����Ͻÿ�.

--112. 2001~20003����̿� �Ի��� ������ �̸�(first_name), �Ի���(hire_date), �����ڻ�� (employee_id), 
--    ������ �̸�(fist_name)�� ��ȸ�մϴ�. ��, �����ڰ� ���� ��������� ��� ����� ���Խ��� ����Ѵ�.

--113. ��Sales�� �μ��� ���� ������ �̸�(first_name), �޿�(salary), �μ��̸�(department_name)�� ��ȸ�Ͻÿ�. 
--    ��, �޿��� 100�� �μ��� ��պ��� ���� �޴� ���� ������ ��µǾ�� �Ѵ�. 

--114. Employees ���̺��� �Ի��Ѵ�(hire_date)���� �ο����� ��ȸ�Ͻÿ�.

--115. �μ��� �������� �ִ�, �ּ�, ��ձ޿��� ��ȸ�ϵ�, 
--    ��ձ޿��� ��IT�� �μ��� ��ձ޿����� ����, ��Sales�� �μ��� ��պ��� ���� �μ� ������ ����Ͻÿ�. 

--116. �� �μ����� ������ �Ѹ� �ִ� �μ��� ��ȸ�Ͻÿ�. 
--    ��, ������ ���� �μ��� ���ؼ��� ��<�Ż��μ�>����� ���ڿ��� ��µǵ��� �ϰ�,
--    ��°���� ������ ���� �μ����� �������� ���� ���ĵǾ���Ѵ�. 

--117. �μ��� �Ի���� �������� ����Ͻÿ�. 
--    ��, �������� 5�� �̻��� �μ��� ��µǾ�� �ϸ� ��°���� �μ��̸� ������ �Ѵ�.

--118. ����(country_name) �� ����(city)�� �������� ��ȸ�Ͻÿ�. 
--    ��, �μ��� �������� ���� ���� �� �ֱ� ������ 106���� ������ ����� �ȴ�. 
--    �μ������� ���� ������ ������� ���ø� ��ſ� ��<�μ�����>���� ��µǵ��� �Ͽ� 107�� ��� ��µǰ� �Ѵ�.

--119. �� �μ��� �ִ� �޿����� ���̵�(employee_id), �̸�(first_name), �޿�(salary)�� ����Ͻÿ�. 
--    ��, �ִ� �޿��ڰ� ���� �μ��� ��ձ޿��� ���������� ����Ͽ� ��ձ޿��� ���� �� �ְ� �� ��.

--120. Ŀ�̼�(commission_pct)�� �������� ��ȸ�Ͻÿ�. 
--    Ŀ�̼��� �Ʒ�������ó�� 0.2, 0.25�� ��� .2��, 0.3, 0.35�� .3 ���·� ��µǾ�� �Ѵ�. 
--    ��, Ŀ�̼� ������ ���� �����鵵 �ִ� �� Ŀ�̼��� ���� ���� �׷��� ��<Ŀ�̼� ����>���� ��µǰ� �Ѵ�.

--121. Ŀ�̼�(commission_pct)�� ���� ���� ���� ���� 4���� �μ���(department_name), 
--    ������ (first_name), �޿�(salary), Ŀ�̼�(commission_pct) ������ ��ȸ�Ͻÿ�. 
--    ��°���� Ŀ�̼� �� ���� �޴� ������ ����ϵ� ������ Ŀ�̼ǿ� ���ؼ��� �޿��� ���� ������ ���� ��� �ǰ� �Ѵ�.

--Q1 �μ���, ������(first_name),�޿�,Ŀ�̼� �÷��� ���� �並 �ۼ��Ͻÿ�.
--�� Ŀ�̼� ����Ʈ�� ���� ��� 0���� ��ȯ
CREATE VIEW VIEW1 AS
SELECT DEPARTMENT_NAME, FIRST_NAME, SALARY, NVL(COMMISSION_PCT,0) AS COMM
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID;


--Q2 �μ���, ��å, ������, �Ի����� ���� �並 �ۼ��Ͻÿ�.
CREATE VIEW VIEW2 AS
SELECT DEPARTMENT_NAME, JOB_TITLE, FIRST_NAME, HIRE_DATE FROM DEPARTMENTS D
JOIN EMPLOYEES E ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
JOIN JOBS J ON E.JOB_ID=J.JOB_ID;

--Q3 �μ����̺��� �����Ͽ� �� ���̺��� ����� 
--�� ���̺� ������ �÷��� �߰��ϰ� �ʱⰪ�� ������ �� 
--������ '�Ի� �� ���'�� '������' �÷��� �����ϴ� Ʈ���Ÿ� '�ۼ�'�Ͻÿ�
--1
CREATE TABLE DEP_TEST AS
SELECT D.*, A.EMP_CNT FROM DEPARTMENTS D , (SELECT D1.DEPARTMENT_ID, COUNT(*) AS EMP_CNT
                                                                                FROM EMPLOYEES E, DEPARTMENTS D1
                                                                                WHERE E.DEPARTMENT_ID=D1.DEPARTMENT_ID
                                                                                 GROUP BY D1.DEPARTMENT_ID)  A
WHERE D.DEPARTMENT_ID = A.DEPARTMENT_ID;

--2
ALTER TABLE DEPARTMENTS2 ADD EMP_COUNT NUMBER;
ALTER TABLE DEPARTMENTS2 ADD CONSTRAINT DEF1 DEFAULT 5 FOR EMP_COUNT;

--3@@@@@@@@@@@@@@@@

CREATE TRIGGER TRIG1
AFTER INSERT OR DELETE ON EMPLOYEES
FOR EACH ROW
BEGIN

        IF INSERTING THEN
            UPDATE DEPT_TEST
            SET EMP_CNT = EMP_CNT+1
            WHERE DEPARTMENT_ID = :NEW.DEPARTMENT_ID;
        ELSIF DELETING THEN
            UPDATE DEPT_TEST
            SET EMP_CNT = EMP_CNT-1
            WHERE DEPARTMENT_ID = :OLD.DEPARTMENT_ID;
        END IF;
        
END TRIG1;
/
--Q4 �μ�ID�� �Է��ϸ� �μ����� ��ȯ�ϴ� �Լ��� �ۼ��Ͻÿ�.
CREATE OR REPLACE FUNCTION FN_GET_DEPT_NAME(P_DEPT_ID IN NUMBER)
RETURN VARCHAR2
AS
        V_DEPT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;
BEGIN
        SELECT DEPARTMENT_NAME INTO V_DEPT_NAME
        FROM DEPARTMENTS
        WHERE DEPARTMENT_ID = P_DEPT_ID;
        RETURN V_DEPT_NAME;
END;
SELECT FN_GET_DEPT_NAME(10) FROM DUAL;
/
--Q5 �μ�ID�� �Է��ϸ� �ش� �μ��� ���� ����� ����ϴ� ���ν����� �ۼ��Ͻÿ�.
CREATE OR REPLACE PROCEDURE PROC_TEST(P_DEPT_ID IN NUMBER)
IS
BEGIN
    FOR EMP IN (SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = P_DEPT_ID)
    LOOP
        DBMS_OUTPUT.PUT_LINE(EMP.EMPLOYEE_ID || '  ' || EMP.FIRST_NAME || '....');
    END LOOP;
END PROC_TEST;
/






