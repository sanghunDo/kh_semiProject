<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ page import="java.util.*, semi.notice.model.vo.*" %>
<%
	List<Notice> list = (List<Notice>)request.getAttribute("list");

	int cPage = (int)request.getAttribute("cPage");
	int numPerPage = (int)request.getAttribute("numPerPage");
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
	<button id="admin-Btn" onclick="goToNoticeForm();">공지사항 등록</button>
</div>
<table id="notice-Table">
	<tr>
		<td>
			<div id="notice-Form">
				<div id="notice-Prev">
					<a href=""><img src="<%=request.getContextPath() %>/images/notice/event1.png"
						id="notice-Image" alt="" /></a>
					<span id="notice-Plain">&lt;공지사항&gt;</span>
					<!-- <span id="notice-Urgent">&lt;긴급공지&gt;</span> -->
					
					<span id="notice-Title">공지사항 제목내용입니다!</span>
					<span id="notice-Date">작성일 - 00/00/00</span>
				</div>
			</div>
		</td>
		
		<td>
			<div id="notice-Form">
				<div id="notice-Prev">
					<a href=""><img src="<%=request.getContextPath() %>/images/notice/event2.png"
						id="notice-Image" alt="" /></a>
					<span id="notice-Plain">&lt;공지사항&gt;</span>
					<!-- <span id="notice-Urgent">&lt;긴급공지&gt;</span> -->
					
					<span id="notice-Title">공지사항 제목내용입니다!</span>
					<span id="notice-Date">작성일 - 00/00/00</span>
				</div>
			</div>
		</td>
	</tr>
	
		<tr>
		<td>
			<div id="notice-Form">
				<div id="notice-Prev">
					<a href=""><img src="<%=request.getContextPath() %>/images/notice/event3.png"
						id="notice-Image" alt="" /></a>
					<span id="notice-Plain">&lt;공지사항&gt;</span>
					<!-- <span id="notice-Urgent">&lt;긴급공지&gt;</span> -->
					
					<span id="notice-Title">공지사항 제목내용입니다!</span>
					<span id="notice-Date">작성일 - 00/00/00</span>
				</div>
			</div>
		</td>
		
		<td>
			<div id="notice-Form">
				<div id="notice-Prev">
					<a href=""><img src="<%=request.getContextPath() %>/images/notice/event4.png"
						id="notice-Image" alt="" /></a>
					<span id="notice-Plain">&lt;공지사항&gt;</span>
					<!-- <span id="notice-Urgent">&lt;긴급공지&gt;</span> -->
					
					<span id="notice-Title">공지사항 제목내용입니다!</span>
					<span id="notice-Date">작성일 - 00/00/00</span>
				</div>
			</div>
		</td>
	</tr>
</table>
<div id="paging-Area">

</div>
</div>
</body>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>