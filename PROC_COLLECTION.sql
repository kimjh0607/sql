/*
COLLECTION �÷���
������ Ÿ��(�迭)
���� ������ Ÿ���� ���� ��ҷ� ����
���� ROW�� ���� �� ����. (TABLE)
1. ���� ���� �迭(Variable size array(VARRAY))
        TYPE  [Ÿ�Ը�]  IS {VARRAY|VARYING ARRAY} (ũ��) OF ��ҵ����� Ÿ��(NOT NULL);
        ����ÿ� �迭�� ��ü ũ�⸦ ���.
        ������� ������.
2. ��ø ���̺�(Nested Table)
        TYPE [Ÿ�Ը�] IS TABLE OF ��ҵ����� Ÿ��[NOT NULL];
        ũ�� ���� ���ʿ�. ũ�� ������ ����.
        ������� ������ �ʿ����.
3. ���� �迭(Associative Array(INDEX-BY TABLE))
        TYPE [Ÿ�Ը�] IS TABLE OF ��ҵ����� Ÿ�� [NOT NULL]
                INDEX BY[PLS-INTEGER|BINARY_INTEGER|VARCHAR2(ũ��)];
        Ű�� ���� ������ Ÿ��(HASH MAP�� ������ ����)
        Ű->INDEX.
�÷��� �޼���
*/
