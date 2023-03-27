/*
    사용자를 생성
    CREATE USER STU [USER NAME] IDENTIFIED BY [PASSWORD]
*/
CREATE USER STU IDENTIFIED BY LOVE;
ALTER USER STU IDENTIFIED BY HOPE;
DROP USER STU;

GRANT CREATE SESSION TO STU;

GRANT SELECT ON SCOTT.SAL_DML TO STU;
GRANT INSERT ON SCOTT.SAL_DML TO STU;

REVOKE SELECT, INSERT ON SCOTT.SAL_DML FROM STU;

SELECT * FROM USER_SYS_PRIVS;

CREATE ROLE SCHOOL; --'ROLE'권한모음
GRANT CONNECT, RESOURCE, CREATE VIEW TO SCHOOL;

GRANT SCHOOL TO STU;

SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE='SCHOOL';



