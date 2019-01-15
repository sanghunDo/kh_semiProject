<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Ending Credit</title>
<script src="js/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
<style>
html{
    background:black;
}

body{
    width: 1008px;
    height: 704px;
    padding: 0px;
    margin: 0 auto;
    overflow: hidden;
    background: black;
}

/*이거부터*/
div#endingCredit-Container{
    position:relative;
    width:100%;
    color:white;
    font-family: 'Noto Serif KR', serif;
    text-align:center;
    animation-name:endingCreditAni;
    animation-iteration-count:1;
    animation-duration: 60s;
    animation-timing-function: linear;
    animation-fill-mode: forwards;
}

div#title{
    font-size : 135px;
    font-family: 'Amatic SC', serif;
    text-shadow: 6px 6px 2px gray;
    width: 80%;
    margin: 0 auto;
    color: lightgray;
}

@keyframes endingCreditAni{
    0%{
        top:800px;
    }
    100%{
        top:-4500px;
    }
}

#easterEgg{
    color:black;
}

</style>
</head>
<body>
<audio autoplay src="<%=request.getContextPath()%>/audio/moonlight_sonata_blackroom3.mp3"></audio>
    <div id="endingCredit-Container">
        <h1>- Escape, if you can. -</h1>
        <br><br>
        <h4>정창학&nbsp;&nbsp;이소희&nbsp;&nbsp;이재선&nbsp;&nbsp;강선영&nbsp;&nbsp;도상훈&nbsp;&nbsp;한주리&nbsp;&nbsp;신혜영</h4>
        <br><br>        
        <h3>SourceTree 및 Git</h3>
        <h4>도상훈</h4>
        <br><br>
        <h3>커뮤니티 데이터베이스</h3>
        <h4>강선영</h4>
        <br><br>
        <h3>게임 데이터베이스</h3>
        <h4>도상훈&nbsp;&nbsp;정창학</h4>
        <br><br>
        <h3>회원정보</h3>
        <h4>이재선</h4>
        <br><br>
        <h3>자유게시판</h3>
        <h4>신혜영</h4>
        <br><br>
        <h3>공략게시판</h3>
        <h4>신혜영</h4>
        <br><br>
        <h3>랭킹게시판</h3>
        <h4>한주리</h4>
        <br><br>
        <h3>댓글</h3>
        <h4>신혜영&nbsp;&nbsp;한주리</h4>
        <br><br>
        <h3>공지사항 및 홈</h3>
        <h4>강선영</h4>
        <br><br>
        <h3>관리자 모드</h3>
        <h4>이소희</h4>
        <br><br>
        <h3>메인화면 및 헤더 UI</h3>
        <h4>도상훈</h4>
        <br><br>
        <h3>메인 게임</h3>
        <h4>도상훈&nbsp;&nbsp;정창학</h4>
		<br><br>
        <h3>게임 알고리즘</h3>
        <h4>도상훈</h4>
		<br><br>
        <h3>게임 시나리오</h3>
        <h4>정창학&nbsp;&nbsp;강선영</h4>
        <br><br>
        <h3>스토리 및 선택지</h3>
        <h4>강선영</h4>
		<br><br>
        <h3>아이템 구매 결제 서비스</h3>
        <h4>이재선</h4>
        <br><br>
        <h3>그림</h3>
        <h4>정창학&nbsp;&nbsp;강선영</h4>
        <br><br>
        <h3>자막</h3>
        <h4>도상훈</h4>
        <br><br>
        <h3>효과음</h3>
        <h4>강선영</h4>
        <br><br>
        <h3>게임 참고</h3>
        <h4>검은방</h4>
        <br><br>
        <h3>도움</h3>
        <h4>김동현 강사님</h4>
        <br><br>
        <h3>플레이 해주셔서 감사합니다.</h3>
        <br><br>
        <div id="title">Escape, if you can.</div>
        <br><br>
        <h3 id="easterEgg">당신은 영원히 빠져나갈 수 없습니다.</h3>
        <h4>Copyrights 2019. Escape, if you can. All rights reserved.</h4>
    </div>
</body>
</html>