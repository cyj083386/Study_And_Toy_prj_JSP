use musthave;

drop table mvcboard;
create table mvcboard (
	idx int primary key AUTO_INCREMENT,
	name varchar(50) not null, 
	title varchar(200) not null, 
	content varchar(2000) not null, 
	postdate date default sysdate() not null, 
	ofile varchar(200), 
	sfile varchar(30), 
	downcount DECIMAL(5) default 0 not null, 
	pass varchar(50) not null, 
	visitcount int default 0 not null
);



CREATE TABLE member(
	id varchar(10) NOT NULL,
	pass varchar(10) NOT NULL,
	name varchar(10) NOT NULL,
	register date DEFAULT (current_date) NOT NULL,
	PRIMARY key(id)
);


CREATE TABLE board(
	num int PRIMARY KEY AUTO_INCREMENT,
	title varchar(20) NOT NULL,
	content varchar(200) NOT NULL,
	id varchar(10) NOT NULL,
	postdate date DEFAULT (current_date) NOT NULL,
	visitcount decimal(6)
);

ALTER TABLE board 
  ADD CONSTRAINT board_mem_fk FOREIGN KEY (id)
  REFERENCES MEMBER (id);

INSERT INTO member(id, pass, name) values('musthave', '1234', '머스트해브'); 
SELECT * FROM MEMBER;

 
INSERT INTO board(title, content, id, visitcount) values('제목1입니다.', '내용1입니다.','musthave', 0); 
 SELECT * FROM board;
 

insert into board(title, content, id, postdate ,visitcount)
	values ( '지금은 봄입니다', '봄의왈츠', 'musthave', sysdate(), 0);
insert into board(title, content, id, postdate ,visitcount)
	values ( '지금은 여름입니다', '여름향기', 'musthave', sysdate(), 0);
insert into board(title, content, id, postdate ,visitcount)
	values ( '지금은 가을입니다', '가을동화', 'musthave', sysdate(), 0);
insert into board(title, content, id, postdate ,visitcount)
	values ( '지금은 겨울입니다', '겨울연가', 'musthave', sysdate(), 0);		\
	
	
	
	
SET @ROWNUM :=0;
SELECT @ROWNUM :=@ROWNUM + 1 AS NO, Tb.* FROM (SELECT * FROM board WHERE title LIKE '%%' ) tb, (SELECT @ROWNUM := 0) R
ORDER BY num desc LIMIT 1, 10;

SET @ROWNUM :=0;
SELECT tb.* FROM (SELECT * FROM mvcboard WHERE title LIKE '%%' ) Tb
ORDER BY idx desc LIMIT 1, 10;



--더미 데이터 입력
insert into mvcboard (name, title, content, pass)
    values ( '김유신', '자료실 제목1 입니다.','내용','1234');
insert into mvcboard ( name, title, content, pass)
    values ( '장보고', '자료실 제목2 입니다.','내용','1234');
insert into mvcboard (name, title, content, pass)
    values ( '이순신', '자료실 제목3 입니다.','내용','1234');
insert into mvcboard ( name, title, content, pass)
    values ( '강감찬', '자료실 제목4 입니다.','내용','1234');
insert into mvcboard ( name, title, content, pass)
    values ( '대조영', '자료실 제목5 입니다.','내용','1234');