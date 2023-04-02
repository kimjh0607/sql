--1. LAST_NAME �� Zlotkey �� ������ �μ��� �ٹ��ϴ� ��� ������� ��� �� ��볯¥�� ��ȸ�Ѵ�.(��������� Zlotkey �� �����Ѵ�.)
SELECT EMPLOYEE_ID, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM EMPLOYEES
WHERE LAST_NAME = 'Zlotkey') AND LAST_NAME != 'Zlotkey'; -- " != " ������ �̿� ����

--2. -- ����� �������� �ʴ� ������ ��ȸ�϶�.
SELECT DISTINCT COUNTRY_NAME FROM COUNTRIES C
LEFT JOIN LOCATIONS L ON C.COUNTRY_ID = L.COUNTRY_ID
LEFT JOIN DEPARTMENTS D ON L.LOCATION_ID = D.LOCATION_ID
LEFT JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE EMPLOYEE_ID IS NULL;

--3. --�ڽ��� ��簡 �ڽ� ���� �ʰ� �Ի��� ����� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES A
JOIN EMPLOYEES B ON A.MANAGER_ID = B.EMPLOYEE_ID
WHERE A.HIRE_DATE < B.HIRE_DATE;

--4. --������� ���� ���� ������ �̸��� ��ȸ�϶�.
SELECT ROWNUM, MAX.* 
FROM
(SELECT L.CITY, COUNT(*) FROM LOCATIONS L
JOIN DEPARTMENTS D ON L.LOCATION_ID = D.LOCATION_ID
JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY L.CITY
ORDER BY COUNT(*) DESC
) MAX 
WHERE ROWNUM =1; --ROWNUM ���� ����
--DEPARTMENTS ���̺�� EMPLOYEES ���̺��� JOIN�� ���̺��� CITY�÷��������� �׷�ȭ, CITY�÷��� �÷��� �ɸ� ��ü�� ī��Ʈ�� ��Ÿ��. ��������.
--�׷��� �ɷ��� ���̺� ROWNUM���� �ణ ���ڸ� �ο��ϰ� ���� 1��(�ִٻ��)�� �̾Ƴ�

--5. --��� ������ �ִ� ������ �ް� �ִ� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES E
JOIN
(
SELECT DEPARTMENT_ID, MAX(SALARY) AS MAXSAL FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
) MAX
ON E.DEPARTMENT_ID = MAX.DEPARTMENT_ID
WHERE E.SALARY = MAX.MAXSAL; 
--WHERE������ �����Լ� ��� ��Ī����, ������������ EMP���̺�� JOINȰ��� �ٽ� ����


--6. ������� ���� ���� ���ÿ��� �ٹ��ϴ� ��� ������� ���� ������ ��ȸ�϶�.
--SELECT SUM(SALARY) FROM
--SELECT SUM(SALARY) FROM
--(
--SELECT L.CITY, COUNT(*) AS CNT FROM EMPLOYEES E
--JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
--JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
--GROUP BY L.CITY
--) MAX
--;






