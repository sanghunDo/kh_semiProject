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
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/header.css" />
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Alfa+Slab+One" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
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
		<div id="logo">Escape Room</div>
		<div id="menu">
			<ul>
				<li><a href="">NOTICE</a></li>
				<li><a href="<%=request.getContextPath()%>/board/free/freeBoardList">FREE</a></li>
				<li><a href="">RANKING</a></li>
				<li><a href="">SOLVE</a></li>
			</ul>
		</div>
		<div id="game-start">
			<button class="snip1535">ENTER GAME</button>
		</div>
	</header>
