<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Charm" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<style>
body, html{
	width: 1024px; 
	height: 723px;
	margin: 0 auto;
	padding: 0;
	background: black;
}
body{display:none;}
div#backGround{
	position: relative;
	width: 100%;
	height: 100%;
}
div.on{
	background-image: url('<%=request.getContextPath()%>/images/index2.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}
header{
	position: relative;
	width: 100%;
	height: 40%;
	top: 3%;
	text-align: center;
}
div{color: white;font-family: 'Do Hyeon', sans-serif;}
div#title{
	font-size : 135px;
	font-family: 'Charm', cursive;
	font-weight: bold;
	text-shadow: 6px 6px 2px gray;
	display: none;
	position: relative;
	width: 80%;
	margin: 0 auto;
	opacity: .8;
}
div#login{float: right; margin-right: 25px; font-size: 20px; opacity: .7; cursor: pointer;}
div#login:hover{opacity:1; border-bottom: 2px solid white;}
nav#menu{display:none;}
nav#menu ul li{
	display: inline; 
	opacity: .8; 
	margin-right: 10px; 
	font-weight: bold; 
	font-size: 30px;
	font-family: 'Do Hyeon', sans-serif;
	color: #910303;
}
nav#menu ul li>a:link, ul li>a:visited, ul li>a:hover{color: #910303;text-decoration: none;}
nav#menu ul li:hover{border-bottom: 2px solid #910303; opacity: 1;}
</style>
<script>
$(function(){
	//페이지 서서히 켜지는 효과
	$("body").fadeIn(2000);
	
	//제목에 마우스 오버 시 메뉴 나옴.
	$("#title").fadeIn(4000).on('mouseenter', function(){
		$("#menu").fadeIn(2000);
	});
	
	//배경 깜빡거리는 효과
	setInterval(function(){
		$("#backGround").removeClass("on");
		setTimeout(function(){
			$("#backGround").addClass("on");
			setTimeout(function(){
				$("#backGround").removeClass("on");
				setTimeout(function(){
					$("#backGround").addClass("on");
				}, 200)
			}, 200)
		}, 200)
	}, 3000);
})
</script>
</head>
<body>
<div id="backGround" class="on">
	<header>
		<div id="login">로그인</div>
		<div id="title">EscapeRoom</div>
		<nav id="menu">
			<ul>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">랭킹보기</a></li>
				<li><a href="#">자유게시판</a></li>
			</ul>
		</nav>
	</header>
</div>
</body>
</html>