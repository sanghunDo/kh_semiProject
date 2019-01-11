show user;

--아래코드를 입력하셔서 총 9개의 테이블이 생성 되었는 지 확인 부탁드립니다.
--select * from tab;

--* 참고사항 *
--1. 회원탈퇴가 발생할 때 게임정보나 게시글은 삭제되지 않도록 하기로 했으므로
--   그에 해당하는 foreign key 조건이 없는 점 참고 부탁드립니다. 
--   (댓글 테이블에는 게시글 번호에 대한 foreign key 조건이 있습니다.)

--2. 게임이어하기를 위한 테이블은 게임을 짜면서 만들어야할 것 같아서 아직 없습니다.

--3. 게임정보 저장테이블은 '이어하기'기능과 무관합니다. 클리어한 사용자 정보만 저장하는 용도로 짰습니다.

--4. 신고글 part 참고사항
-- >> 트리거를 이용하여 신고가 들어온 경우에 자동으로 신고글 관련 테이블에 행 추가를 할지
--    쿼리를 이용하여 직접 insert를 할지는 선택해서 하시면 되겠습니다.
--    (트리거를 이용하여 하실 경우 추가한 트리거 생성코드는 전파 부탁드리겠습니다.)

--5. 그 외 수정사항이나 제약조건, 트리거 등 추가사항이 있을 시 전파 부탁드립니다.
-- >> 컬럼명은 _와 대문자없이 해주시고, 테이블명과 제약조건명은 상관없대요 (190102추가)

--drop table member;
--drop table member_logger;
--drop table board_free;
--drop table board_solve;
--drop table game_rank;
--drop table board_comment_free;
--drop table board_comment_solve;
--drop table board_comment_rank;
--drop table admin_report_board;
--drop table admin_report_comment;

----------제약조건조회---------- (2019-01-02 추가)
--from user_constraints
SELECT table_name, constraint_name, constraint_type
FROM USER_CONSTRAINTS
WHERE TABLE_NAME ='테이블명';

--from dba_constraints
SELECT table_name, constraint_name, constraint_type
FROM DBA_CONSTRAINTS
WHERE TABLE_NAME ='테이블명';

--from all_constraints
SELECT table_name, constraint_name, constraint_type
FROM ALL_CONSTRAINTS
WHERE TABLE_NAME ='테이블명';
----------제약조건조회끝----------

-- ** sequence **
create sequence seq_member_logger; --로그인기록 (2019-01-02 추가)

create sequence seq_board_free_postno; --자유게시판 
create sequence seq_board_solve_postno; --공략게시판

create sequence seq_game_rank_playno; --게임정보 저장

create sequence seq_comment_free_commentno; --자유게시판 댓글
create sequence seq_comment_solve_commentno; --공략게시판 댓글
create sequence seq_comment_rank_commentno; --랭킹게시판 댓글

create sequence seq_admin_support_board; --관리자 : 신고 게시글 목록
create sequence seq_admin_support_comment; --관리자 : 신고 댓글 목록

-- ** table **
--회원정보
create table member(
    userid varchar2(15), --아이디
    userpassword varchar2(30) not null, --패스워드
    useremail varchar2(30) not null, --이메일
    userprofileoriginalfile varchar2(100), --사용자사진 original
    userprofilerenamedfile varchar2(100), --사용자사진 renamed
    enrolldate date default sysdate, --가입날짜
    constraint pk_userid primary key(userid) --제약조건 : pk
);

--임의 회원 추가 (2019-01-02 추가)
insert into member values('abc', '1234', 'abc@abc.com', null, null, default);
insert into member values('qwerty', '1234', 'qwerty@qwerty.com', null, null, default);
insert into member values('tomato', '1234', 'tomato@tomato.com', null, null, default);
insert into member values('admin', '1234', 'abc@abc.com', null, null, default);
alter table member modify(userpassword varchar2(200));
update member set userpassword = '55NNJATIxxog3T6qfYnlfC01/fkIyooIpPo5F9ejePBqItHjuTgVEosZEvaBHZuaLZl7gwYefwogFkGQmA0tkA==' where userid='tkdgnstkdgns';
--임의 회원 추가 확인
update member set coin = 1000 where userid='tkdgnstkdgns';
select * from member;
commit;

--특정 회원 삭제
--delete from member where userid = 'abc';

--로그인 확인
select count(*)
from member
where userid = 'abc' and userpassword = '1234';

-- userid, userpassword 모두 일치하면 1을 리턴
-- userpassword 불일치시 0을 리턴
-- userid가 존재하지 않으면 -1을 리턴

select case (select count(*)
             from member
             where userid = 'abc' and userpassword = '1234')
       when 1 then 1
       else (case(select count(*)
                  from member
                  where userid = 'abc')
             when 1 then 0
             else -1 end)
       end as logincheck
from dual;

-------------------properties 저장용------------------- (2019-01-02 추가)
--properties 파일에서는 ; 제거 확인

--loginCheck
select case (select count(*) from member where userid = ? and userpassword = ?) when 1 then 1 else (case(select count(*) from member where userid = ?) when 1 then 0 else -1 end) end as logincheck from dual;  
--selectOne
select * from member where memberid = ?;
--insertMemberLogger
insert into member_logger values (seq_member_logger.nextval, ?, ?, ?, default);
--insertMember
insert into member values(?, ?, ?, ?, ?, default);
--updateMember
update member set useremail = ?, userprofileoriginalfile = ?, userprofilerenamedfile = ? where userid = ?;
--deleteMember
delete from member where userid = ?;
--updatePassword
update member set userpassword = ? where userid = ?;

-------------------------------------------------------

--member_logger 테이블 생성 (2019-01-02 추가)
create table member_logger(
    logno number,
    userid varchar2(15) not null,
    status char(1) not null,
    ip varchar2(100),
    logdate date default sysdate not null,
    constraint pk_logger_no primary key(logno),
    constraint ck_logger_status check(status in ('1', '0'))
);

-- test 데이터
insert into member_logger(logno, userid, status, ip)
values(seq_member_logger.nextval, 'admin', '1', '127.0.0.1');

select * from member_logger;


--자유게시판
create table board_free(
    postno number, --게시글번호
    posttitle varchar2(50), --게시글제목
    postwriter varchar2(15), --작성자
    postcontent varchar2(2000), --내용
    postoriginalfile varchar2(100), --첨부파일 original
    postrenamedfile varchar2(100), --첨부파일 renamed
    postdate date default sysdate, --게시글 작성일자
    postreadcount number default 0, --조회수
    postlike number default 0, --좋아요 수
    postdislike number default 0, --싫어요 수
    postreport char(1) default 'N', --신고유무 : default 'N'
    constraint pk_board_free_postno primary key(postno), --제약조건 : pk
    constraint ck_board_free_postreport check(postreport in('Y', 'N')) -- 제약조건 : 신고유무 check (Y, N으로 구분하겠습니다.)
);

--공략게시판 (자유게시판과 구조가 같습니다.)
create table board_solve(
    postno number,
    posttitle varchar2(50),
    postwriter varchar2(15),
    postcontent varchar2(2000),
    postoriginalfile varchar2(100),
    postrenamedfile varchar2(100),
    postdate date default sysdate,
    postreadcount number default 0,
    postlike number default 0,
    postdislike number default 0,
    postreport char(1) default 'N',
    constraint pk_board_solve_postno primary key(postno),
    constraint ck_board_solve_postreport check(postreport in('Y', 'N'))
);

--게임정보 저장
--비회원은 게임을 플레이하여도 저장X 게임기록X
--랭킹게시판은 member테이블과 game_rank테이블을 join하여 사용
create table game_rank(
    playno number, --게임접속번호 (전체플레이)
    gameid varchar2(15), --아이디
    gameruntime number, --클리어시 클리어 소요시간
    gameescapedate date default sysdate --클리어시 클리어 날짜
);

--댓글 : 자유
create table board_comment_free(
    commentno number, --댓글번호
    commentlevel number default 1, --댓글1, 대댓글 2
    commentwriter varchar2(15), --댓글작성자
    commentcontent varchar2(1000), --댓글내용
    ref number, --게시글번호
    commentref number, --대댓글의 해당 댓글번호
    commentdate date default sysdate, --댓글작성 날짜
    commentlike number default 0,
    commentdislike number default 0,
    commentreport char(1) default 'N',
    constraint pk_comment_free_commentno primary key(commentno),
     --제약조건 : 게시글이 삭제될 경우 댓글도 삭제
    constraint fk_comment_free_ref foreign key(ref) references board_free(postno) on delete cascade,
     --제약조건 : 댓글이 삭제될 경우 대댓글도 삭제
    constraint fk_comment_free_commentref foreign key(commentref) references board_comment_free(commentno) on delete cascade,
    constraint ck_comment_free_commentreport check(commentreport in('Y', 'N')) --제약조건 : 댓글 신고여부
);

--댓글 : 공략 (자유게시판 댓글과 구조가 같습니다.)
create table board_comment_solve(
    commentno number,
    commentlevel number default 1,
    commentwriter varchar2(15),
    commentcontent varchar2(1000),
    ref number,
    commentref number,
    commentdate date default sysdate,
    commentlike number default 0,
    commentdislike number default 0,
    commentreport char(1) default 'N',
    constraint pk_comment_solve_commentno primary key(commentno),
    constraint fk_comment_solve_ref foreign key(ref) references board_solve(postno) on delete cascade,
    constraint fk_comment_solve_commentref foreign key(commentref) references board_comment_solve(commentno) on delete cascade,
    constraint ck_comment_solve_commentreport check(commentreport in('Y', 'N')) --제약조건 : 댓글 신고여부
);

--댓글 : 랭킹 (타 게시판 댓글과 구조가 같으나 ref 컬럼이 없습니다. : 게시글이 분류되어있지 않기 때문)
create table board_comment_rank(
    commentno number,
    commentlevel number default 1,
    commentwriter varchar2(15),
    commentcontent varchar2(1000),
    commentref number,
    commentdate date default sysdate,
    commentlike number default 0,
    commentdislike number default 0,
    commentreport char(1) default 'N',
    constraint pk_comment_rank_commentno primary key(commentno),
    constraint fk_comment_rank_commentref foreign key(commentref) references board_comment_rank(commentno) on delete cascade,
    constraint ck_comment_rank_commentreport check(commentreport in('Y', 'N')) --제약조건 : 댓글 신고여부
);

--관리자용 : 신고글 관리
create table admin_report_board(
    category char(1), -- [자유], [공략] 구분
    postno number, --신고한 게시판에서의 게시글번호 (참고 : 따라서 1부터 시작하지 않음)
    posttitle varchar2(50), --신고된 게시글 제목
    postwriter varchar2(15), --신고된 게시글 작성자
    reason varchar2(50), --신고사유 분류
    usercomment varchar2(1000), --신고 내용
    constraint ck_report_board_category check(category in ('F', 'S')) --제약조건 : 게시판분류 (자유 : F, 공략 : S)
);

--관리자용 : 신고댓글 관리
create table admin_report_comment(
    category char(1), -- [자유], [랭킹], [공략] 구분
    -- 신고한 게시판에서의 게시글번호 (참고 : 따라서 1부터 시작하지 않음)
    -- 단, 랭킹게시판은 게시글이 존재하지 않으므로 랭킹게시판 댓글은 게시글번호를 0으로 통일 (default 0)
    postno number default 0,
    commentno number, -- 댓글번호 (댓글테이블들의 commentno)
    commentcontent varchar2(1000), --댓글내용
    commentwriter  varchar2(15), --댓글작성자
    reason varchar2(50), --신고사유 분류
    usercomment varchar2(1000), --신고 내용
    constraint ck_report_comment_category check(category in ('F', 'S', 'R')) --제약조건 : 게시판분류 (자유 : F, 공략 : S, 랭킹 : R)
);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '안녕하세요', 'abcd' , '안녕하세요 놀러왔어요!' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '좋은아침입니다', 'efg' , '안녕하세요 좋은아침입니다!' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '오늘 좋은 하루보내세요', 'hij' , '안녕하세요 놀러왔어요!' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '날씨 너무 추워요', 'klm' , '안녕하세요 놀러왔어요!' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '다들 감기 조심!', 'nop' , '안녕하세요 놀러왔어요!' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '독감이 유행이라고 하더라구요', 'qrst' , '안녕하세요 놀러왔어요!' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '얼죽아 협회회원들 계신가요?', 'uvw' , '안녕하세요 놀러왔어요!' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '노래추천해주세요!', 'xyz' , '안녕하세요 놀러왔어요!' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '랭킹세웠슴당', 'qwe' , '안녕하세요 놀러왔어요!' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '저는 샐리가 좋더라구여 ㅋㅋ', 'fghfj' , '안녕하세요 놀러왔어요!' ,null, null, default, 10, 11 , 0 , default);

INSERT INTO board_free values (seq_board_free_postno.nextVal , '비염있으신 분 계신가요ㅜㅜ', 'sdggg' , '안녕하세요 놀러왔어요!' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '섬유향수 추천!', 'ert' , '안녕하세요 놀러왔어요!' ,null, null, default, 765, 256 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '탑텐 패딩 후기', 'ert' , '안녕하세요 놀러왔어요!' ,null, null, default, 453, 193 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '역삼동 맛집가봤어요', 'ert' , '안녕하세요 놀러왔어요!' ,null, null, default, 299, 168 , 0 , default);

INSERT INTO board_free values (seq_board_free_postno.nextVal , '베스트3안에 드신 분들 진짜 대단', 'fghfj' , '안녕하세요 놀러왔어요!' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '방탈출 너무 어려워요ㅜㅜ', 'qwee' , '안녕하세요 놀러왔어요!' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '밀크티는 역시 투썸인거같네요', 'ljk' , '안녕하세요 놀러왔어요!' ,null, null, default, 10, 11 , 0 , default);
 update member set userpassword='1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==' where userid='admin';
 update member set coin=1000 where userid='tkdgnstkdgns';
 commit;
--drop table game_scenario;
create table game_prologue(
    no number,
    content varchar2(1000) not null,
    filename varchar2(50)
);


insert into game_prologue(no, content) values(1,'..');
insert into game_prologue(no, content) values(2,'....');
insert into game_prologue(no, content) values(3,'.......?!');
insert into game_prologue(no, content) values(4,'너....?');
insert into game_prologue(no, content) values(5,'그래. 이렇게 다시봐도 꼴 보기 싫은 얼굴이구나.');
insert into game_prologue(no, content) values(6,'생각은 나나보네.');
insert into game_prologue(no, content) values(7,'얼굴이 말이 아니네, 그런표정 짓고 있는 거 보니까');
insert into game_prologue(no, content) values(8,'그래도 너 때문에 망가져사는 나에 비할건 못돼.');
insert into game_prologue(no, content) values(9,'물론 널 갈기갈기 찢어놓고 싶은 마음이 굴뚝같지만');
insert into game_prologue(no, content) values(10,'그리고 난 너를 죽일만큼 그렇게 간도 크지못해.');
insert into game_prologue(no, content) values(11,'네가 이 버튼을 누르고 이 방을 나가면');
insert into game_prologue(no, content) values(12,'조금 뒤엔 경찰차와 구급차가 올거야');
insert into game_prologue(no, content) values(13,'그리고 그 사람들이 도착할 즈음엔 난 이 세상 사람이 아니겠지.');
insert into game_prologue(no, content) values(14,'방에 갇혀있는 동안 뭐라도 느꼈길 바래.');
insert into game_prologue(no, content) values(15,'내가 너한테');
insert into game_prologue(no, content) values(16,'마지막으로');
insert into game_prologue(no, content) values(17,'남길...말은');

update game_prologue set filename = 'prologue.png' where no = 5;
select * from game_prologue order by no;
commit;

--19.01.09 member테이블에 보유 코인, 쪽지개수 컬럼 추가
alter table member add(coin number default 300);
alter table member add(hintpaper number default 0);
alter table member add(enrolldate date default sysdate);
--19.01.09 notice 테이블 추가
create table notice(
    noticeno number,
    noticetitle varchar2(50),
    noticecontent varchar2(2000),
    noticeoriginalfile varchar2(100),
    noticerenamedfile varchar2(100),
    noticedate date default sysdate,
    noticeurgent char(1),
    constraint pk_board_solve_noticeno primary key(noticeno),
    constraint ck_board_notice_noticeurgent check (noticeurgent in ('Y','N'))
);
create sequence seq_notice_noticeno;
insert into game_rank values(seq_game_rank_playno.nextval, 'qwerty', 4785, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'abcde', 5587425, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'wewe', 4646546, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'hoho', 654654654654, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'sun123', 545454545, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'heyhey', 8789515, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'babo', 3132135, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'baboba', 9896232323, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'chunjae', 56565655, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'mungmung', 545646, to_date('20190101', 'yyyymmdd'));


insert into member values('abc', '1234', 'abc@abc.com', null, null, default, default, default);
insert into member values('qwerty', '1234', 'qwerty@qwerty.com', null, null, default, default);
insert into member values('tomato', '1234', 'tomato@tomato.com', null, null, default, default, default);
insert into member values('admin', '1234', 'abc@abc.com', null, null, default, default, default);
insert into member values('abcde', '1234', 'abcde@abc.com', null, null, default,default,  default);
insert into member values('wewe', '1234', 'wewe@abc.com', null, null, default, default, default);
insert into member values('hoho', '1234', 'hoho@abc.com', null, null, default, default, default);
insert into member values('sun123', '1234', 'sun123@abc.com', null, null, default, default, default);
insert into member values('heyhey', '1234', 'heyhey@abc.com', null, null, default, default, default);
insert into member values('babo', '1234', 'babo@abc.com', null, null, default, default, default);
insert into member values('baboba', '1234', 'baboba@qwerty.com', null, null, default,default,  default);
insert into member values('chunjae', '1234', 'chunjae@tomato.com', null, null, default, default, default);
insert into member values('mungmung', '1234', 'mungmung@abc.com', null, null, default, default, default);

create sequence seq_notice_noticeno;
create table game_hint(
    no number,
    content varchar2(200)
);

insert into game_hint values(1, '일부 아이템은 여러번 사용할 수 있습니다.');
insert into game_hint values(2, '넌 탈출할 수 없어..');
insert into game_hint values(3, '화분은 망치로 깰 수 있습니다.');
insert into game_hint values(4, '문은 두 개의 잠금장치를 모두 해제해야 합니다.');
insert into game_hint values(5, '금고는 부술 수 없습니다.');
insert into game_hint values(6, '창문밖에는 아무것도 없습니다.');
insert into game_hint values(7, '형광등은 드라이버로 열 수 있습니다.');
insert into game_hint values(8, '침대 뒤에 공간있어요.');
insert into game_hint values(9, '행렬');
insert into game_hint values(10, '위를 올려다 보세요.');


commit;