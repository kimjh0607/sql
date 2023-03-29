/*
COLLECTION 컬렉션
데이터 타입(배열)
같은 데이터 타입을 가진 요소로 구성
여러 ROW를 가질 수 있음. (TABLE)
1. 가변 길이 배열(Variable size array(VARRAY))
        TYPE  [타입명]  IS {VARRAY|VARYING ARRAY} (크기) OF 요소데이터 타입(NOT NULL);
        선언시에 배열의 전체 크기를 명시.
        순서대로 참조함.
2. 중첩 테이블(Nested Table)
        TYPE [타입명] IS TABLE OF 요소데이터 타입[NOT NULL];
        크기 선언 불필요. 크기 제한이 없음.
        순서대로 참조할 필요없음.
3. 연관 배열(Associative Array(INDEX-BY TABLE))
        TYPE [타입명] IS TABLE OF 요소데이터 타입 [NOT NULL]
                INDEX BY[PLS-INTEGER|BINARY_INTEGER|VARCHAR2(크기)];
        키와 값을 쌍으로 타입(HASH MAP과 동일한 개념)
        키->INDEX.
컬렉션 메서드
*/
