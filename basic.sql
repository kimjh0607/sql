/* CREATE TABLE TABLE_NAME(
        COLUMN_NAME DATA_TYPE(LENGTH) ,
        ......
    );
*/
DROP TABLE emp_ddl;

CREATE TABLE emp_ddl ( --��ü �����ϱ�
    empno    NUMBER(4),
    ename    VARCHAR2(10),
    job      VARCHAR2(9),
    mgr      NUMBER(4),
    hiredate DATE,
    sal      NUMBER(7, 2),
    com      NUMBER(7, 2),
    deptno   NUMBER(2)
);

DESC EMP_DDL; --��������

DROP TABLE dept_ddl;

CREATE TABLE dept_ddl
    AS
        SELECT
            *
        FROM
            dept;

DESC DEPT_DDL;

CREATE TABLE salgrade_ddl
    AS
        SELECT
            *
        FROM
            salgrade;

DESC SALGRADE_DDL;

/* ALTER TABLE <TABLE_NAME>
    1.ADD <COLNAME> <DATATYPE>;
    2.DROP <COLNAME>;
    3.MODIFY <COLNAME> <DATATYPE>;
    4.RENAME COLUMN <OLD_COLNAME> TO <NEW_COLNAME>
*/
ALTER TABLE salgrade_ddl ADD party VARCHAR2(20);

ALTER TABLE salgrade_ddl RENAME COLUMN party TO home;

ALTER TABLE salgarde_ddl MODIFY
    home NUMBER(10);

DESC SALGRADE_DDL;

ALTER TABLE salgrade_ddl DROP COLUMN home;

RENAME salgrade_ddl TO salzip;

DESC SALZIP;

SELECT
    *
FROM
    SALZIP;

TRUNCATE TABLE salzip;

DROP TABLE salzip;
/*
COMMENT ON TABLE <TABLE_NAME> IS <COMMENT>;
COMMENT ON COLUMN <TABLE_NAME>.<COLNAME> IS <COMMENT>;
*/
COMMENT ON TABLE dept_ddl IS
    'DDL�������̺�';

COMMENT ON COLUMN depf_ddl.loc IS
    '�μ���ġ';

SELECT
    *
FROM
    user_tab_comments;

SELECT
    *
FROM
    user_col_comments
WHERE
    table_name = 'DEPT_DDL';

/* CONSTRAINT
    NOT NULL/UNIQUE/PRIMARY KEY/FOREIGN KEY/CHECK/DEFAULT
*/
DROP TABLE persons;

DROP TABLE persons2;

CREATE TABLE persons (
    id     VARCHAR2(4) PRIMARY KEY,
    name   VARCHAR2(20) NOT NULL UNIQUE,
    age    NUMBER(3) CHECK ( age >= 18 ),
    telnum VARCHAR2(20),
    addr   VARCHAR2(100) DEFAULT 'SEOUL',
    bday   DATE DEFAULT sysdate
);

INSERT INTO persons (
    id,
    name,
    age,
    telnum
) VALUES (
    '1000',
    'SCOTT',
    20,
    '01012345567'
);

INSERT INTO persons (
    name,
    age,
    telnum
) VALUES (
    'SCOTT',
    20,
    '010123445567'
);

CREATE TABLE persons2 (
    id     VARCHAR2(4),
    name   VARCHAR2(20) NOT NULL,
    age    NUMBER(3),
    telnum VARCHAR2(20),
    addr   VARCHAR2(100) DEFAULT 'SEOUL',
    bday   DATE DEFAULT sysdate,
    CONSTRAINT pk_person2 PRIMARY KEY ( id ),
    CONSTRAINT un_person2 UNIQUE ( name ),
    CONSTRAINT chk_person2 CHECK ( age >= 18 )
);

ALTER TABLE persons2 MODIFY
    addr DEFAULT 'PARIS';

ALTER TABLE persons2 DROP CONSTRAINT chk_person2;

ALTER TABLE persons2 ADD CONSTRAINT chk_p2 CHECK ( age > 50 );

DROP TABLE plays;

CREATE TABLE plays(
    PLAY_ID NUMBER(10)  PRIMARY KEY,
    PLAY_RESULT VARCHAR2(100),
    ADDR varchar2(10) DEFAULT 'PARIS',
    PERSONS_ID VARCHAR2(4),
    fk_plays  REFERENCES persons(id)  ON DELETE CASCADE
);
ALTER TABLE persons2 DROP CONSTRAINT chk_person2;

ALTER TABLE persons2 ADD CONSTRAINT chk_p2 CHECK ( age > 50 );

DROP TABLE plays;

CREATE TABLE plays(
    PLAY_ID NUMBER(10) PRIMARY KEY,
    PLAY_RESULT VARCHAR2(100),
    PERSONS_ID VARCHAR2(4), constraint fk_plays FOREIGN KEY(persons_id)
    REFERENCES person(id)ON DELETE CASCADE
        );
        --ON DELETE SET NULL
        DROP TABLE FKTABLE;
        DROP TABLE PKTABEL;
        CREATE TABLE PKTABLE(
        PKVAL VARCHAR2(10),
        CONSTRAINT PK_KEY PRIMARY KEY(PKVAL)
        );
        CREATE TABLE FKTABLE(
        PKVAL VARCHAR2(10),
        FKVAL VARCHAR2(10)
        );
ALTER TABLE fktable 
add constraint fk__key foreign key ( fkval ) referances
PKTABLE(PKVAL) ON DELETE CASCADE;

ALETER TABLE FKTABLE ADD CONSTRAINT FKT_PK_KEY PRIMARY KEY(PKVAL);


INSERT INTO PKTABLE VALUES('PK1');
INSERT INTO PKTABLE VALUES('PK2');
INSERT INTO PKTABLE VALUES('PK3');
SELECT * FROM PKTABLE;

INSERT INTO FKTABLE VALUES('PK1-VAL1','PK1');
INSERT INTO FKTABLE VALUES('PK1-VAL2','PK1');
INSERT INTO FKTABLE VALUES('PK2-VAL1','PK2');
INSERT INTO FKTABLE VALUES('PK2-VAL2','PK2');
INSERT INTO FKTABLE VALUES('PK3-VAL1','PK3');
INSERT INTO FKTABLE VALUES('PK3-VAL2','PK3');
SELECT * FROM FKTABLE;

DELETE FROM PKTABLE WHERE PKVAL='PK1';
SELECT * FROM PKTABLE;
SELECT * FROM FKTABLE;

--Q1 EMP_HW TABLE ����
DROP TABLE EMP_HW;
CREATE TABLE EMP_HW(
   empno NUMBER(4,0),
   ename varchar2(10),
   job varchar2(9),
   mgr number(4,0),
);
CREATE TABLE EMP_HW TABLE
--Q2 EMP_HW �÷� BIGO �߰� VARCHAR2(20)
ADD BIGO VARCHAR2(20);
--Q3 BIGO �÷��� Ÿ�� VARCHAR2(40)
ALTER TABLE EMP_HW
MODIFY BIGO VARCHAR2(40);
DESC EMP_HW;
--Q4 BIGO �÷��� �̸��� REMARK�� ����
ALTER TABLE EMP_HW
RENAME COLUMN BIGO TO REMARK;
--Q5 EMP_HW ���̺� ����
DROP TABLE EMP_HW;

