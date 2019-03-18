
/* Drop Tables */

DROP TABLE EnrollClass CASCADE CONSTRAINTS;
DROP TABLE AcaClass CASCADE CONSTRAINTS;
DROP TABLE AcaIntroduce CASCADE CONSTRAINTS;
DROP TABLE AcaTeacher CASCADE CONSTRAINTS;
DROP TABLE Category CASCADE CONSTRAINTS;
DROP TABLE ReviewWrite CASCADE CONSTRAINTS;
DROP TABLE Members CASCADE CONSTRAINTS;




/* Create Tables */

-- 학원강의및시간
CREATE TABLE AcaClass
(
	-- 강의시작년월일
	AcaStartDate date NOT NULL,
	-- 강의종료년월일
	AcaEndDate date NOT NULL,
	-- 강의요일
	AcaDay varchar2(100) NOT NULL,
	-- 강의시작시간
	AcaStartTime date NOT NULL,
	-- 강의종료시간
	AcaEndTime date NOT NULL,
	-- 강의명
	AcaClassName varchar2(3000) NOT NULL,
	-- 수강인원
	NumberOfParticipants number NOT NULL,
	-- 강의고유번호
	ClassIdx number NOT NULL,
	-- 강사고유번호
	TeaIdx number NOT NULL,
	-- 수강료
	pay number NOT NULL,
	PRIMARY KEY (ClassIdx)
);


-- 학원소개
CREATE TABLE AcaIntroduce
(
	-- 학원소개
	Introduce varchar2(3000),
	-- 학원의 카테고리
	Category varchar2(100),
	-- 학원소개사진
	AcaIntroPhoto varchar2(3000),
	-- 아이디
	id varchar2(300) NOT NULL
);


-- 학원선생님
CREATE TABLE AcaTeacher
(
	-- 강사이미지
	TeaImage varchar2(3000),
	-- 강사명
	TeaName varchar2(100) NOT NULL,
	-- 강사소개
	TeaIntro varchar2(3000) NOT NULL,
	-- 강의과목
	Subject varchar2(100) NOT NULL,
	-- 강사고유번호
	TeaIdx number NOT NULL,
	-- 아이디
	id varchar2(300) NOT NULL,
	PRIMARY KEY (TeaIdx)
);


-- 학원의카테고리
CREATE TABLE Category
(
	-- 대분류
	MainCategory varchar2(50) NOT NULL,
	-- 중분류
	MiddleCategory varchar2(50)
);


-- 학생 수강내역
CREATE TABLE EnrollClass
(
	-- 아이디
	id varchar2(300) NOT NULL,
	-- 강의고유번호
	ClassIdx number NOT NULL
);


-- 회원
CREATE TABLE Members
(
	-- 아이디
	id varchar2(300) NOT NULL,
	-- 비밀번호
	pass varchar2(300) NOT NULL,
	-- 가입일
	Regidate date DEFAULT sysdate NOT NULL,
	-- 이메일아이디
	EmailId varchar2(300) NOT NULL,
	-- 이메일도메인
	EmailDomain varchar2(300) NOT NULL,
	-- 휴대폰번호1
	mobile1 varchar2(10) NOT NULL,
	-- 회원명
	Name varchar2(100) NOT NULL,
	-- 회원고유번호
	Idx number UNIQUE,
	-- 회원등급
	Grade number NOT NULL,
	-- 학원전화번호1
	telephone1 varchar2(10),
	-- 주소
	Address varchar2(1000),
	-- 상세주소
	DetailAddress varchar2(1000),
	-- 관심사
	Interest varchar2(1000),
	-- 학원명
	AcaName varchar2(100),
	-- 휴대폰번호2
	mobile2 varchar2(10),
	-- 휴대폰번호3
	mobile3 varchar2(10),
	-- 학원전화번호2
	telephone2 varchar2(10),
	-- 학원전화번호3
	telephone3 varchar2(10),
	PRIMARY KEY (id)
);


-- 리뷰작성
CREATE TABLE ReviewWrite
(
	-- 리뷰내용
	ReviewContents varchar2(3000) NOT NULL,
	-- 별점
	Score number NOT NULL,
	-- 작성일자
	WriteTime date DEFAULT sysdate NOT NULL,
	-- 아이디
	id varchar2(300) NOT NULL,
	-- 학원의고유번호
	acaidx number NOT NULL,
	-- 리뷰의고유번호
	ReviewIdx number NOT NULL
);



/* Create Foreign Keys */

ALTER TABLE EnrollClass
	ADD FOREIGN KEY (ClassIdx)
	REFERENCES AcaClass (ClassIdx)
;


ALTER TABLE AcaClass
	ADD FOREIGN KEY (TeaIdx)
	REFERENCES AcaTeacher (TeaIdx)
;


ALTER TABLE AcaIntroduce
	ADD FOREIGN KEY (id)
	REFERENCES Members (id)
;


ALTER TABLE AcaTeacher
	ADD FOREIGN KEY (id)
	REFERENCES Members (id)
;


ALTER TABLE EnrollClass
	ADD FOREIGN KEY (id)
	REFERENCES Members (id)
;


ALTER TABLE ReviewWrite
	ADD FOREIGN KEY (id)
	REFERENCES Members (id)
;



/* Comments */

COMMENT ON TABLE AcaClass IS '학원강의및시간';
COMMENT ON COLUMN AcaClass.AcaStartDate IS '강의시작년월일';
COMMENT ON COLUMN AcaClass.AcaEndDate IS '강의종료년월일';
COMMENT ON COLUMN AcaClass.AcaDay IS '강의요일';
COMMENT ON COLUMN AcaClass.AcaStartTime IS '강의시작시간';
COMMENT ON COLUMN AcaClass.AcaEndTime IS '강의종료시간';
COMMENT ON COLUMN AcaClass.AcaClassName IS '강의명';
COMMENT ON COLUMN AcaClass.NumberOfParticipants IS '수강인원';
COMMENT ON COLUMN AcaClass.ClassIdx IS '강의고유번호';
COMMENT ON COLUMN AcaClass.TeaIdx IS '강사고유번호';
COMMENT ON COLUMN AcaClass.pay IS '수강료';
COMMENT ON TABLE AcaIntroduce IS '학원소개';
COMMENT ON COLUMN AcaIntroduce.Introduce IS '학원소개';
COMMENT ON COLUMN AcaIntroduce.Category IS '학원의 카테고리';
COMMENT ON COLUMN AcaIntroduce.AcaIntroPhoto IS '학원소개사진';
COMMENT ON COLUMN AcaIntroduce.id IS '아이디';
COMMENT ON TABLE AcaTeacher IS '학원선생님';
COMMENT ON COLUMN AcaTeacher.TeaImage IS '강사이미지';
COMMENT ON COLUMN AcaTeacher.TeaName IS '강사명';
COMMENT ON COLUMN AcaTeacher.TeaIntro IS '강사소개';
COMMENT ON COLUMN AcaTeacher.Subject IS '강의과목';
COMMENT ON COLUMN AcaTeacher.TeaIdx IS '강사고유번호';
COMMENT ON COLUMN AcaTeacher.id IS '아이디';
COMMENT ON TABLE Category IS '학원의카테고리';
COMMENT ON COLUMN Category.MainCategory IS '대분류';
COMMENT ON COLUMN Category.MiddleCategory IS '중분류';
COMMENT ON TABLE EnrollClass IS '학생 수강내역';
COMMENT ON COLUMN EnrollClass.id IS '아이디';
COMMENT ON COLUMN EnrollClass.ClassIdx IS '강의고유번호';
COMMENT ON TABLE Members IS '회원';
COMMENT ON COLUMN Members.id IS '아이디';
COMMENT ON COLUMN Members.pass IS '비밀번호';
COMMENT ON COLUMN Members.Regidate IS '가입일';
COMMENT ON COLUMN Members.EmailId IS '이메일아이디';
COMMENT ON COLUMN Members.EmailDomain IS '이메일도메인';
COMMENT ON COLUMN Members.mobile1 IS '휴대폰번호1';
COMMENT ON COLUMN Members.Name IS '회원명';
COMMENT ON COLUMN Members.Idx IS '회원고유번호';
COMMENT ON COLUMN Members.Grade IS '회원등급';
COMMENT ON COLUMN Members.telephone1 IS '학원전화번호1';
COMMENT ON COLUMN Members.Address IS '주소';
COMMENT ON COLUMN Members.DetailAddress IS '상세주소';
COMMENT ON COLUMN Members.Interest IS '관심사';
COMMENT ON COLUMN Members.AcaName IS '학원명';
COMMENT ON COLUMN Members.mobile2 IS '휴대폰번호2';
COMMENT ON COLUMN Members.mobile3 IS '휴대폰번호3';
COMMENT ON COLUMN Members.telephone2 IS '학원전화번호2';
COMMENT ON COLUMN Members.telephone3 IS '학원전화번호3';
COMMENT ON TABLE ReviewWrite IS '리뷰작성';
COMMENT ON COLUMN ReviewWrite.ReviewContents IS '리뷰내용';
COMMENT ON COLUMN ReviewWrite.Score IS '별점';
COMMENT ON COLUMN ReviewWrite.WriteTime IS '작성일자';
COMMENT ON COLUMN ReviewWrite.id IS '아이디';
COMMENT ON COLUMN ReviewWrite.acaidx IS '학원의고유번호';
COMMENT ON COLUMN ReviewWrite.ReviewIdx IS '리뷰의고유번호';



