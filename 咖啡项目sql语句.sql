-- ������ռ�
 /*   CREATE TABLESPACE zjz_space
    DATAFILE 'C:\zjz_space.dbf'
    SIZE 10M;
  */

-- ɾ���˵���
-- DROP TABLE MenuInfo;

-- �����˵���
CREATE TABLE MenuInfo
(
    MenuID Number Primary Key Not Null,             -- ����Լ����Լ�����е����ݲ����ظ�
    MenuName Varchar2(2000) Not Null,   -- UNIQUE,        -- Ψһ��Լ����Լ�����������ظ�
    Price Number Not Null CHECK(Price >= 0)         -- ���Լ����Լ���۸�������0Ԫ
);

-- ɾ��   MenuInfo    �е�����
-- DROP SEQUENCE Seq_MenuInfo_ID;

-- ����   MenuInfo    ������
CREATE SEQUENCE Seq_MenuInfo_ID;

-- �����������   
INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,'Velit ut erat ultrices nec porta',02.00);
INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,'Lorem ipsum dolor sit ameontetuer',03.00);
INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,'Ameonsectetuer adipiscing elit',04.00);
INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,'Consectetuer a aesent vestibulum',08.00);
INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,'Praesent vestibulum molestie lacus',02.00);
INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,'Vestibulum molestie nean nonummy',02.00);
INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,'Aenean nonummy hendrerit mauris',05.00);
INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,'Phasellus portce suscipit varius mi',06.00);
INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,'Fusce suscipit variusum sociis que',04.00);
INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,'Velit ut erat ultrices nec porta ',06.00);
INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,'Praesent vestibulum molestie lacus ',9.00);
INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,'Lorem ipsum dolor sit consectetuer',03.00);

-- ѭ������1w������
DECLARE i Number;
    BEGIN
        i := 0;
        WHILE i < 1000 LOOP
            INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,CONCAT('Velit ut erat ultrices nec ',i),02.00);
            INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,CONCAT('Lorem ipsum dolor sit ',i),03.00);
            INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,CONCAT('Ameonsectetuer adipiscing ',i),04.00);
            INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,CONCAT('Consectetuer a aesent ',i),08.00);
            INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,CONCAT('Praesent vestibulum molestie ',i),02.00);
            INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,CONCAT('Vestibulum molestie nean ',i),02.00);
            INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,CONCAT('Aenean nonummy hendrerit ',i),05.00);
            INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,CONCAT('Phasellus portce suscipit mi',i),06.00);
            INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,CONCAT('Fusce suscipit variusum sociis ',i),04.00);
            INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,CONCAT('Velit ut erat ultrices nec  ',i),06.00);
            INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,CONCAT('Praesent vestibulum molestie  ',i),9.00);
            INSERT INTO MenuInfo(MenuID,MenuName,Price) VALUES(Seq_MenuInfo_ID.NEXTVAL,CONCAT('Lorem ipsum dolor sit ',i),03.00);
            i := i + 1;
        END LOOP;
    END;
    

-- ��ѯ�˵���
SELECT * FROM MenuInfo; 

-- ��ѯ������˵������ҳ��
SELECT CEIL(COUNT(*)/12) AS pageSum FROM MenuInfo;


-- ɾ�����ͱ�
--      DROP TABLE ReservationInfo;


-- ����ԤԼ���ͱ�
CREATE TABLE ReservationInfo
(
    ResID Number Primary Key Not Null,                      -- ����id
    ResPartySize Number Not Null CHECK(ResPartySize >= 1),  -- ����
    ResDate Date Not Null,                                  -- ����
    ResName Varchar2(200) Not Null,                         -- ����������
    ResEmail Varchar2(200) Not Null,                        -- ������email
    ResPhone Varchar2(20) Not Null,                         -- �����˵绰
    ResMessage Varchar2(2000) Not Null                      -- ����������
);

-- ɾ�����ͱ������
--      DROP SEQUENCE Seq_ReservationInfo_ID;

-- �������ͱ������
CREATE SEQUENCE Seq_ReservationInfo_ID;

-- �����������   ��ԤԼ���ͱ�
INSERT INTO ReservationInfo(ResID,ResPartySize,ResDate,ResName,ResEmail,ResPhone,ResMessage) 
VALUES(Seq_ReservationInfo_ID.NEXTVAL,2,to_date('2011-9-9','yyyy-MM-dd'),'Johnson','Johnson@163.com','18701234562','I want one cup coffee!');

--      DELETE ReservationInfo;

SELECT * FROM ReservationInfo;

-- ɾ���Ͳͱ�
--  DROP TABLE MailingInfo;

-- �����Ͳͱ�
CREATE TABLE MailingInfo
(
    MaiID Number Not Null Primary Key,
    MaiName Varchar2(200) Not Null,
    MaiAddress Varchar2(200) Not Null,
    MaiPhone Varchar2(20) Not Null,
    MaiMessage Varchar2(2000) Not Null
);


-- ɾ���Ͳͱ������
--  DROP SEQUENCE Seq_MailingInfo_ID;

-- �����Ͳͱ������
CREATE SEQUENCE Seq_MailingInfo_ID;

-- ���Ͳͱ��в����������
INSERT INTO MailingInfo(MaiID,MaiName,MaiAddress,MaiPhone,MaiMessage) 
VALUES(Seq_MailingInfo_ID.NEXTVAL,'Jackson','New York','+1 52981068','I want one cup milk tea!')

-- ��ѯ�Ͳͱ�
SELECT * FROM MailingInfo;

-- ��ҳ��ѯ
--SELECT *  FROM MenuInfo WHERE MenuID Not In (SELECT MenuID FROM MenuInfo )
 

--SELECT TOP 10 * FROM MenuInfo WHERE MenuID NOT IN (SELECT TOP (10*2) MenuID FROM MenuInfo);




--SELECT * FROM MenuInfo WHERE MenuID > (10*2);


--SELECT * FROM MenuInfo WHERE MenuID BETWEEN (0*10)+1 AND (10*(0+1));



--SELECT * FROM MenuInfo WHERE MenuID BETWEEN 13 AND 24


--SELECT * FROM ReservationInfo;
