-- 创建表空间
 /*   CREATE TABLESPACE zjz_space
    DATAFILE 'C:\zjz_space.dbf'
    SIZE 10M;
  */

-- 删除菜单表
-- DROP TABLE MenuInfo;

-- 创建菜单表
CREATE TABLE MenuInfo
(
    MenuID Number Primary Key Not Null,             -- 主键约束，约束表中的数据不能重复
    MenuName Varchar2(2000) Not Null,   -- UNIQUE,        -- 唯一键约束，约束菜名不能重复
    Price Number Not Null CHECK(Price >= 0)         -- 检查约束，约束价格必须大于0元
);

-- 删除   MenuInfo    中的序列
-- DROP SEQUENCE Seq_MenuInfo_ID;

-- 创建   MenuInfo    中序列
CREATE SEQUENCE Seq_MenuInfo_ID;

-- 插入测试数据   
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

-- 循环插入1w条数据
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
    

-- 查询菜单表
SELECT * FROM MenuInfo; 

-- 查询并计算菜单表的总页数
SELECT CEIL(COUNT(*)/12) AS pageSum FROM MenuInfo;


-- 删除订餐表
--      DROP TABLE ReservationInfo;


-- 创建预约订餐表
CREATE TABLE ReservationInfo
(
    ResID Number Primary Key Not Null,                      -- 主键id
    ResPartySize Number Not Null CHECK(ResPartySize >= 1),  -- 人数
    ResDate Date Not Null,                                  -- 日期
    ResName Varchar2(200) Not Null,                         -- 订餐人姓名
    ResEmail Varchar2(200) Not Null,                        -- 订餐人email
    ResPhone Varchar2(20) Not Null,                         -- 订餐人电话
    ResMessage Varchar2(2000) Not Null                      -- 订餐人留言
);

-- 删除订餐表的序列
--      DROP SEQUENCE Seq_ReservationInfo_ID;

-- 创建订餐表的序列
CREATE SEQUENCE Seq_ReservationInfo_ID;

-- 插入测试数据   （预约订餐表）
INSERT INTO ReservationInfo(ResID,ResPartySize,ResDate,ResName,ResEmail,ResPhone,ResMessage) 
VALUES(Seq_ReservationInfo_ID.NEXTVAL,2,to_date('2011-9-9','yyyy-MM-dd'),'Johnson','Johnson@163.com','18701234562','I want one cup coffee!');

--      DELETE ReservationInfo;

SELECT * FROM ReservationInfo;

-- 删除送餐表
--  DROP TABLE MailingInfo;

-- 创建送餐表
CREATE TABLE MailingInfo
(
    MaiID Number Not Null Primary Key,
    MaiName Varchar2(200) Not Null,
    MaiAddress Varchar2(200) Not Null,
    MaiPhone Varchar2(20) Not Null,
    MaiMessage Varchar2(2000) Not Null
);


-- 删除送餐表的序列
--  DROP SEQUENCE Seq_MailingInfo_ID;

-- 创建送餐表的序列
CREATE SEQUENCE Seq_MailingInfo_ID;

-- 想送餐表中插入测试数据
INSERT INTO MailingInfo(MaiID,MaiName,MaiAddress,MaiPhone,MaiMessage) 
VALUES(Seq_MailingInfo_ID.NEXTVAL,'Jackson','New York','+1 52981068','I want one cup milk tea!')

-- 查询送餐表
SELECT * FROM MailingInfo;

-- 分页查询
--SELECT *  FROM MenuInfo WHERE MenuID Not In (SELECT MenuID FROM MenuInfo )
 

--SELECT TOP 10 * FROM MenuInfo WHERE MenuID NOT IN (SELECT TOP (10*2) MenuID FROM MenuInfo);




--SELECT * FROM MenuInfo WHERE MenuID > (10*2);


--SELECT * FROM MenuInfo WHERE MenuID BETWEEN (0*10)+1 AND (10*(0+1));



--SELECT * FROM MenuInfo WHERE MenuID BETWEEN 13 AND 24


--SELECT * FROM ReservationInfo;
