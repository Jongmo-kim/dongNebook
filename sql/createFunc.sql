CREATE OR REPLACE FUNCTION GET_KORNM
(
    
    V_FROM  IN    VARCHAR2,
    V_TO    IN    VARCHAR2
           
)
RETURN VARCHAR2
IS
    
    OUT_REAL_NM VARCHAR2(100);
    TYPE V_ARR IS TABLE OF VARCHAR2(10);
    V_FIRST V_ARR;
    V_LAST  V_ARR;
    V_MID   V_ARR; 
    
    
BEGIN
    
    V_LAST  :=  V_ARR('김' , '이' , '박' , '최' , '정'
                    , '강' , '조' , '윤' , '장' , '임'
                    , '오' , '한' , '신' , '서' , '권'
                    , '황' , '안' , '송' , '유' , '홍'
                    , '전' , '고' , '문' , '손' , '양'
                    , '배' , '조' , '백' , '허' , '남');
                     
    V_MID   :=  V_ARR('민' , '현' , '동' , '인' , '지'
                    , '현' , '재' , '우' , '건' , '준'
                    , '승' , '영' , '성' , '진' , '준'
                    , '정' , '수' , '광' , '영' , '호'
                    , '중' , '훈' , '후' , '우' , '상'
                    , '연' , '철' , '아' , '윤' , '은');
                    
    V_FIRST :=  V_ARR('유' , '자' , '도' , '성' , '상'
                    , '남' , '식' , '일' , '철' , '병'
                    , '혜' , '영' , '미' , '환' , '식'
                    , '숙' , '자' , '희' , '순' , '진'
                    , '서' , '빈' , '정' , '지' , '하'
                    , '연' , '성' , '공' , '안' , '원');              
    
    SELECT SUBSTR(V_LAST(ROUND(DBMS_RANDOM.VALUE(1 , 30), 0)) || 
                  V_MID(ROUND(DBMS_RANDOM.VALUE(1 , 30), 0)) ||
                  V_FIRST(ROUND(DBMS_RANDOM.VALUE(1 , 30), 0)) ||
                  V_MID(ROUND(DBMS_RANDOM.VALUE(1 , 30), 0)) ||
                  V_FIRST(ROUND(DBMS_RANDOM.VALUE(1 , 30), 0))
                 ,V_FROM,V_TO)
      INTO OUT_REAL_NM
      FROM DUAL;
   
    
    RETURN OUT_REAL_NM;
    
END;
/