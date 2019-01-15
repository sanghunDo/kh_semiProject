<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ page import="java.util.*, semi.notice.model.vo.*, semi.member.model.vo.*" %>
<%
	List<Notice> list = (List<Notice>)request.getAttribute("list");
	int listSize = list.size();
	
	Notice n1 = list.get(0);
	Notice n2 = (listSize % 4 == 2 || listSize % 4 == 3 || listSize % 4 == 0) ? list.get(1) : null;
	Notice n3 = (listSize % 4 == 3 || listSize % 4 == 0) ? list.get(2) : null;
	Notice n4 = (listSize % 4 == 0) ? list.get(3) : null;

	int cPage = (int)request.getAttribute("cPage");
	int numPerPage = (int)request.getAttribute("numPerPage");
	String pageBar = (String) request.getAttribute("pageBar");
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/notice/notice.css" />
<script>
function goToNoticeForm(){
	location.href = "<%=request.getContextPath()%>/notice/noticeForm";
}
</script>
</head>
<body>
<div id="notice-Container">
<div id="adminBtn-Container">
	<%if(loggedInMember != null && "admin".equals(loggedInMember.getUserId())) {%>
	<button id="admin-Btn" onclick="goToNoticeForm();">공지사항 등록</button>
	<%} %>
</div>
<table id="notice-Table">
<%if(list.size() == 0){ %>
	<tr><td>게시물이 존재하지 않습니다.</td></tr>
<%} else{%>
	<tr>		
		<%if(n1 != null){ %>
		<td>
			<div id="notice-Form">
				<div id="notice-Prev">
					<a href="<%=request.getContextPath()%>/notice/noticeView?noticeNo=<%=n1.getNoticeNo()%>">
						<img src="<%=request.getContextPath() %>/upload/notice/<%=n1.getNoticeRenamedFile()%>"
						id="notice-Image" alt="" /></a>
						
					<%if("N".equals(n1.getNoticeUrgent())) {%>
					<span id="notice-Plain">&lt;공지사항&gt;</span>
					<%} else{ %>
					<span id="notice-Urgent">&lt;긴급공지&gt;</span>
					<%} %>
					
					<span id="notice-Title"><%=n1.getNoticeTitle() %></span>
					<span id="notice-Date">작성일 - <%=n1.getNoticeDate() %></span>
				</div>
			</div>
		</td>
		<%} %>
		
		<%if(n2 != null){ %>
		<td>
			<div id="notice-Form">
				<div id="notice-Prev">
					<a href="<%=request.getContextPath()%>/notice/noticeView?noticeNo=<%=n2.getNoticeNo()%>">
						<img src="<%=request.getContextPath() %>/upload/notice/<%=n2.getNoticeRenamedFile()%>"
						id="notice-Image" alt="" /></a>
						
					<%if("N".equals(n2.getNoticeUrgent())) {%>
					<span id="notice-Plain">&lt;공지사항&gt;</span>
					<%} else{ %>
					<span id="notice-Urgent">&lt;긴급공지&gt;</span>
					<%} %>
					
					<span id="notice-Title"><%=n2.getNoticeTitle() %></span>
					<span id="notice-Date">작성일 - <%=n2.getNoticeDate() %></span>
				</div>
			</div>
		</td>
		<%} %>
	</tr>
	
	<tr>
		<%if(n3 != null){ %>
		<td>
			<div id="notice-Form">
				<div id="notice-Prev">
					<a href="<%=request.getContextPath()%>/notice/noticeView?noticeNo=<%=n3.getNoticeNo()%>">
						<img src="<%=request.getContextPath() %>/upload/notice/<%=n3.getNoticeRenamedFile()%>"
						id="notice-Image" alt="" /></a>
						
					<%if("N".equals(n3.getNoticeUrgent())) {%>
					<span id="notice-Plain">&lt;공지사항&gt;</span>
					<%} else{ %>
					<span id="notice-Urgent">&lt;긴급공지&gt;</span>
					<%} %>
					
					<span id="notice-Title"><%=n3.getNoticeTitle() %></span>
					<span id="notice-Date">작성일 - <%=n3.getNoticeDate() %></span>
				</div>
			</div>
		</td>
		<%} %>
		
		<%if(n4 != null){ %>
		<td>
			<div id="notice-Form">
				<div id="notice-Prev">
					<a href="<%=request.getContextPath()%>/notice/noticeView?noticeNo=<%=n4.getNoticeNo()%>">
						<img src="<%=request.getContextPath() %>/upload/notice/<%=n4.getNoticeRenamedFile()%>"
						id="notice-Image" alt="" /></a>
						
					<%if("N".equals(n4.getNoticeUrgent())) {%>
					<span id="notice-Plain">&lt;공지사항&gt;</span>
					<%} else{ %>
					<span id="notice-Urgent">&lt;긴급공지&gt;</span>
					<%} %>
					
					<span id="notice-Title"><%=n4.getNoticeTitle() %></span>
					<span id="notice-Date">작성일 - <%=n4.getNoticeDate() %></span>
				</div>
			</div>
		</td>
		<%} %>
	</tr>
	<%} %>
</table>
<div id="paging-Area">
	<%=pageBar %>
</div>

</div>
</body>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>