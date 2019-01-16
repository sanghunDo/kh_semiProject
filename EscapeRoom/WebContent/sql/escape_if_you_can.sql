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
insert into member values('admin', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', 'admin@admin.com', null, null, default, default, default);
insert into member values('abcde', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', 'abcde@abcde.com', null, null, default, default, default);
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
--자유게시판 데이터 삽입
delete from board_free; --기존에 있던 데이터 삭제
INSERT INTO board_free values (seq_board_free_postno.nextVal , '안녕하세요', 'abcd' , '안녕하세요 방탈출게임커뮤니티는 처음이에요!' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '좋은아침입니다', 'efg' , '안녕하세요 좋은아침입니다! 여기 게시글에 오신 분들 모두 화이팅입니다!' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '날씨 너무 추워요', 'klm' , '손난로는 필수템..다들아시죠?' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '다들 감기 조심!', 'nop' , '감기조심하세요!' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '독감이 유행이라고 하더라구요', 'qrst' , '그래서 주사맞고왔어요! 다들 조심하세요' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '얼죽아 협회회원들 계신가요?', 'uvw' , '저는 얼죽아에요 ㅋㅋ 얼어죽어도 아이스!!' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '노래추천해주세요!', 'xyz' , '저는 신나는 노래좋아하는데 추천부탁드려요:)' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '랭킹세웠슴당', 'qwerty' , '아싸뵤 ㅋㅋㅋㅋ한지 하루만에 랭킹세웠어요!' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '저는 샐리가 좋더라구여 ㅋㅋ', 'fghfj' , '브라운보다는 샐리! 저같은 분계신가요?' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '비염있으신 분 계신가요ㅜㅜ', 'sdggg' , '환절기라 죽겠어요ㅜㅜ 약없이는 일상생활불가에여ㅜㅜ' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '섬유향수 추천!', 'nanda5050' , '랄라블라에서 산 비누향인데 정말좋아요! 강추입니다!!' ,null, null, default, 765, 256 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '탑텐 패딩 후기', 'ert' , '싼맛에 샀는데 아직까지 버티고 있는걸로보아 가성비 짱입니다!' ,null, null, default, 453, 193 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '역삼동 맛집가봤어요', 'ert' , '역삼역주변에 있는 쌀국수 집 가봤어요! 저는 그닥 별로 더라구요..ㅋㅋ 넘 비싸기만해서 실망했어요' ,null, null, default, 299, 168 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '베스트3안에 드신 분들 진짜 대단', 'fghfj' , '진짜 모르겠던대ㅜㅜㅜㅜㅜ공략게시판에서 살아야겠어요' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '방탈출 너무 어려워요ㅜㅜ', 'qwee' , '공략게시판에 수시로 들어가서 확인하는데도 잘모르겠다는..ㅋㅋ' ,null, null, default, 10, 11 , 0 , default);
INSERT INTO board_free values (seq_board_free_postno.nextVal , '밀크티는 역시 투썸인거같네요', 'ljk' , '밀크티쉐이크가 짱입니다!' ,null, null, default, 10, 11 , 0 , default);

commit;


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
insert into game_rank values(seq_game_rank_playno.nextval, 'tkdgnstkdgns', 1000, default);
commit;

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
INSERT INTO board_comment_free values (seq_comment_free_commentno.nextVal ,1,'sldsfe2','저는 이거 말고 청포도향도 있는데 좋더라구요!다음에 써봐야겠어요! ', 32 , null ,default,22,1,default);
INSERT INTO board_comment_free values (seq_comment_free_commentno.nextVal ,1,'erg','저는 진짜 향수는 너무 독하고 섬유향수가 딱 좋더라구요! 좋은 정보 감사합니다:) ', 32 , null ,default,18,2,default);
INSERT INTO board_comment_free values (seq_comment_free_commentno.nextVal ,1,'erihi','올리브영 섬유향수도 좋아요~ ', 32 , null ,default,13,0,default);

INSERT INTO board_comment_solve values (seq_comment_solve_commentno.nextVal ,1,'gewt2','정보 공유부탁드려요! ', 19 , null ,default,25,1,default);
INSERT INTO board_comment_solve values (seq_comment_solve_commentno.nextVal ,1,'tetgg','1등 축하드려요~', 19 , null ,default,18,2,default);
INSERT INTO board_comment_solve values (seq_comment_solve_commentno.nextVal ,1,'wqed','저기요 공략게시판은 자랑하라고 있는 곳아니거든요? ㅋㅋ 재수없네요 ㅋㅋ', 19 , null ,default,13,4,default);
commit; 


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
    constraint ck_board_notice_noticeurgent check (noticeurgent in ('Y', 'N')),
    constraint ck_board_notice_noticelinked check (noticelinked in ('Y', 'N'))
);

select * from notice;

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
300개나?!? 빨리오세요!', 'event1.png', '20190109_201519476_756.png', to_date('20190106', 'yyyymmdd'), 'N', 'N');
insert into notice values(seq_notice_noticeno.nextVal, '대답요구!!!!!!!!!!!!', '대답요구!!!!!!!!!!!!!!!!!!!!!', '대답요구.png', '20190110_053019290_882.png', to_date('20190110', 'yyyymmdd'), 'N', 'N');
insert into notice values(seq_notice_noticeno.nextVal, '대규모 업데이트 예정!!', '더많은 엔딩루트!! 더많은 단서와 아이템!! 재미는 두배!!', 'update.png', '20190114_012957860_979.png', to_date('20190114', 'yyyymmdd'), 'N', 'Y');

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

commit;

--update notice set noticeLinked = 'N';
--update notice set noticeLinked = 'Y' where noticeNo = ?

--drop table game_object_coment;
--drop table game_object;
select * from game_object;
create table game_object(
    objno number, --오브젝트의 고유 넘버
    objname varchar2(50) unique not null, --오브젝트의 고유 이름
    secondname varchar2(50) default null, --다음상태 이미지 이름 ex) 뒷면 옆면 ...)
    thirdname varchar2(50) default null, --그 다음상태 이미지 이름
    parentname varchar2(50) default null, --아이템일 경우 아이템을 꺼내는 오브젝트.
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
--select v.* from(select coment, rownum as rnum from game_object_coment c join game_object o on c.refobj = o.objno where objName = 'door_lock2') v where rnum = 1;
insert into game_object values(0, 'door', default, default, default, 'front', 1, default, default);
insert into game_object_coment values(0, '굳게 닫힌 문이다. 부술 수 없을 것 같다.', 0);

insert into game_object values(1, 'door_lock1', default, default, default, 'front', 1, default, default);
insert into game_object_coment values(1, '"여기에 맞는 열쇠를 찾아야겠어.."', 1);

insert into game_object values(2, 'door_lock2', default, default, default, 'front', 1, default, default);
insert into game_object_coment values(2, '흔히 볼 수 있는 도어락이다. 작동 되지 않는다.', 2);

insert into game_object values(3, 'used_door_lock2', default, default, default, 'front', 2, default, default);
insert into game_object_coment values(3, '건전지를 연결할 방법이 없을까?', 3);

insert into game_object values(4, 'calendar', default, default, default, 'left', 1, default, default);
insert into game_object_coment values(4, '"날짜가 이상해.. 달력이 아닌거 같아."', 4);

insert into game_object values(5, 'flowerpot', default, default, default, 'front', 1, default, default);
insert into game_object_coment values(5, '화분이라니.. 이곳엔 어울리지 않는 것 같다.', 5);

insert into game_object values(6, 'used_flowerpot', default, default, default, 'front', 2, default, default);
insert into game_object_coment values(6, '안에서 무언가 반짝거린다.', 6);

insert into game_object values(7, 'used_flowerpot_key_1', default, default, 'used_flowerpot', 'front', 3, 21, 'Y');
insert into game_object_coment values(7, '열쇠를 획득했다.', 7);
insert into game_object values(8, 'safe', default, default, default, 'front', 1, default, default);
insert into game_object_coment values(8, '"이 안엔 뭐가 들어있을까."', 8);

insert into game_object values(9, 'used_safe', default, default, default, 'front', 2, default, default);
insert into game_object_coment values(9, '...', 9);

insert into game_object values(10, 'wire_used_safe', default, default, default, 'front', 2, default, default);
insert into game_object_coment values(10, '전선은 쓸모가 없을까..', 10);

insert into game_object values(11, 'driver_used_safe', default, default, default, 'front', 2, default, default);
insert into game_object_coment values(11, '드라이버는 쓸모가 없을까..', 11);

insert into game_object values(12, 'wire', default, default, 'used_safe', 'front', 3, 2, 'Y');
insert into game_object_coment values(12, '전선을 획득했다.', 12);

insert into game_object values(13, 'driver', default, default, 'used_safe', 'front', 3, 38, 'Y');
insert into game_object_coment values(13, '드라이버를 획득했다.', 13);

insert into game_object values(14, 'under_bed_diary','diary', 'diary_opened', default, 'left', 1, default, default);
insert into game_object_coment values(14, '"침대 밑에 무언가 떨어져 있어."', 14);
insert into game_object_coment values(15, '다이어리.. 단서가 될만 하다.', 14);
insert into game_object_coment values(16, '알 수 없는 쪽지가 있다.', 14);

insert into game_object values(15, 'used_under_bed_diary', default, default, default, 'left', 2, default, default);
insert into game_object_coment values(17, '쪽지 말고는 아무것도 써있지 않다.', 15);

insert into game_object values(16, 'hintnote1', default, default, 'diary_opened','left', 3, default, 'Y');
insert into game_object_coment values(18, '쪽지를 획득했다.', 16);

insert into game_object values(17, 'doll', default, default, default, 'back', 1, default, default);
insert into game_object_coment values(19, '웬 곰인형이 있다.', 17);

insert into game_object values(18, 'used_doll', default, default, default, 'back', 2, default, default);
insert into game_object_coment values(20, '"곰인형 속에 뭔가 있어.."', 18);

insert into game_object values(19, 'used_doll_hintnote3', default, default, 'used_doll', 'back', 3, 34, 'Y');
insert into game_object_coment values(21, '쪽지를 획득했다.', 19);

insert into game_object values(20, 'books_4', default, default, default, 'back', 1, default, default);
insert into game_object_coment values(22, '정리가 하나도 안되어 있는 책장이다.', 20);

insert into game_object values(21, 'smallbox', default, default, default, 'back', 1, default, default);
insert into game_object_coment values(23, '"이것도 잠겨있잖아..!"', 21);

insert into game_object values(22, 'used_smallbox', default, default, default, 'back', 2, default, default);
insert into game_object_coment values(24, '안에 쪽지가 들어있다.', 22);

insert into game_object values(23, 'used_smallbox_hintnote2', default, default, 'used_smallbox', 'back', 3, default, 'Y');
insert into game_object_coment values(25, '쪽지를 획득했다.', 23);

insert into game_object values(24, 'clock', 'clock_back', 'clock_opened',default, 'back', 1, default, default);
insert into game_object_coment values(26, '"고장난건가?"', 24);
insert into game_object_coment values(27, '특별한게 없는 시계인듯 하다.', 24);
insert into game_object_coment values(28, '건전지가 들어있다.', 24);

insert into game_object values(25, 'used_clock', default, default, default, 'back', 2, default, default);
insert into game_object_coment values(29, '...', 25);

insert into game_object values(26, 'battery', default, default, 'clock_opened', 'back', 3, 2, 'Y');
insert into game_object_coment values(30, '건전지를 획득했다.', 26);

insert into game_object values(27, 'books_2', default, default, default, 'back', 1, default, default);
insert into game_object_coment values(31, '"흠...이상한 숫자들이야."', 27);

insert into game_object values(28, 'toolbox', 'toolbox_opened', default, default, 'back', 1, default, default);
insert into game_object_coment values(32, '"공구함..! 쓸만한게 들어있을지도..!"', 28);
insert into game_object_coment values(33, '"커터칼이랑 망치?"', 28);

insert into game_object values(29, 'used_toolbox', default, default, default, 'back', 2, default, default);
insert into game_object_coment values(34, '...', 29);

insert into game_object values(30, 'hammer', default, default, 'toolbox_opened', 'back', 3, 5, 'Y');
insert into game_object_coment values(35, '망치를 획득했다.', 30);

insert into game_object values(31, 'cutterknife', default, default, 'toolbox_opened', 'back', 3, 17, 'Y');
insert into game_object_coment values(36, '커터칼 심을 획득했다.', 31);

insert into game_object values(32, 'cutterknife_toolbox', default, default, default, 'back', 2, default, default);
insert into game_object_coment values(37, '"이 칼로... 아니다.."', 32);

insert into game_object values(33, 'hammer_toolbox', default, default, default, 'back', 2, default, default);
insert into game_object_coment values(38, '"이 방에서 부술만한게 있었던가.."', 33);

insert into game_object values(34, 'water', default, default, default, 'right', 1, default, default);
insert into game_object_coment values(39, '물인듯한데 색깔이 이상하다.', 34);

insert into game_object values(35, 'used_water_hintnote3', default, default, 'used_water', 'back', 3, default, 'Y');
insert into game_object_coment values(40, '젖은 쪽지를 획득했다.', 35);
select * from game_object;
insert into game_object values(36, 'window', default, default, default, 'right', 1, default, default);
insert into game_object_coment values(41, '창밖에는 암흑 뿐이다..', 36);

insert into game_object values(37, 'letter', 'letter_opened', default, default, 'right', 1, default, default);
insert into game_object_coment values(42, '웬 편지가 놓여있다.', 37);
insert into game_object_coment values(43, '.....나에게 하는 말인 것 같다.', 37);

insert into game_object values(38, 'ceilinglight', default, default, default, 'ceiling', 1, default, default);
insert into game_object_coment values(44, '"전등속에 뭐가 있는데.. 손은 닿지만 열리지가 않아..!"', 38);

insert into game_object values(39, 'used_ceilinglight', default, default, default, 'ceiling', 2, default, default);
insert into game_object_coment values(45, '여는데 성공했다..!', 39);

insert into game_object values(40, 'used_ceilinglight_key_2', default, default, 'used_ceilinglight', 'ceiling', 3, 1, 'Y');
insert into game_object_coment values(46, '열쇠를 획득했다.', 40);

insert into game_object values(41, 'wrong', default, default, default, null, null, null, 'N');
insert into game_object_coment values(47, '여기에 쓰는게 아닌 것 같다."', 41);

insert into game_object values(42, 'used_water', default, default, default, 'right', 2, default, 'N');
insert into game_object_coment values(48, '...', 42);

insert into game_object values(43, 'used_used_door_lock2', 'keypad', default, default, 'front', 3, default, 'N');
insert into game_object_coment values(49, '작동한다..!! 비밀번호....!', 43);

insert into game_object values(44, 'used_door_lock1', default, default, default, 'front', 2, default, 'N');
insert into game_object_coment values(50, '열렸다...!!', 44);

commit;

select * from game_state;
--drop table game_state;
create table game_state(
    userid varchar2(50) unique,
    
    --front면
    door_lock1use number default 1,--2면 열림상태
    door_lock2use number default 1,--2면 열림상태
    flowerpotUse number default 1,--2면 깨진상태
    used_flowerpot_key_1Get number default 1, --화분속 열쇠1 2면 획득한상태 (깨진화분만 있는 상태)
    used_flowerpot_key_1Use number default 1, --2면 사용하여 인벤토리에서 없어진 상태
    
    
    safeuse number default 1,--금고 2면 열려있고 비어있는 상태
    
    ----금고 내의 아이템 전선, 드라이버
    wireGet number default 1, --전선 2면 획득한상태
    wireUse number default 1, --전선 2면 사용한 상태
    
    driverGet number default 1,--드라이버 2면 획득한상태
    driverUse number default 1,--드라이버 2면 사용한 상태
    
    
    --left면
    hintNote1Get number default 1, -- 침대 뒤 일기장 달력힌트쪽지 2면 획득한 상태
    
    --back면 
    dollUse number default 1, --2면 찢어진상태
    used_doll_hintNote3Get number default 1, --2면 획득한 상태 (없어진상태)
    used_doll_hintNote3Use number default 1, --2면 right에 고여있는 물에 적셔져서 온전한내용이 나온 상태(인벤토리안에 있음, 없어지지않음)
    used_water_hintNote3Get number default 1,
    
    smallBoxUse number default 1, --2면 열려있고 비어있는 상태
    used_smallbox_hintNote2Get number default 1, -- 달력힌트쪽지2 2면 획득한 상태, 없어진 상태(인벤토리 안에 있음)
    clockUse number default 1, --2면 건전지가 빠져있는 상태
    batteryGet number default 1, --베터리 2면 시계에서 건전지가 빠진상태
    batteryUse number default 1, --2면 사용한 상태 
    
    toolboxUse number default 1, --2면 열려있고 비어있는 상태
    hammerGet number default 1, --2면 획득한 상태
    hammerUse number default 1, --2면 사용한 상태
    cutterknifeGet number default 1, --2면 획득한 상태
    cutterknifeUse number default 1, --2면 사용한 상태
    
    --right
    wateruse number default 1,
    --ceiling
    ceilinglightUse number default 1, -- 2면 드라이버를 사용해서 덮개가 열려있는 상태 
    used_ceilinglight_key_2Get number default 1, --2면 얻은 상태 전등에 키가 없어져있는 상태 
    used_ceilinglight_key_2Use number default 1
    --2면 사용하여 인벤토리에서 없어진상태 
);
--update game_state set door_lock1=1, door_lock2=1, flowerpot=1, key1Get=1, key1Use=1, safe=1, wireGet=1, wireUse=1, driverGet=1, driverUse=1, hintNote1=1, bs_doll=1, bs_hintNote3Get=1, bs_hintNote3Use=1, bs_smallbox=1, bs_hintNote2=1, bs_clock=1, bs_batteryGet=1, bs_batteryUse=1, bs_toolbox=1, bs_hammerGet=1, bs_hammerUse=1, bs_cutterknifeGet=1, bs_cutterknifeUse=1, light=1, key2Get=1, key2use=1 where userid=?;

select * from game_state where userid='guest_4061';
--delete from game_state;
--drop table game_state;
update game_state set bs_hammeruse=1, bs_hammerget=1 where userid='tkdgnstkdgns';
commit;

--신고게시글 테스트용 데이터
insert into admin_report_board values('F', seq_admin_support_board.nextVal, '멍멍', '개', '기타', '동물');
insert into admin_report_board values('S', seq_admin_support_board.nextVal, '야옹', '고양이', '기타', '동물');
insert into admin_report_board values('F', seq_admin_support_board.nextVal, '으르렁', '사자', '기타', '맹수');
insert into admin_report_board values('S', seq_admin_support_board.nextVal, '쮸쀼쮸쀼', '북금곰', '기타', '맹수');
insert into admin_report_board values('F', seq_admin_support_board.nextVal, '쌩쌩', '치타', '기타', '맹수');
insert into admin_report_board values('S', seq_admin_support_board.nextVal, 'abc', 'abcd', '기타', 'eng');

--신고댓글 테스트용 데이터
insert into admin_report_comment values('F', seq_admin_support_comment.nextVal, 6, 'aa', 'aaa', 'aaaa', 'aaaaa');
insert into admin_report_comment values('S', seq_admin_support_comment.nextVal, 7, 'bb', 'bbb', 'bbbb', 'bbbbb');
insert into admin_report_comment values('R', default, 8, 'cc', 'ccc', 'cccc', 'ccccc');
insert into admin_report_comment values('F', seq_admin_support_comment.nextVal, 9, 'dd', 'ddd', 'dddd', 'ddddd');
insert into admin_report_comment values('S', seq_admin_support_comment.nextVal, 10, 'ee', 'eee', 'eeee', 'eeeee');
insert into admin_report_comment values('R', default, 11, 'ff', 'fff', 'ffff', 'fffff');

--배드엔딩
create table game_bad_ending(
    no number,
    content varchar2(1000) not null,
    filename varchar2(50),
    audioname varchar2(50)
);

insert into game_bad_ending(no, content) values(1,'..');
insert into game_bad_ending(no, content) values(2,'....');
insert into game_bad_ending(no, content) values(3,'.......?!');
insert into game_bad_ending(no, content) values(4,'그래. 이렇게 다시봐도 꼴 보기 싫은 얼굴이구나.');
insert into game_bad_ending(no, content) values(5,'너..누구야..');
insert into game_bad_ending(no, content) values(6,'내얼굴이 많이변한건 그동안 피폐해진 내 삶때문이겠지.');
insert into game_bad_ending(no, content) values(7,'날 기억하지 못한다는건,');
insert into game_bad_ending(no, content, filename) values(8,'일말의 죄책감도 느끼지 않았다는 것으로 받아들여도 될까?', 'prologue.png');
insert into game_bad_ending(no, content) values(9,'!?!??!?!?!??!?!!??!!!!??!');
insert into game_bad_ending(no, content, audioname) values(10,'넌...갇혀있을 필요도 없었어...', 'reload.wav');
insert into game_bad_ending(no, content, audioname) values(11,'!!!!!!!!!!!!!!!!', 'gun.mp3');

--트루엔딩
create table game_true_ending(
    no number,
    content varchar2(1000) not null,
    filename varchar2(50),
    audioname varchar2(50)
);

insert into game_true_ending(no, content) values(1,'..');
insert into game_true_ending(no, content) values(2,'....');
insert into game_true_ending(no, content) values(3,'.......?!');
insert into game_true_ending(no, content) values(4,'그래. 이렇게 다시봐도 꼴 보기 싫은 얼굴이구나.');
insert into game_true_ending(no, content) values(5, '너....?!');
insert into game_true_ending(no, content, audioname) values(6, '난 들었던 총을 내려놓을 수 밖에 없었다.', 'trueEnd.mp3');
insert into game_true_ending(no, content) values(7, '얼굴이 말이 아니네, 그런표정 짓고 있는 거 보니까.');
insert into game_true_ending(no, content) values(8, '그래도 너 때문에 망가져사는 나에 비할건 못돼.');
insert into game_true_ending(no, content) values(9, '넌 날 잊고 잘 살았겠지.');
insert into game_true_ending(no, content) values(10, '생각지도 못한 사람이 내 앞에 서있다..');
insert into game_true_ending(no, content) values(11, '맞아. 난 공부밖에 모르는 투명인간이었어.');
insert into game_true_ending(no, content) values(12, '너가 장난으로 한 그말만 아니었어도,');
insert into game_true_ending(no, content) values(13, '난 별 볼일 없는 내인생을 좋은 대학으로 조금이라도 바꿔볼 수 있었어.');
insert into game_true_ending(no, content, audioname) values(14, '너 이새끼 내가 시험지 뒤에 종이 있는거 다봤다!', 'people.wav');
insert into game_true_ending(no, content, audioname) values(15, '야.. 선생님도있는데 그렇게 크게 말하면 진짠줄알거아냐...!', 'people.wav');
insert into game_true_ending(no, content, audioname) values(16, '내 알바아니다 ㅋㅋㅋ 장난인거 알겠지ㅋㅋㅋ', 'people.wav');
insert into game_true_ending(no, content) values(17, '그 날 난 어김없이 선생님께 불려갔었지.');
insert into game_true_ending(no, content, filename) values(18, '난 가정형편이 어려워서 급식비를 내지못하고 가끔 몰래 급식을 먹곤 했어.', 'past_lunch.jpg');
insert into game_true_ending(no, content) values(19, '그 탓에 미운털이 잔뜩 박혀있었지.');
insert into game_true_ending(no, content, filename) values(20, '내가 시험 전에 보려고 정리해놓고 여기저기 가방에 넣어둔 종이쪽지들...', 'papers.jpg');
insert into game_true_ending(no, content) values(21, '담임은..그게 부정행위라고 우기더군.');
insert into game_true_ending(no, content) values(22, '소문은 퍼질 수록 점점 커지는법...');
insert into game_true_ending(no, content) values(23, '그렇게 소문을 견디지 못하고 자퇴를 선택할 수 밖에 없었지.');
insert into game_true_ending(no, content) values(24, '나 같은 샌님 하나 없어졌다고 동요하는 아이들은 없었을 거야.');
insert into game_true_ending(no, content) values(25, '그리고... 그 트라우마로 지금까지 이렇게 살고있지.');
insert into game_true_ending(no, content) values(26, '세상 밖에 나갈 자신이 없어.');
insert into game_true_ending(no, content) values(27, '난....! 정말 몰랐어...!');
insert into game_true_ending(no, content) values(28, '늦은 사과..! 미안해..!');
--노래꺼짐
insert into game_true_ending(no, content) values(29, '이제서야 받게 되는구나...');
insert into game_true_ending(no, content, audioname) values(30, '내가 내려놓은 총을 조용히 들었다..', 'footprint.wav');
insert into game_true_ending(no, content) values(31, '총구를 겨누고 있는 눈이 공허해보인다.');
insert into game_true_ending(no, content) values(32, '살려줘...! 부탁이야....');
insert into game_true_ending(no, content) values(33, '.. 잘가...');
insert into game_true_ending(no, content, audioname) values(34, '총구를 자기 머리에 갖다대고 있다...!', 'reload.wav');
insert into game_true_ending(no, content) values(35, '???!!??!?!?!');
insert into game_true_ending(no, content) values(36, '물론 널 갈기갈기 찢어놓고 싶은 마음이 굴뚝같지만..');
insert into game_true_ending(no, content) values(37, '난 너를 죽일만큼 그렇게 간도 크지못해.');
insert into game_true_ending(no, content, filename) values(38, '네가 이 버튼을 누르고 이 방을 나가면,', 'emergency.jpg');
insert into game_true_ending(no, content) values(39, '조금 뒤엔 경찰차와 구급차가 올거야.');
insert into game_true_ending(no, content) values(40, '그리고 그 사람들이 도착할 즈음엔 난 이 세상 사람이 아니겠지.');
insert into game_true_ending(no, content) values(41, '달려가서 버튼을 눌렀다.. 마음을 바꿀 생각은 없는 것 같다..');
insert into game_true_ending(no, content) values(42, '방에 갇혀있는 동안 뭐라도 느꼈길 바래.');
insert into game_true_ending(no, content) values(43, '안돼.......!!');
insert into game_true_ending(no, content) values(44, '너만탓하면서 내인생을 원망하던 나도참 나약해...');
insert into game_true_ending(no, content) values(45, '내가 너한테');
insert into game_true_ending(no, content) values(46, '마지막으로 남길...말은');
insert into game_true_ending(no, content, filename) values(47, '죄책감으로 갚아. 난 남은 내 인생을 되돌릴 자신이 없어.', 'trueEnd.jpg');
insert into game_true_ending(no, content, audioname) values(48, '안돼!!!!!!!!!!!!!!!!!!!!!', 'policesiren.wav');
insert into game_true_ending(no, content, audioname) values(49, '!!!!!!!!', 'gun.mp3');

commit;