-- create database haman;
 USE haman;
-- set autocommit=true;
-- show variables like 'autocommit';


-- 멤버 테이블
create table USER1(ID	VARCHAR(20) PRIMARY KEY,  	
			NAME VARCHAR(20) NOT NULL, 	
			PW VARCHAR(100) NOT NULL, 	
			ADDR VARCHAR(200), 	
			TEL	VARCHAR(13) NOT NULL, 	
			EMAIL VARCHAR(100), 	
			REGDATE DATETIME DEFAULT NOW());
            
-- 공지사항 테이블
create table NOTICE(NNO	VARCHAR(5) PRIMARY KEY,  
			TITLE VARCHAR(50) NOT NULL, 
			CONTENT	VARCHAR(1000), 
			ID VARCHAR(20), 
			NAME VARCHAR(20), 
			FILE1 VARCHAR(1000), 
			FILE2 VARCHAR(1000), 
			FILE3 VARCHAR(1000), 
			REGDATE	DATETIME DEFAULT NOW(),
			VIEWS INT DEFAULT 0,FOREIGN KEY(ID) REFERENCES USER1(ID));
select * from notice;

-- 민원 테이블
create table COMPLAIN(CNO VARCHAR(5) PRIMARY KEY, 
			TITLE VARCHAR(50) NOT NULL, 
			CONTENT	VARCHAR(1000), 
			ID	VARCHAR(20),
			NAME VARCHAR(20), 
			COMPANY	VARCHAR(20), 
			ADDR VARCHAR(200), 
			TEL	VARCHAR(13) NOT NULL, 
			FILE1 VARCHAR(1000), 
			REGDATE DATETIME DEFAULT NOW(),
			COMSW INT NOT NULL DEFAULT 1,
			REFNO VARCHAR(5) NOT NULL,
			FOREIGN KEY(ID) REFERENCES USER1(ID));
            
-- comsw 는 qna 스위치이다 1일경우 질문 2일경우 답변
-- refno는 참조번호

-- 포토갤러리 테이블
create table PHOTOG(PNO	VARCHAR(5) PRIMARY KEY, 
			TITLE VARCHAR(50) NOT NULL, 
			CONTENT	VARCHAR(1000), 
			ID	VARCHAR(20), 
			NAME VARCHAR(20), 
			FILE1 VARCHAR(1000) NOT NULL, 
			FILE2 VARCHAR(1000), 
			REGDATE	DATETIME DEFAULT NOW(),
			VIEWS INT DEFAULT 0,FOREIGN KEY(ID) REFERENCES USER1(ID));

-- 음식점테이블            
create table 	FOOD(FNO VARCHAR(5) PRIMARY KEY, 
			TITLE VARCHAR(50) NOT NULL, 
			ADDR VARCHAR(200) NOT NULL, 
			TEL VARCHAR(14) NOT NULL, 
			FILE1 VARCHAR(1000) NOT NULL, 
			REGDATE DATETIME DEFAULT NOW(),
			VIEWS INT DEFAULT 0,
            POINT FLOAT DEFAULT 0);
            
-- 숙소 테이블 -- alter table accom add point float default 0;      나중에 추가해준 포인트컬럼
create table ACCOM(ANO VARCHAR(5) PRIMARY KEY, 
			TITLE VARCHAR(50) NOT NULL, 
			ADDR VARCHAR(200) NOT NULL, 
			TEL VARCHAR(14) NOT NULL, 
			FILE1 VARCHAR(1000) NOT NULL, 
			REGDATE	DATETIME DEFAULT NOW(),
			VIEWS INT DEFAULT 0,
            POINT FLOAT DEFAULT 0);
            
      
-- 리뷰테이블 리뷰 고유번호, 리뷰 참조번호 , 아이디(한명이 악의적으로 평점을 여러개 줄 수 없도록), 포인트 리뷰점수 , 리뷰 내용 (요구할 시)
create table review(rno varchar(5) primary key,wno varchar(5) not null, 
	id varchar(20), point float not null default 5 , content varchar(1000),
    FOREIGN KEY(ID) REFERENCES USER1(ID));


-- 회원 더미 데이터
insert into 	USER1	 values('admin','관리자','1234','경기도 고양시','010-0000-0000','admin@naver.com',default);
update user1 set pw='LySS6ru/2ewkkXvE4EQjkqUhNBaUxmI0vs3nMbcDlxI/ZWQQAG1upbOe4eerLQdFYFrCMg==' where id='admin';
insert into 	USER1	 values('kim','김길동','1111','경기도 고양시','010-1111-1111','test1@naver.com',default);
update user1 set pw='5y3DrnUnN97CuOYVhaLZF1zVGQo4HB3VA++YiuW3kfetg5mppm8OJt9wgYSUTHZiH/zLMw==' where id='kim';
insert into 	USER1	 values('park','박길은','2222','경기도 고양시','010-2222-2222','test2@naver.com',default);
update user1 set pw='HPkV4oNAfzoXBEzTrhdUo1Vi2u1+484v2RYianbDyDqAfFJKmOinMr1KB3wY2JopYO3ehg==' where id='park';
insert into 	USER1	 values('lee','이길금','3333','경기도 고양시','010-3333-3333','test3@naver.com',default);
update user1 set pw='Hr0QEQoV0lPNdpv0tYDytDsmUkksMxzMke8aX59tJLH55MpQmyh6gL93lvmsLzQg+v041g==' where id='lee';
insert into 	USER1	 values('choi','최백금','4444','경기도 고양시','010-1111-1112','test4@naver.com',default);
update user1 set pw='xBhtj7wP33kLpksfV5t9VV0w8tPHtkQTg+lE4leQ99K6UnSyGkPCc2gV97kmcFo2AVODhQ==' where id='choi';
insert into 	USER1	 values('jho','조백은','5555','경기도 고양시','010-2222-2223','test5@naver.com',default);
update user1 set pw='QE8/7ZT6N7WeqAEt8a+aqvmAOHbtOZ4j8yrD0tP0hZ/l/mPOdlThnIOwJ96WkE2UUeF04w==' where id='jho';
insert into 	USER1	 values('whitekim','김백동','6666','경기도 고양시','010-3333-3334','test6@naver.com',default);
update user1 set pw='Yz6oIY1WqSIzrvF1c5ZwXTZoPFEcfoAmTl3J5j3fOrgfBLxP2sorg3CF7y+bXcjrwjn4zQ==' where id='whitekim';            

-- 공지사항 더미데이터
select * from notice;
update notice set file1='생태산책5.jpg' where nno='20012';
delete from notice where nno='20021';

insert into	notice values('20001','더미제목1','더미본문입니다1','admin','관리자','','','',default,default);
insert into	notice values('20002','더미제목2','더미본문입니다2','admin','관리자','','','',default,default);
insert into	notice values('20003','더미제목3','더미본문입니다3','admin','관리자','','','',default,default);
insert into	notice values('20004','더미제목4','더미본문입니다4','admin','관리자','','','',default,default);
insert into	notice values('20005','더미제목5','더미본문입니다5','admin','관리자','','','',default,default);
insert into	notice values('20006','더미제목6','더미본문입니다6','admin','관리자','','','',default,default);
insert into	notice values('20007','더미제목7','더미본문입니다7','admin','관리자','','','',default,default);
insert into	notice values('20008','더미제목8','더미본문입니다8','admin','관리자','','','',default,default);
insert into	notice values('20009','더미제목9','더미본문입니다9','admin','관리자','','','',default,default);
insert into	notice values('20010','더미제목10','더미본문입니다10','admin','관리자','','','',default,default);
insert into	notice values('20011','더미제목11','더미본문입니다11','admin','관리자','','','',default,default);
insert into	notice values('20012','더미제목12','더미본문입니다12','admin','관리자','','','',default,default);

insert into	notice values('20013','더미제목13','더미본문입니다3','admin','관리자','','','',default,default);
insert into	notice values('20014','더미제목14','더미본문입니다4','admin','관리자','','','',default,default);
insert into	notice values('20015','더미제목15','더미본문입니다5','admin','관리자','','','',default,default);
insert into	notice values('20016','더미제목16','더미본문입니다6','admin','관리자','','','',default,default);
insert into	notice values('20017','더미제목17','더미본문입니다7','admin','관리자','','','',default,default);
insert into	notice values('20018','더미제목18','더미본문입니다8','admin','관리자','','','',default,default);
insert into	notice values('20019','더미제목19','더미본문입니다9','admin','관리자','','','',default,default);
insert into	notice values('20020','더미제목20','더미본문입니다10','admin','관리자','','','',default,default);
insert into	notice values('20021','더미제목21','더미본문입니다1','admin','관리자','','','',default,default);
insert into	notice values('20022','더미제목22','더미본문입니다2','admin','관리자','','','',default,default);
insert into	notice values('20023','더미제목23','더미본문입니다3','admin','관리자','','','',default,default);
insert into	notice values('20024','더미제목24','더미본문입니다4','admin','관리자','','','',default,default);
insert into	notice values('20025','더미제목25','더미본문입니다5','admin','관리자','','','',default,default);
insert into	notice values('20026','더미제목26','더미본문입니다6','admin','관리자','','','',default,default);
insert into	notice values('20027','더미제목27','더미본문입니다7','admin','관리자','','','',default,default);
insert into	notice values('20028','더미제목28','더미본문입니다8','admin','관리자','','','',default,default);
insert into	notice values('20029','더미제목29','더미본문입니다9','admin','관리자','','','',default,default);
insert into	notice values('20030','더미제목30','더미본문입니다10','admin','관리자','','','',default,default);
insert into	notice values('20031','더미제목31','더미본문입니다1','admin','관리자','','','',default,default);
insert into	notice values('20032','더미제목32','더미본문입니다2','admin','관리자','','','',default,default);
insert into	notice values('20033','더미제목33','더미본문입니다3','admin','관리자','','','',default,default);
insert into	notice values('20034','더미제목34','더미본문입니다4','admin','관리자','','','',default,default);
insert into	notice values('20035','더미제목35','더미본문입니다5','admin','관리자','','','',default,default);
insert into	notice values('20036','더미제목36','더미본문입니다6','admin','관리자','','','',default,default);
insert into	notice values('20037','더미제목37','더미본문입니다7','admin','관리자','','','',default,default);
insert into	notice values('20038','더미제목38','더미본문입니다8','admin','관리자','','','',default,default);
insert into	notice values('20039','더미제목39','더미본문입니다9','admin','관리자','','','',default,default);
insert into	notice values('20040','더미제목40','더미본문입니다10','admin','관리자','','','',default,default);
insert into	notice values('20041','더미제목41','더미본문입니다1','admin','관리자','','','',default,default);
insert into	notice values('20042','더미제목42','더미본문입니다2','admin','관리자','','','',default,default);
insert into	notice values('20043','더미제목43','더미본문입니다3','admin','관리자','','','',default,default);
insert into	notice values('20044','더미제목44','더미본문입니다4','admin','관리자','','','',default,default);
insert into	notice values('20045','더미제목45','더미본문입니다5','admin','관리자','','','',default,default);
insert into	notice values('20046','더미제목46','더미본문입니다6','admin','관리자','','','',default,default);
insert into	notice values('20047','더미제목47','더미본문입니다7','admin','관리자','','','',default,default);
insert into	notice values('20048','더미제목48','더미본문입니다8','admin','관리자','','','',default,default);
insert into	notice values('20049','더미제목49','더미본문입니다9','admin','관리자','','','',default,default);
insert into	notice values('20050','더미제목50','더미본문입니다10','admin','관리자','','','',default,default);
insert into	notice values('20051','더미제목51','더미본문입니다1','admin','관리자','','','',default,default);
insert into	notice values('20052','더미제목52','더미본문입니다2','admin','관리자','','','',default,default);
insert into	notice values('20053','더미제목53','더미본문입니다3','admin','관리자','','','',default,default);
insert into	notice values('20054','더미제목54','더미본문입니다4','admin','관리자','','','',default,default);
insert into	notice values('20055','더미제목55','더미본문입니다5','admin','관리자','','','',default,default);
insert into	notice values('20056','더미제목56','더미본문입니다6','admin','관리자','','','',default,default);
insert into	notice values('20057','더미제목57','더미본문입니다7','admin','관리자','','','',default,default);
insert into	notice values('20058','더미제목58','더미본문입니다8','admin','관리자','','','',default,default);
insert into	notice values('20059','더미제목59','더미본문입니다9','admin','관리자','','','',default,default);
insert into	notice values('20060','더미제목60','더미본문입니다10','admin','관리자','','','',default,default);
insert into	notice values('20061','더미제목61','더미본문입니다1','admin','관리자','','','',default,default);
insert into	notice values('20062','더미제목62','더미본문입니다2','admin','관리자','','','',default,default);
insert into	notice values('20063','더미제목63','더미본문입니다3','admin','관리자','','','',default,default);
insert into	notice values('20064','더미제목64','더미본문입니다4','admin','관리자','','','',default,default);
insert into	notice values('20065','더미제목65','더미본문입니다5','admin','관리자','','','',default,default);
insert into	notice values('20066','더미제목66','더미본문입니다6','admin','관리자','','','',default,default);
insert into	notice values('20067','더미제목67','더미본문입니다7','admin','관리자','','','',default,default);
insert into	notice values('20068','더미제목68','더미본문입니다8','admin','관리자','','','',default,default);
insert into	notice values('20069','더미제목69','더미본문입니다9','admin','관리자','','','',default,default);
insert into	notice values('20070','더미제목70','더미본문입니다10','admin','관리자','','','',default,default);
insert into	notice values('20071','더미제목71','더미본문입니다1','admin','관리자','','','',default,default);
insert into	notice values('20072','더미제목72','더미본문입니다2','admin','관리자','','','',default,default);
insert into	notice values('20073','더미제목73','더미본문입니다3','admin','관리자','','','',default,default);
insert into	notice values('20074','더미제목74','더미본문입니다4','admin','관리자','','','',default,default);
insert into	notice values('20075','더미제목75','더미본문입니다5','admin','관리자','','','',default,default);
insert into	notice values('20076','더미제목76','더미본문입니다6','admin','관리자','','','',default,default);
insert into	notice values('20077','더미제목77','더미본문입니다7','admin','관리자','','','',default,default);
insert into	notice values('20078','더미제목78','더미본문입니다8','admin','관리자','','','',default,default);
insert into	notice values('20079','더미제목79','더미본문입니다9','admin','관리자','','','',default,default);
insert into	notice values('20080','더미제목80','더미본문입니다10','admin','관리자','','','',default,default);
insert into	notice values('20081','더미제목81','더미본문입니다1','admin','관리자','','','',default,default);
insert into	notice values('20082','더미제목82','더미본문입니다2','admin','관리자','','','',default,default);
insert into	notice values('20083','더미제목83','더미본문입니다3','admin','관리자','','','',default,default);
insert into	notice values('20084','더미제목84','더미본문입니다4','admin','관리자','','','',default,default);
insert into	notice values('20085','더미제목85','더미본문입니다5','admin','관리자','','','',default,default);
insert into	notice values('20086','더미제목86','더미본문입니다6','admin','관리자','','','',default,default);
insert into	notice values('20087','더미제목87','더미본문입니다7','admin','관리자','','','',default,default);
insert into	notice values('20088','더미제목88','더미본문입니다8','admin','관리자','','','',default,default);
insert into	notice values('20089','더미제목89','더미본문입니다9','admin','관리자','','','',default,default);
insert into	notice values('20090','더미제목90','더미본문입니다10','admin','관리자','','','',default,default);
insert into	notice values('20091','더미제목91','더미본문입니다1','admin','관리자','','','',default,default);
insert into	notice values('20092','더미제목92','더미본문입니다2','admin','관리자','','','',default,default);
insert into	notice values('20093','더미제목93','더미본문입니다3','admin','관리자','','','',default,default);
insert into	notice values('20094','더미제목94','더미본문입니다4','admin','관리자','','','',default,default);
insert into	notice values('20095','더미제목95','더미본문입니다5','admin','관리자','','','',default,default);
insert into	notice values('20096','더미제목96','더미본문입니다6','admin','관리자','','','',default,default);
insert into	notice values('20097','더미제목97','더미본문입니다7','admin','관리자','','','',default,default);
insert into	notice values('20098','더미제목98','더미본문입니다8','admin','관리자','','','',default,default);
insert into	notice values('20099','더미제목99','더미본문입니다9','admin','관리자','','','',default,default);
insert into	notice values('20100','더미제목100','더미본문입니다10','admin','관리자','','','',default,default);
insert into	notice values('20101','더미제목101','더미본문입니다1','admin','관리자','','','',default,default);
insert into	notice values('20102','더미제목102','더미본문입니다2','admin','관리자','','','',default,default);
insert into	notice values('20103','더미제목103','더미본문입니다3','admin','관리자','','','',default,default);
insert into	notice values('20104','더미제목104','더미본문입니다4','admin','관리자','','','',default,default);
insert into	notice values('20105','더미제목105','더미본문입니다5','admin','관리자','','','',default,default);
insert into	notice values('20106','더미제목106','더미본문입니다6','admin','관리자','','','',default,default);
insert into	notice values('20107','더미제목107','더미본문입니다7','admin','관리자','','','',default,default);
insert into	notice values('20108','더미제목108','더미본문입니다8','admin','관리자','','','',default,default);
insert into	notice values('20109','더미제목109','더미본문입니다9','admin','관리자','','','',default,default);

-- 민원 더미데이터
insert into complain values('30001', '민원제목1', '민원에대한 본문입니다1','kim', '김길동', '무직','경기도 고양시 일산구','010-1111-1111','첨부파일없음',default,DEFAULT,'30001');
insert into complain values('30002', '민원제목2', '민원에대한 본문입니다2','kim', '김길동', '무직','경기도 고양시 일산구','010-1111-1111','첨부파일없음',default,default,'30002');
insert into complain values('30003', '민원제목3', '민원에대한 본문입니다3','kim', '김길동', '무직','경기도 고양시 일산구','010-1111-1111','첨부파일없음',default,default,'30003');
insert into complain values('30004', '민원제목4', '민원에대한 본문입니다4','kim', '김길동', '무직','경기도 고양시 일산구','010-1111-1111','첨부파일없음',default,default,'30004');
insert into complain values('30005', '민원제목5', '민원에대한 본문입니다5','kim', '김길동', '무직','경기도 고양시 일산구','010-1111-1111','첨부파일없음',default,default,'30005');

-- 숙박업소 더미데이터
INSERT INTO accom VALUES('60001','함안숙박업소1','경상남도 함안군','070-0101-0101','첨부파일 없음',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO accom VALUES('60002','함안숙박업소2','경상남도 함안군','070-0202-0202','첨부파일 없음',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO accom VALUES('60003','함안숙박업소3','경상남도 함안군','070-0303-0303','첨부파일 없음',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO accom VALUES('60004','함안숙박업소4','경상남도 함안군','070-0404-0404','첨부파일 없음',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO accom VALUES('60005','함안숙박업소5','경상남도 함안군','070-0505-0505','첨부파일 없음',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO accom VALUES('60006','함안숙박업소6','경상남도 함안군','070-0606-0606','첨부파일 없음',DEFAULT,DEFAULT,DEFAULT);
insert into accom values('60007','러빙유모텔'	,'(52016) 경남 함안군 칠북면 북원로 108, 러빙유모텔','055-587-8900','60005.jpg',default,default,default);
insert into accom values('60008','아바나모텔',	'(52025) 경남 함안군 칠원읍 동대이길 52, 아바나모텔',	'055-586-0211',	'60001.jpg',	default,default,default);
insert into accom values('60009','동화모텔',	'(52041) 경남 함안군 가야읍 방목1길 45, 동화모텔',	'055-583-9376',	'60002.jpg',	default,default,default);
insert into accom values('60010','중앙장모텔',	'(52046) 경남 함안군 가야읍 중앙남1길 25-1, 중앙장',	'055-583-6318',	'60003.jpg',	default,default,default);
insert into accom values('60011','루팡호텔',	'(52045) 경남 함안군 가야읍 장터길 101, 루팡호텔',	'055-584-9400',	'60004.jpg',	default,default,default);

-- 음식점 더미데이터
select * from  food;
INSERT INTO food VALUES('50001','함안음식점1','경상남도 함안군','0505-0101-0101','첨부파일 없음',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO food VALUES('50002','함안음식점2','경상남도 함안군','0505-0202-0202','첨부파일 없음',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO food VALUES('50003','함안음식점3','경상남도 함안군','0505-0303-0303','첨부파일 없음',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO food VALUES('50004','함안음식점4','경상남도 함안군','0505-0404-0404','첨부파일 없음',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO food VALUES('50005','함안음식점5','경상남도 함안군','0505-0505-0505','첨부파일 없음',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO food VALUES('50006','함안음식점6','경상남도 함안군','0505-0606-0606','첨부파일 없음',DEFAULT,DEFAULT,DEFAULT);
insert into food values('50007',	'스톤커피',	'(52057) 경남 함안군 법수면 법수로 577, 스톤커피',	'010-5090-6993',	'50001.jpg',default,default,default);
insert into food values('50008',	'아라밀면',	'(52046) 경남 함안군 가야읍 중앙남길 36, 아라밀면',	'055-583-1882',	'50002.jpg',default,default,default);
insert into food values('50009',	'옛날 시골 보리밥',	'(52001) 경남 함안군 칠서면 계내3길 19, 옛날 시골 보리밥',	'055-586-0680',	'50003.jpg',default,default,default);
insert into food values('50010',	'꽃대궐 part 2',	'(52011) 경남 함안군 대산면 대산중앙로 11-2, 꽃대궐',	'070-4154-1060',	'50004.jpg',default,default,default);
insert into food values('50011',	'안고집',	'(52016) 경남 함안군 칠원읍 북원로 25, 안고집',	'055-587-1403',	'50005.jpg',default,default,default);

-- 포토갤러리
select * from  photog;
INSERT INTO photog VALUES('40001','포토갤러리 제목1','포토갤러리의 내용입니다1','kim','김길동','첨부파일 없음','첨부파일 없음',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO photog VALUES('40002','포토갤러리 제목2','포토갤러리의 내용입니다2','kim','김길동','첨부파일 없음','첨부파일 없음',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO photog VALUES('40003','포토갤러리 제목3','포토갤러리의 내용입니다3','kim','김길동','첨부파일 없음','첨부파일 없음',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO photog VALUES('40004','포토갤러리 제목4','포토갤러리의 내용입니다4','kim','김길동','첨부파일 없음','첨부파일 없음',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO photog VALUES('40005','포토갤러리 제목5','포토갤러리의 내용입니다5','kim','김길동','첨부파일 없음','첨부파일 없음',DEFAULT,DEFAULT,DEFAULT);
insert into photog values('40006',	'강주리 해바라기 !',	'강주리 해바라기 지난 가을의 풍경',	'kim',	'김길동',	'40001_1.jpg',	'40001_2.jpg',	default,default);
insert into photog values('40007',	'강나루 생태공원 !',	'칠서강나루 공원을 찾아서',	'kim',	'김길동',	'40002_1.jpg',	'40002_2.jpg',	default,default);
insert into photog values('40008',	'함안 뚝방길을 찾아서 !',		
'뚝방길을 찾아서
인근 지역보다 여가와 휴식처를.제공하여 
모든 사람들의 공간이 되어 
더욱 좋은 곳',	'kim',	'김길동',	'40008_1.jpg',	'40008_2.jpg',	default,default);
insert into photog values('40009',	'함주 연꽃 테마공원',	'7월23일 아라 홍연꽃이 개화를 시작',	'kim',	'김길동',	'40004_1.jpg',	'40004_2.jpg',	default,default);
insert into photog values('40010',	'탁자식 고인돌',	'북방식  지석묘 -청동기 시대',	'kim',	'김길동',	'40005_1.jpg',	'40005_2.jpg',	default,default);
