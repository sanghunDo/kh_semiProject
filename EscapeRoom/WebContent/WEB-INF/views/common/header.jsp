<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="semi.member.model.vo.*" %>
<% 
	Member loggedInMember = (Member)session.getAttribute("loggedInMember"); 
%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=ZCOOL+KuaiLe" rel="stylesheet">
<style>
body, html{
	width: 1024px; 
	min-height: 723px;
	margin: 0 auto;
	padding: 0;
	background: black;
	border: 1px solid white;
}
header{
	position: relative;
	width: 100%;
	height: 125px;
}
header div#top{
	position: relative;
	width: 100%;
	height: 30px;
}
header div#top div#myMenu{
	height: 30px;
	float: right;
	margin-right: 5px;
	margin-top: 2px;
	color: white;
}
a:link, a:visited, a:hover{color: white;text-decoration: none;}
header div#logo{
	width: 200px;
	height: 90px;
	float: left;
	margin-left: 30px;
	color: white;
	font-size: 50px;
	font-family: 'ZCOOL KuaiLe', cursive;
	cursor: pointer;
}
header div#menu{
	position: relative;
	width: 700px;
	height: 40px;
	top: 45px;
}
div#menu ul{
	display: table;
	padding: 0px;
	margin: auto;
	opacity: .8;
}
div#menu ul li{
	list-style-type: none;
	width: 8em;
	height: 2em;
	float: left;
	text-align: center;
	color: white;
}
div#menu ul li a{
	display: block;
	padding: .5em;
	text-decoration: none;
	color: #292929;
}
</style>
</head>
<body>
	<header>
		<div id="top">
			<div id="myMenu">
			<%if(loggedInMember == null) {%>
				<a href="">로그인</a>
			<%}else{ %>
				<a href="#">내정보관리</a>
				<a href="#">로그아웃</a>
			<%} %>
			</div>
		</div>
		<div id="logo">Escape</br>&nbsp;&nbsp;Room</div>
		<div id="menu">
			<ul>
				<li><a href="">공지사항</a></li>
				<li><a href="">랭킹게시판</a></li>
				<li><a href="">커뮤니티</a></li>
			</ul>
		</div>
	</header>
