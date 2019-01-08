<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<style>
#main-Container{
	width:100%;
	min-height:100px;
	margin-top:20px;
	font-family:'Noto Serif KR', serif;
}

h1{
	text-align:center;
}

h2{
	text-align:center;
	margin:0;
	margin-bottom:15px;
}

#notice-Link{
	width:100%;
	height:30px;
	overflow:hidden;
}

#ani-Text{
	position:relative;
	color:red;
	margin:0;
	left:1030px;
	cursor:pointer;
	animation-name:notice-Link_Ani;
	animation-iteration-count:infinite;
	animation-timing-function:linear;
	animation-duration:17s;
}

@keyframes notice-Link_Ani{
	0%{
		left:1030px;
	}
	100%{
		left:-1000px;
	}
}

#rank-One{
	width:600px;
	height:350px;
	margin:0 auto;
	color:white;
	margin-bottom:30px;
	text-align:center;
}

#medal-Img{
	width:150px;
	height:250px;
	display:inline-block;
}

#rank-One_Info{
	position:relative;
	border:1px solid white;
	width:300px;
	height:250px;
	top:3px;
	display:inline-block;
}

#posts{
	width:950px;
	min-height:100px;
	margin:0 auto;
	color:white;
}

#temp-Container{
	border:3px solid gold;
	border-radius:10px;
	width:500px;
	margin:0 auto;
}

table{
	width:100%;
	color:white;
	border-collapse:collapse;
	margin-bottom:30px;
}

table th{
	color:white;
	padding:5px;
	text-align:center;
	border-bottom:1px solid white;
}

table td{
	color:white;
	padding:5px;
	text-align:center;
}

#admin-Container{
	text-align:right;
	margin-bottom:5px;
}

#admin-Btn{
	border:1px solid white;
	border-radius:5px;
	background:black;
	color:white;
}
</style>
<div id="main-Container">
	<div id="admin-Container">
		<button id="admin-Btn">홈 화면 편집하기</button>
	</div>
	<div id="notice-Link">
		<h3 id="ani-Text">&lt;공지사항&gt; 런칭기념 가입시 300코인 무료증정 이벤트 진행중 !!</h3>
	</div>
	
	<div id="rank-One">
		<h1>☆★ 금주 랭킹 1위 ★☆</h1>
		<div id="temp-Container">
			<img id="medal-Img" src="<%=request.getContextPath()%>/images/home/gold_medal.png" alt="" />
			<div id="rank-One_Info">
				<!-- <span id="number1">tempName12</span>
				<span>클리어 시간 : 23분</span> -->
			</div>
		</div>
	</div>
	
	<div id="posts">
		<h2>인기 게시물</h2>
		<table id="board-Free">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>추천수</th>
				<th>조회수</th>
			</tr>
			<tr>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
			</tr>
			<tr>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
			</tr>
			<tr>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
			</tr>
		</table>
		<table id="board-Solve">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>추천수</th>
				<th>조회수</th>
			</tr>
			<tr>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
			</tr>
			<tr>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
			</tr>
			<tr>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
			</tr>
		</table>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>