<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="semi.member.model.vo.*" %>
<% 
	Member loggedInMember = (Member)session.getAttribute("loggedInMember"); 
%>
<!DOCTYPE>
<html>
<head>
<meta charset=UTF-8">
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
	height: 135px;
	border-bottom: 1px solid white;
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
	text-shadow: 3px 3px 1px gray;
	cursor: pointer;
}
header div#menu{
	position: relative;
	width: 700px;
	height: 40px;
	top: 65px;
	left: -50px;
}
div#menu ul{
	display: table;
	padding: 0px;
	margin: auto;
}
div#menu ul li{
	list-style-type: none;
	width: 8em;
	height: 2em;
	float: left;
	text-align: center;
}
div#menu ul li a{
	display: block; 
	padding: .5em;
	text-decoration: none;
	color: white;
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
				<li><a href="">RANKING</a></li>
				<li><a href="">COMMUNITY</a></li>
			</ul>
		</div>
	</header>
