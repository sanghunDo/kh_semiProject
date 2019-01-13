show user;

--drop table member;
--drop table board_free;
--drop table board_solve;
--drop table game_rank;
--drop table notice;
--drop table game_prologue;
--drop table board_comment_free;
--drop table board_comment_solve;
--drop table board_comment_rank;
--drop table admin_report_board;
--drop table admin_report_comment;
--drop table game_hint;

-- ** sequence **
create sequence seq_board_free_postno; --자유게시판 
create sequence seq_board_solve_postno; --공략게시판
create sequence seq_game_rank_playno; --게임정보 저장
create sequence seq_comment_free_commentno; --자유게시판 댓글
create sequence seq_comment_solve_commentno; --공략게시판 댓글
create sequence seq_comment_rank_commentno; --랭킹게시판 댓글
create sequence seq_admin_support_board; --관리자 : 신고 게시글 목록
create sequence seq_admin_support_comment; --관리자 : 신고 댓글 목록
create sequence seq_notice_noticeno; --공지사항
create sequence seq_member_logger;

--drop sequence seq_board_free_postno;
--drop sequence seq_board_solve_postno;
--drop sequence seq_game_rank_playno;
--drop sequence seq_comment_free_commentno;
--drop sequence seq_comment_solve_commentno;
--drop sequence seq_comment_rank_commentno;
--drop sequence seq_admin_support_board;
--drop sequence seq_admin_support_comment;
--drop sequence seq_notice_noticeno;

-- ** table **
--회원정보
create table member(
    userid varchar2(15), --아이디
    userpassword varchar2(200) not null, --패스워드
    useremail varchar2(30) not null, --이메일
    userprofileoriginalfile varchar2(100), --사용자사진 original
    userprofilerenamedfile varchar2(100), --사용자사진 renamed
    enrolldate date default sysdate, --가입날짜
    coin number default 300, --보유코인
    hintpaper number default 0, --보유힌트쪽지
    constraint pk_userid primary key(userid) --제약조건 : pk
);

--맨밑 3명 회원 제외 나머지 비밀번호 : 1234
insert into member values('abc', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', 'abc@abc.com', null, null, default, default, default);
insert into member values('qwerty', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', 'qwerty@qwerty.com', null, null, default, default, default);
insert into member values('tomato', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', 'tomato@tomato.com', null, null, default, default, default);
insert into member values('admin', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', 'abc@abc.com', null, null, default, default, default);
insert into member values('abcde', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', 'abcde@abc.com', null, null, default, default, default);
insert into member values('wewe', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', 'wewe@abc.com', null, null, default, default, default);
insert into member values('hoho', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', 'hoho@abc.com', null, null, default, default, default);
insert into member values('sun123', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', 'sun123@abc.com', null, null, default, default, default);
insert into member values('heyhey', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', 'heyhey@abc.com', null, null, default, default, default);
insert into member values('babo', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', 'babo@abc.com', null, null, default, default, default);
insert into member values('baboba', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', 'baboba@qwerty.com', null, null, default, default, default);
insert into member values('chunjae', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', 'chunjae@tomato.com', null, null, default, default, default);
insert into member values('mungmung', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', 'mungmung@abc.com', null, null, default, default, default);

--나머지 3명 비밀번호 : pw123!
insert into member values('abc123', 'J7l+642+NvW8aJrJwQZrM0XbfudAaNrE1kIbKPFEib0uwzHfutpbD9pkDmHFrG0t3JYutt4eDfwVS/ZCXscboA==', 'abc123@abc.com', null, null, default, default, default);
insert into member values('qwerty123', 'J7l+642+NvW8aJrJwQZrM0XbfudAaNrE1kIbKPFEib0uwzHfutpbD9pkDmHFrG0t3JYutt4eDfwVS/ZCXscboA==', 'qwerty123@qwerty.com', null, null, default, default, default);
insert into member values('tomato123', 'J7l+642+NvW8aJrJwQZrM0XbfudAaNrE1kIbKPFEib0uwzHfutpbD9pkDmHFrG0t3JYutt4eDfwVS/ZCXscboA==', 'tomato123@tomato.com', null, null, default, default, default);
update member set useremail = 'admin@admin.com' where userid = 'admin';
update member set useremail = 'abcde@abcde.com' where userid = 'abcde';
alter table member add constraint uq_useremail unique(useremail);
commit;
--로그인 유무 판단
create table member_logger(
    logno number,
    userid varchar2(15) not null,
    status char(1) not null,
    ip varchar2(100),
    logdate date default sysdate not null,
    constraint pk_logger_no primary key(logno),
    constraint ck_logger_status check(status in ('1', '0'))
);

insert into member_logger(logno, userid, status, ip)
values(seq_member_logger.nextval, 'admin', '1', '127.0.0.1');

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

insert into board_solve values (seq_board_solve_postno.nextVal, '왜천장은 침대를 밟아야 올라가짐', 'tomato', '난키커서 안밟아도댐 낄낄', null, null, default, 15, 50, 33, default);
insert into board_solve values (seq_board_solve_postno.nextVal, '와 엔딩크레딧 이스터에그 개소름임', 'chunjae', '와 나혼자알아야지 아무도 안알랴줌', null, null, default, 210, 198, 15, default);
insert into board_solve values (seq_board_solve_postno.nextVal, '주인공근데 맞아야함', 'wewe', '근데 망치 화분깨는데밖에못씀', null, null, default, 11, 3, 1, default);
insert into board_solve values (seq_board_solve_postno.nextVal, '※다↑■출◎♧최♣대3♥천♡', 'heyhey', '☎전화 바로상담 01＠012◁345678', null, null, default, 3, 0, 1, default);
insert into board_solve values (seq_board_solve_postno.nextVal, '※다↑■출◎♧최♣대3♥천♡', 'heyhey', '☎전화 바로상담 01＠012◁345678', null, null, default, 2, 0, 2, default);
insert into board_solve values (seq_board_solve_postno.nextVal, '※다↑■출◎♧최♣대3♥천♡', 'heyhey', '☎전화 바로상담 01＠012◁345678', null, null, default, 1, 0, 1, default);
insert into board_solve values (seq_board_solve_postno.nextVal, '※다↑■출◎♧최♣대3♥천♡', 'heyhey', '☎전화 바로상담 01＠012◁345678', null, null, default, 4, 0, 1, default);
insert into board_solve values (seq_board_solve_postno.nextVal, '※다↑■출◎♧최♣대3♥천♡', 'heyhey', '☎전화 바로상담 01＠012◁345678', null, null, default, 11, 0, 10, default);
insert into board_solve values (seq_board_solve_postno.nextVal, '힌트쪽지짱비쌈', 'mungmung', '뭔 50코인씩이나해', null, null, default, 72, 50, 1, default);
insert into board_solve values (seq_board_solve_postno.nextVal, '침대뒤에공간있어요', 'sun123', '침대뒤에 공간있어서 일기장 있다구요!!!!', null, null, default, 4, 3, 0, default);
insert into board_solve values (seq_board_solve_postno.nextVal, '이리와봐 유후후', 'babo', '나랑뽀뽀할사람 유후후', null, null, default, 10, 0, 4, default);
insert into board_solve values (seq_board_solve_postno.nextVal, '문푸는 방법 참고하세여', 'abcde', '여러븐 형광등까면 열쇠나와여', null, null, default, 652, 210, 30, default);
insert into board_solve values (seq_board_solve_postno.nextVal, '아 솔직히 1등할만했다', 'qwerty', '진짜 빡집중해서깼다', null, null, default, 780, 300, 10, default);
commit;

--게임정보 저장
--비회원은 게임을 플레이하여도 저장X 게임기록X
--랭킹게시판은 member테이블과 game_rank테이블을 join하여 사용

create table game_rank(
    playno number, --게임접속번호 (전체플레이)
    gameid varchar2(15), --아이디
    gameruntime number, --클리어시 클리어 소요시간
    gameescapedate date default sysdate --클리어시 클리어 날짜
);

insert into game_rank values(seq_game_rank_playno.nextval, 'qwerty', 4787895, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'abcde', 5587425, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'wewe', 4646546, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'hoho', 654654654, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'sun123', 545454545, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'heyhey', 8789515, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'babo', 31352135, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'baboba', 96232323, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'chunjae', 56565655, to_date('20190101', 'yyyymmdd'));
insert into game_rank values(seq_game_rank_playno.nextval, 'mungmung', 54564463, to_date('20190101', 'yyyymmdd'));

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

--게임 프롤로그 대사
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

--공지사항
create table notice(
    noticeno number,
    noticetitle varchar2(50),
    noticecontent varchar2(2000),
    noticeoriginalfile varchar2(100),
    noticerenamedfile varchar2(100),
    noticedate date default sysdate,
    noticeurgent char(1),
    noticelinked char(1),
    constraint pk_board_solve_noticeno primary key(noticeno),
    constraint ck_board_notice_noticeurgent check (noticeurgent in ('Y','N')),
    constraint ck_board_notice_noticelinked check (noticelinked in ('Y', 'N'))
);

insert into notice values(seq_notice_noticeno.nextVal, '긴급공지테스트1입니다!!!', '긴급공지 테스트1 입니다.
긴급공지 테스트1 입니다.
긴급공지 테스트1 입니다.', 'urgent1.png', '20190109_195841561_348.png', to_date('20190101', 'yyyymmdd'), 'Y', 'N');
insert into notice values(seq_notice_noticeno.nextVal, '버그 수정중입니다 !', '버그가 수정중입니다.
게임이용에 불편을 드려 대단히 죄송합니다.
빠른 시일 내에 복구하도록 하겠습니다.', 'event3.png', '20190109_201006238_424.png', to_date('20190102', 'yyyymmdd'), 'N', 'N');
insert into notice values(seq_notice_noticeno.nextVal, '긴급공지 테스트2입니다 !!!', '긴급공지 테스트2 입니다.
긴급공지 테스트2 입니다.
긴급공지 테스트2 입니다.', 'urgent2.png', '20190109_201120911_160.png', to_date('20190103', 'yyyymmdd'), 'Y', 'N');
insert into notice values(seq_notice_noticeno.nextVal, '채용공고 - 새 가족을 찾습니다 !!!', '근무형태 : 재택근무
연봉 : ?
우리의 가족이 되어주새오', 'event4.png', '20190109_201222201_991.png', to_date('20190104', 'yyyymmdd'), 'N', 'N');
insert into notice values(seq_notice_noticeno.nextVal, '힌트 쪽지 가격이 50코인 !!', '런칭 기념 힌트쪽지 가격을 한 달간 100코인에서
50퍼센트 할인된 50코인으로 할인 중입니다!!
많이 플레이해주세요 !', 'event2.png', '20190109_201429373_28.png', to_date('20190105', 'yyyymmdd'), 'N', 'N');
insert into notice values(seq_notice_noticeno.nextVal, '런칭 기념 가입 시 300코인 증정 !!', '런칭 기념 가입시 힌트쪽지를 살 수 있는 코인을 
300개나?!? 빨리오세요!', 'event1.png', '20190109_201519476_756.png', to_date('20190106', 'yyyymmdd'), 'N', 'Y');
insert into notice values(seq_notice_noticeno.nextVal, '대답요구!!!!!!!!!!!!', '대답요구!!!!!!!!!!!!!!!!!!!!!', '대답요구.png', '20190110_053019290_882.png', to_date('20190110', 'yyyymmdd'), 'N', 'N');

--상점 힌트 테이블
create table game_hint(
    no number,
    content varchar2(200)
);

--상점 힌트 테이블 데이터 추가
insert into game_hint values(1, '일부 아이템은 여러번 사용할 수 있습니다.');
insert into game_hint values(2, '넌 탈출할 수 없어.');
insert into game_hint values(3, '화분은 망치로 깰 수 있습니다.');
insert into game_hint values(4, '문은 두 개의 잠금장치를 모두 해제해야 합니다.');
insert into game_hint values(5, '금고는 부술 수 없습니다.');
insert into game_hint values(6, '창문밖에는 아무것도 없습니다.');
insert into game_hint values(7, '형광등은 드라이버로 열 수 있습니다.');
insert into game_hint values(8, '침대 뒤에 공간있어요.');
insert into game_hint values(9, '행렬');
insert into game_hint values(10, '위를 올려다 보세요.');

create table game_object(
    objno number, --오브젝트의 고유 넘버
    objname varchar2(50) unique not null, --오브젝트의 고유 이름
    secondname varchar2(50) default null, --다음상태 이미지 이름 ex) 뒷면 옆면 ...)
    thirdname varchar2(50) default null, --그 다음상태 이미지 이름
    position varchar2(15), --오브젝트 위치
    objlevel number, --오브젝트의 단계를 나타냄.
    refno number default 0, --아이템일 경우, 상호작용할 수 있는 해당 오브젝트
    isitem char(2) default 'N' check(isitem in('Y','N')), --아이템이냐 아니냐
    constraint pk_objno primary key(objno)
);
create table game_object_coment(
    comentno number,
    coment varchar2(100) default '"...."',
    refobj number,
    constraint pk_object_comentno primary key(comentno),
    constraint fk_object_refobj foreign key(refobj) references game_object(objno)
);
select v.* from(select coment, rownum as rnum from game_object_coment c join game_object o on c.refobj = o.objno where objName = 'door_lock2') v where rnum = 1;

insert into game_object_coment values(1, '"여기에 맞는 열쇠를 찾아야겠군."', 1);
insert into game_object_coment values(2, '"흔히 볼 수 있는 도어락이다."', 2);
insert into game_object_coment values(3, '"역시 비밀번호를 알아내야돼."', 2);
insert into game_object_coment values(4, '"날짜가 이상해,, 달력이 아닌거 같아"', 3);
insert into game_object_coment values(5, '"화분이라니.. 이곳엔 어울리지 않는걸?"', 4);
insert into game_object_coment values(6, '"안에서 무언가가 반짝거린다."', 5);
insert into game_object_coment values(7, '"열쇠 개꿀딱!"', 6);
insert into game_object_coment values(8, '"이 안엔 뭐가 들어있는거징?"', 7);
insert into game_object_coment values(9, '"... 금고안에 있었으니 쓸모가 있겠지.."', 8);
insert into game_object_coment values(10, '"탈출하면 이 드라이버로 찔러죽이고 싶다!!!"', 9);
insert into game_object_coment values(11, '"침대 밑에 뭐가 떨어져 있어"', 10);
insert into game_object_coment values(12, '"다이어리인가?? 누구꺼지"', 10);
insert into game_object_coment values(13, '"...."', 10);
insert into game_object_coment values(14, '"3-7,,, ㅋㅋ3에서 7을 어떻게 빼(문과)"', 11);
update game_object_coment set coment='"뭔가 씌여져있다"' where comentno = 13;

--drop table game_object;
commit;
insert into game_object values(1, 'door_lock1', default, default, 'front', 1, default, default);
insert into game_object values(2, 'door_lock2', 'door_lock2_opened', default, 'front', 1, default, default);
insert into game_object values(3, 'calendar', default, default, 'left', 1, default, default);
insert into game_object values(4, 'flowerpot', default, default, 'front', 1, default, default);
insert into game_object values(5, 'broken_flowerpot', default, default, 'front', 2, default, default);
insert into game_object values(6, 'key_1', default, default, 'front', 3, 15, 'Y');
insert into game_object values(7, 'safe', default, default, 'front', 1, default, default);
insert into game_object values(8, 'wire', default, default, 'front', 3, 2, 'Y');
insert into game_object values(9, 'driver', default, default, 'front', 3, 27, 'Y');


insert into game_object values(10, 'under_bed_diary','diary', 'diary_opened', 'left', 1, default, default);
insert into game_object values(11, 'hintnote1', default, default, 'left', 3, default, 'Y');
commit;

insert into game_object values(13, 'bs_top_doll', '"불쌍한 녀석.."', 'back', default, default);
insert into game_object values(14, 'bs_hintnote3', '"점이 3개가 있어 무슨 의미일까"', 'back', 23, 'Y');
insert into game_object values(15, 'bs_4f_books', '"정리가 하나도 안돼있다.."', 'back', default, default);
insert into game_object values(16, 'bs_smallbox', '"이것도 잠겨있잖아?!"', 'back', default, default);
insert into game_object values(17, 'bs_hintnote2', '"감히 안잡힌다.."', 'back', default, 'Y');
insert into game_object values(18, 'bs_clock', default, 'back', default, default);
insert into game_object values(19, 'bs_battery', '"유용할까?"', 'back', 2, 'Y');
insert into game_object values(20, 'bs_2f_books', '"숫자는 지긋지긋해 나는 문과출신인데.."', 'back', default, default);
insert into game_object values(21, 'bs_toolbox', '"안에 뭐가 들었는지 열어보자"', 'back', default, default);
insert into game_object values(22, 'bs_hammer', '"여기서 탈출하면 망치로 찍어버릴거야"', 'back', 4, 'Y');
insert into game_object values(23, 'bs_cutterknife', '"이걸론 죽이지 못할거야"', 'back', 12, 'Y');
insert into game_object values(24, 'water', '"이런데에 물이?!(핥짝핥짝)"', 'right', default, default);
insert into game_object values(25, 'window', '"아무것도 없어, 어떻게든 빠져나가야돼"', 'right', default, default);
insert into game_object values(26, 'letter', '"친절하게 편지도 남겨주셨군"', 'right', default, default);
insert into game_object values(27, 'ceilinglight', '"열수 있을것 같아 보인다."', 'ceil', default, default);
insert into game_object values(28, 'key_2', '"탈출에 성공할 수 있을거야!!!"', 'ceil', 1, 'Y');
select * from game_object;
commit;

create table game_state(
    userid varchar2(50) unique,
    
    --front면
    door_lock1 number default 1,--2면 열림상태
    door_lock2 number default 1,--2면 열림상태
    flowerpot number default 1,--2면 깨진상태
    key1Get number default 1, --화분속 열쇠1 2면 획득한상태 (깨진화분만 있는 상태)
    key1Use number default 1, --2면 사용하여 인벤토리에서 없어진 상태
    
    
    safe number default 1,--금고 2면 열려있고 비어있는 상태
    
    ----금고 내의 아이템 전선, 드라이버
    wireGet number default 1, --전선 2면 없어진상태
    wireUse number default 1, --전선 2면 사용한 상태
    
    driverGet number default 1,--드라이버 2면 없어진상태
    driverUse number default 1,--드라이버 2면 사용한 상태
    
    
    --left면
    hintNote1 number default 1, -- 침대 뒤 일기장 달력힌트쪽지 2면 획득한 상태
    
    --back면 
    bs_doll number default 1, --2면 찢어진상태
    bs_hintNote3Get number default 1, --2면 인형이 비어있는 상태 (없어진상태)
    bs_hintNote3Use number default 1, --2면 right에 고여있는 물에 적셔져서 온전한내용이 나온 상태(인벤토리안에 있음, 없어지지않음)
    
    bs_smallBox number default 1, --2면 열려있고 비어있는 상태
    bs_hintNote2 number default 1, -- 달력힌트쪽지2 2면 획득한 상태, 없어진 상태(인벤토리 안에 있음)
    bs_clock number default 1, --2면 건전지가 빠져있는 상태
    bs_batteryGet number default 1, --베터리 2면 시계에서 건전지가 빠진상태
    bs_batteryUse number default 1, --2면 사용한 상태 
    
    bs_toolbox number default 1, --2면 열려있고 비어있는 상태
    bs_hammerGet number default 1, --2면 획득한 상태
    bs_hammerUse number default 1, --2면 사용한 상태
    bs_cutterknifeGet number default 1, --2면 획득한 상태
    bs_cutterknifeUse number default 1, --2면 사용한 상태
    
    --right
    --ceiling
    light number default 1, -- 2면 드라이버를 사용해서 덮개가 열려있는 상태 
    key2Get number default 1, --2면 얻은 상태 전등에 키가 없어져있는 상태 
    key2Use number default 1
    --2면 사용하여 인벤토리에서 없어진상태 
);
--update game_state set door_lock1=1, door_lock2=1, flowerpot=1, key1Get=1, key1Use=1, safe=1, wireGet=1, wireUse=1, driverGet=1, driverUse=1, hintNote1=1, bs_doll=1, bs_hintNote3Get=1, bs_hintNote3Use=1, bs_smallbox=1, bs_hintNote2=1, bs_clock=1, bs_batteryGet=1, bs_batteryUse=1, bs_toolbox=1, bs_hammerGet=1, bs_hammerUse=1, bs_cutterknifeGet=1, bs_cutterknifeUse=1, light=1, key2Get=1, key2use=1 where userid=?;

select * from game_state;
--delete from game_state where userid='guest_71.008169510174181';
--drop table game_state;
commit;