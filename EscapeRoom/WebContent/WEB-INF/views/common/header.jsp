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
<title>You Can't Escape..</title>
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/header.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
</head>
<body>
	<header>
		<div id="top">
			<div id="myMenu">
			<%if(loggedInMember == null) {%>
                <a href="<%=request.getContextPath()%>/member/login">LOGIN</a>
			<%}else{ %>
				<%if("admin".equals(loggedInMember.getUserId())){ %>
					<a href="<%=request.getContextPath()%>/admin/adminBoard">ADMIN</a>
					&nbsp;&nbsp;
				<%} %>
                <a href="<%=request.getContextPath()%>/member/memberView?userId=<%=loggedInMember.getUserId()%>">MY PAGE</a>
                	&nbsp;&nbsp;
                <a href="<%=request.getContextPath()%>/member/logout">LOGOUT</a>
			<%} %>
			</div>
		</div>
		<div id="logo">Escape, if you can.</div>
		<div id="menu">
			<ul>
				<li><a href="<%=request.getContextPath()%>/home">HOME</a></li>
				<li><a href="<%=request.getContextPath()%>/notice/noticeList">NOTICE</a></li>
				<li><a href="<%=request.getContextPath()%>/rank">RANKING</a></li>
				<li><a href="">SOLVE</a></li>
				<li><a href="<%=request.getContextPath()%>/board/free/freeBoardList">FREE</a></li>
			</ul>
		</div>
		<div id="game-start">
			<button class="enter-game" >ENTER GAME</button>
		</div>
	</header>
	<script>
	$(".enter-game").click(function(){
		var pop;
		var url = "<%=request.getContextPath()%>/game/gameStart";
		var status = "width=1024px, height=678px";
		pop = sessionStorage.getItem("game");
		
		if(pop || pop != null) {alert("이미 게임이 실행중입니다."); return;} //팝업창이 열려있는 경우 중복실행 방지.
			
		if(<%=loggedInMember==null%>){
			var check = confirm("비로그인 시 랭킹등록이 불가합니다. 계속 진행하시겠습니까?");
			if(!check){return;}
		}
		pop = open(url, "game", status);
		sessionStorage.setItem("game", pop);
	});
	</script>