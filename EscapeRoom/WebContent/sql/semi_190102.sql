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

--임의 회원 추가 확인
select * from member;

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

commit;