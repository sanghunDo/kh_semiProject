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
	top: 45px;
}
div#menu ul{
	display: table;
	padding: 0px;
}
div#menu ul li{
	list-style-type: none;
	height: 2em;
	float: left;
	text-align: center;
	color: white;
	border-bottom: 1px solid white;
	margin-right: 10px;
}
div#menu ul li a{
	display: block;
	padding: .5em;
	text-decoration: none;
}
div#menu ul li:hover {
	border-bottom: 2px solid white;
	background: lightgray;
	opacity: 0.7;
}
</style>
</head>
<body>
	<header>
		<div id="top">
			<div id="myMenu">
			<%if(loggedInMember == null) {%>
				<a href="">LOGIN</a>
			<%}else{ %>
				<a href="#">MY PAGE</a>
				<a href="#">LOGOUT</a>
			<%} %>
			</div>
		</div>
		<div id="logo">Escape</br>&nbsp;&nbsp;Room</div>
		<div id="menu">
			<ul>
				<li><a href="">NOTICE</a></li>
				<li><a href="<%=request.getContextPath()%>/board/free/freeBoardList">FREE</a></li>
				<li><a href="">RANKING</a></li>
				<li><a href="">SOLVE</a></li>
			</ul>
		</div>
	</header>
