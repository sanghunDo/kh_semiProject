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
<title>You Can't Escape.</title>
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/header.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<script>
$(function(){
	$("body, html").css({"width": window.innerWidth, "min-height":window.innerHeight});
})
</script>
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
		<div id="logo">Escape, if you can.</div>
		<div id="menu">
			<ul>
				<li><a href="">HOME</a></li>
				<li><a href="">NOTICE</a></li>
				<li><a href="">RANKING</a></li>
				<li><a href="">SOLVE</a></li>
				<li><a href="<%=request.getContextPath()%>/board/free/freeBoardList">FREE</a></li>
			</ul>
		</div>
		<div id="game-start">
			<button class="enter-game">ENTER GAME</button>
		</div>
	</header>
	<script>
		$(".enter-game").click(function(){
			var url = "<%=request.getContextPath()%>/game/gameStart?userId=<%=loggedInMember!=null?loggedInMember.getUserid():"guest"%>";
			var title = "Can you Escape?";
 			var status = "width="+$(window).width()+", height="+$(window).height();
			open(url, title, status);
		});
	</script>
	