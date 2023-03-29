/*
    TRIGGER
    데이터베이스 특정 동작(이벤트)에 반응하여 실행되는 개체
    무결성, 자동화 목적
    CREATE OR REPLACE TRIGGER 트리거명
    {BEFORE|AFTER} 이벤트명 {INSERT|UPDATE|DELETE}
    [OF 특정 컬럼]
    ON 테이블명
    [REFERENCING OLD AS OLD|NEW AS NEW]
    [FOR EACH ROW WHEN 조건절]
    [FOLLOWS]
    [ENABLE|DISABLE]
    선언부
    실행부
    END 트리거명;
    
    RAISE_APPLICATION_ERROR(사용자 오류 에러)
    RAISE_APPLICATION_ERROR(에러코드, 에러메세지)
    에러코드 범위: -20000~20999 사이
*/
CREATE OR REPLACE TRIGGER TRIG1
BEFORE INSERT OR UPDATE OR DELETE ON EMP_TRIG
BEGIN
        IF TO_CHAR(SYSDATE, 'DY') IN ('토' , '일' , '수') THEN
            IF INSERTING THEN 
                RAISE_APPLICATION_ERROR(-20000, '사원 정보 추가 불가');
            ELSIF UPDATING THEN
                RAISE_APPLICATION_ERROR(-20001, '사원 정보 수정 불가');    
            ELSIF DELETING THEN
                RAISE_APPLICATION_ERROR(-20002, '사원 정보 삭제 불가');
            ELSE
                RAISE_APPLICATION_ERROR(-20003, '사원 정보 변경 불가');
            END IF;
        END IF;
END;