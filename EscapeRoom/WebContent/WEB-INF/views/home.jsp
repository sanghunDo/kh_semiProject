<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="semi.board.rank.model.vo.*,
					semi.notice.model.vo.*,
					semi.board.free.model.vo.*,
					semi.board.solve.model.vo.*,
					java.util.*" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%
	Rank r = (Rank) request.getAttribute("rankTop");
	Notice linkedNotice = (Notice) request.getAttribute("linkedNotice");
	
	if(linkedNotice == null){
		linkedNotice = new Notice();
	}
	String category = "";
	
	if(linkedNotice != null && "N".equals(linkedNotice.getNoticeUrgent())) {
		category = "<공지사항>"; 
	}
	else{
		category = "<긴급공지>";
	}
	
	List<FreeBoard> list_free = (List<FreeBoard>) request.getAttribute("list_free");
	List<SolveBoard> list_solve = (List<SolveBoard>) request.getAttribute("list_solve");

%>

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
	margin-bottom:50px;
	text-align:center;
}

#medal-Img{
	width:150px;
	height:250px;
	display:inline-block;
}

#rank-One_Info{
	position:relative;
	width:270px;
	height:260px;
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

table.board{
	width:100%;
	color:white;
	border-collapse:collapse;
	margin-bottom:30px;
}

table.board th{
	color:white;
	padding:5px;
	text-align:center;
	border-bottom:1px solid white;
}

table.board td{
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

#rankTable{
	width:470px;
	height:300px;
	margin:0 auto;
	color:white;
}

table#player-Details{
	text-align:center;
	width:250px;
	color:white;
	border:1px double gray;
	border-radius:10px;
	background:#5D5D5D;
	margin:0 auto;
	margin-top:10px;
}

table#player-Details td{
	margin-left:10px;
}

#congratulations{
	color:white;
	font-family: 'Roboto Slab', serif;
	font-size:27px;
	text-align:center;
	margin-top:10px;
	margin-bottom:10px;
}

img#rankOne-Profile{
	width:100px;
	height:100px;
	display:block;
	margin:0 auto;
}

.freeBoardLinkAddress, .solveBoardLinkAddress{
	cursor:pointer;
}

</style>


<script>
$(function(){
	$(".freeBoardLinkAddress").on("click", function(){
		<%if(session != null || loggedInMember != null) {%>
			var temp = confirm("로그인 후 이용 가능한 서비스입니다.");
			if(!temp) return;
			else location.href = "<%=request.getContextPath()%>/member/login";
			return;
		<%}%>
	});

	$(".solveBoardLinkAddress").on("click", function(){
		<%if(session != null || loggedInMember != null) {%>
			var temp = confirm("로그인 후 이용 가능한 서비스입니다.");
			if(!temp) return;
			else location.href = "<%=request.getContextPath()%>/member/login";
			return;
		<%}%>
	});
});

function changeNoticeLink(){
	location.href = "<%=request.getContextPath()%>/admin/changeNoticeLink?=<%=linkedNotice.getNoticeNo()%>";
}

</script>

<div id="main-Container">
	<div id="admin-Container">
		<%if(loggedInMember != null && "admin".equals(loggedInMember.getUserId())) {%>
		<button id="admin-Btn" onclick="changeNoticeLink();">상단 바 공지사항 링크 변경</button>
		<%} %>
	</div>
	<div id="notice-Link">
		
		<a href="<%=request.getContextPath()%>/notice/noticeView?noticeNo=<%=linkedNotice.getNoticeNo()%>">
			<h3 id="ani-Text"><%=category %>&nbsp;&nbsp;<%=linkedNotice.getNoticeTitle() %></h3>
		</a>
	</div>
	
	<div id="rank-One">
		<h1>☆★ 금주 랭킹 1위 ★☆</h1>
		<div id="temp-Container">
		<table id="rankTable">
			<tr>
				<td><img id="medal-Img" src="<%=request.getContextPath()%>/images/home/gold_medal.png" alt="" /></td>
				<td>
					<div id="rank-One_Info">
						<p id="congratulations">CONGRATULATIONS</p>
						<img id="rankOne-Profile" src="<%=request.getContextPath() %>/upload/member<%=r.getUserprofilerenamedfile() %>" alt="" />
						<table id="player-Details">
							<tr>
								<th>아이디 </th>
								<td><%=r.getGameId() %></td>
							</tr>
							<tr>
								<th>클리어 시간  </th>
								<td><%=r.getEndRuntime() %></td>
							</tr>
							<tr>
								<th>클리어 날짜  </th>
								<td><%=r.getGameescapedate() %></td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>	
		</div>
	</div>
	
	<div id="posts">
		<h1>인기게시물</h1>
		<br />
		<h2>- 자유게시판 -</h2>
		<table class="board" id="board-Free">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>추천수</th>
				<th>조회수</th>
			</tr>
			<%if(list_free == null || list_free.isEmpty()) { %>
			<tr><td colspan="6"></td></tr>
			<tr><td colspan="6">게시글이 없습니다.</td></tr>
			<%} else{
				for(FreeBoard fb : list_free){%>
				<tr>
					<td><%=fb.getPostNo() %></td>
					<td class="freeBoardLinkAddress"><%=fb.getPostTitle() %></td>
					<td><%=fb.getPostWriter() %></td>
					<td><%=fb.getPostDate() %></td>
					<td><%=fb.getPostLike() %></td>
					<td><%=fb.getPostReadCount() %></td>
				</tr>
			<%}} %>
		</table>
		
		<br />
		<h2>- 공략게시판 -</h2>
		<table class="board" id="board-Solve">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>추천수</th>
				<th>조회수</th>
			</tr>
			<%if(list_solve == null || list_solve.isEmpty()) { %>
			<tr><td colspan="6"></td></tr>
			<tr><td colspan="6">게시글이 없습니다.</td></tr>
			<%} else{
				for(SolveBoard fs : list_solve){%>
				<tr>
					<td><%=fs.getPostNo() %></td>
					<td class="solveBoardLinkAddress"><%=fs.getPostTitle() %></td>
					<td><%=fs.getPostWriter() %></td>
					<td><%=fs.getPostDate() %></td>
					<td><%=fs.getPostLike() %></td>
					<td><%=fs.getPostReadCount() %></td>
				</tr>
			<%}} %>
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>