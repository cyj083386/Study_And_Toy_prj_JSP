-- 연관 관계 설정시, FK 보유 자식 테이블 부터 먼저 삭제 해야함.
-- 아니면 constraint로 관계를 끊는다.
DROP TABLE IF EXISTS member;
CREATE TABLE member(
                       id varchar(10) NOT NULL,
                       pass varchar(10) NOT NULL,
                       name varchar(10) NOT NULL,
                       redgidate date DEFAULT(current_date) NOT NULL,
                       PRIMARY KEY (id)
);

DROP TABLE IF EXISTS board;
CREATE TABLE board(
                      num int PRIMARY KEY AUTO_INCREMENT,
                      title varchar(20) NOT NULL,
                      content varchar(200) NOT NULL,
                      id varchar(10) NOT NULL,
                      postdate date DEFAULT(current_date) NOT NULL,
                      visitcount decimal(6)
);



ALTER TABLE board
    ADD CONSTRAINT board_mem_fk foreign key(id)
        REFERENCES MEMBER (id);

insert INTO `member`(id, pass, name)
VALUES('musthave', '1234', '머스트해브');

SELECT * FROM member;


-- member.id에 musthave가 없으면 안들어감~
INSERT INTO board(title, content, id, visitcount)
values('제목1입니다', '내용1입니다', 'musthave', 0);

-- SQL Error [1452] [23000]: (conn=182)
-- Cannot add or update a child row: a foreign key constraint fails
-- (`musthave`.`board`, CONSTRAINT `board_mem_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`))

INSERT INTO board(title, content, id, visitcount)
values('제목1입니다', '내용1입니다', 'cyj', 0);

SELECT * FROM board;

-- 이렇게 삭제하면.. AUTO_INCREMENT가 남는다. 따라서 테이블 자체를 Drop 해야됨
DELETE FROM board WHERE num >= 1;