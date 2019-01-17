<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, semi.notice.model.vo.*, semi.board.solve.model.vo.*, semi.board.free.model.vo.*,
				semi.admin.model.vo.*, semi.admin.controller.*" %>
<%
	String userId = (String) request.getAttribute("userId");
	int noticeNo = (int)Integer.parseInt(request.getParameter("noticeNo"));
	List<Notice> noticeList = (List<Notice>)request.getAttribute("noticeList");
	List<FreeBoard> freeList = (List<FreeBoard>)request.getAttribute("freeList");
	List<SolveBoard> solveList = (List<SolveBoard>)request.getAttribute("solveList");
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<style>
h1{
	color:white;
	font-family:'Noto Serif KR', serif;
	text-align:center;
}

h3{
	color:white;
	font-family:'Noto Serif KR', serif;
	text-align:center;
	margin-top:20px;
	margin-bottom:40px;
}

section{
  	font-family: 'Noto Serif KR', serif;
	border-collapse:collapse;
	width:80%;
	margin:0 auto;
	color:white;
	margin-bottom:50px;
}

table {
   	font-family: 'Noto Serif KR', serif;
   	width: 100%;
   	border: 1px solid gray;
   	border-collapse: collapse;
   	padding: 1px;
   	margin:0 auto;
	background: white;
}

table a:link {
	color: blue;
}
table a:visited {
	color: purple;
}
table a:hover {
	color: black;
}

table th, td{
	text-align:center;
	font-weight:bold;
	font-size:15px;
	padding-top:5px;
	padding-bottom:5px;
	border-bottom: 1px solid black;
}

img.userProfile{
	width:100px;
	height:100px;
	cursor:pointer;
}

#showAll, #hide{
	width:200px;
	height:40px;
	background:#353535;
	color:white;
	border:1px solid #353535;
	border-radius:10px;
	font-size:18px;
	font-weight:bold;
	font-family:'Noto Serif KR', serif;
	cursor:pointer;
}

.hideThis{
	display:none;
}
</style>
<script>
</script>
<title>관리자용 게시판</title>
<h1>작성 게시글 목록</h1>
<!-- 관리자로 로그인했을 시에만 보이기 -->
<%if(loggedInMember !=null && "admin".equals(loggedInMember.getUserId())){%>
<section id="notice-container">
<h3>공지게시판</h3>
	<table id="notice-view">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>날짜</th>
			</tr>
		<%if(noticeList != null && !noticeList.isEmpty()) { 
				for (Notice n : noticeList) {%>
			<tr>
				<td><%=n.getNoticeNo() %></td>
				<td><%=n.getNoticeTitle() %></td>
				<td><%=n.getNoticeContent() %></td>
				<td><%=n.getNoticeDate() %></td>
			</tr>
			<%} } else {  %>
			<tr>
				<td colspan="3">
					작성한 게시글이 없습니다.
				</td>
			</tr>
		<% }  %>
	</table>
</section>
	<% } else { %>
	<% } %>
<section id="free-container">
<h3>자유게시판</h3>
	<table id="free-view">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>날짜</th>
				<th>추천수</th>
				<th>비추천수</th>
				<th>조회수</th>
			</tr>
		<%if(freeList != null && !freeList.isEmpty()) { 
				for (FreeBoard fb : freeList) {%>
			<tr>
				<td><%=fb.getPostNo() %></td>
				<td><%=fb.getPostTitle() %></td>
				<td><%=fb.getPostDate() %></td>
				<td><%=fb.getPostLike() %></td>
				<td><%=fb.getPostDislike() %></td>
				<td><%=fb.getPostReadCount() %></td>
			</tr>
			<%} } else {  %>
			<tr>
				<td colspan="6">
					작성한 게시글이 없습니다.
				</td>
			</tr>
		<% }  %>
	</table>
</section>
<section id="solve-container">
<h3>공략게시판</h3>
	<table id="solve-view">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>날짜</th>
				<th>추천수</th>
				<th>비추천수</th>
				<th>조회수</th>
			</tr>
		<%if(solveList != null && !solveList.isEmpty()) { 
				for (SolveBoard sb : solveList) {%>
			<tr>
				<td><%=sb.getPostNo() %></td>
				<td><%=sb.getPostTitle() %></td>
				<td><%=sb.getPostDate() %></td>
				<td><%=sb.getPostLike() %></td>
				<td><%=sb.getPostDislike() %></td>
				<td><%=sb.getPostReadCount() %></td>
			</tr>
			<%} } else {  %>
			<tr>
				<td colspan="7">
					작성한 게시글이 없습니다.
				</td>
			</tr>
		<% }  %>
	</table>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>