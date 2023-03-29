/*
    TRIGGER
    �����ͺ��̽� Ư�� ����(�̺�Ʈ)�� �����Ͽ� ����Ǵ� ��ü
    ���Ἲ, �ڵ�ȭ ����
    CREATE OR REPLACE TRIGGER Ʈ���Ÿ�
    {BEFORE|AFTER} �̺�Ʈ�� {INSERT|UPDATE|DELETE}
    [OF Ư�� �÷�]
    ON ���̺��
    [REFERENCING OLD AS OLD|NEW AS NEW]
    [FOR EACH ROW WHEN ������]
    [FOLLOWS]
    [ENABLE|DISABLE]
    �����
    �����
    END Ʈ���Ÿ�;
    
    RAISE_APPLICATION_ERROR(����� ���� ����)
    RAISE_APPLICATION_ERROR(�����ڵ�, �����޼���)
    �����ڵ� ����: -20000~20999 ����
*/
CREATE OR REPLACE TRIGGER TRIG1
BEFORE INSERT OR UPDATE OR DELETE ON EMP_TRIG
BEGIN
        IF TO_CHAR(SYSDATE, 'DY') IN ('��' , '��' , '��') THEN
            IF INSERTING THEN 
                RAISE_APPLICATION_ERROR(-20000, '��� ���� �߰� �Ұ�');
            ELSIF UPDATING THEN
                RAISE_APPLICATION_ERROR(-20001, '��� ���� ���� �Ұ�');    
            ELSIF DELETING THEN
                RAISE_APPLICATION_ERROR(-20002, '��� ���� ���� �Ұ�');
            ELSE
                RAISE_APPLICATION_ERROR(-20003, '��� ���� ���� �Ұ�');
            END IF;
        END IF;
END;