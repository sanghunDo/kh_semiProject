<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="semi.notice.model.vo.*" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%
	Notice n = (Notice) request.getAttribute("notice");
%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/notice/notice.css" />

<div id="noticeForm-Container">
<%if("N".equals(n.getNoticeUrgent())){ %>
	<h1 id="plain">&lt;공지사항&gt;</h1>
<%} else { %>
	<h1 id="urgent">&lt;긴급공지&gt;</h1>
<%} %>
	<table id="noticeForm">
		<tr>
			<th>제목</th>
			<td><%=n.getNoticeTitle() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<img id="contentImage" src="<%=request.getContextPath() %>/upload/notice/<%=n.getNoticeRenamedFile() %>" alt="" />
				<pre id="noticeContent"><%=n.getNoticeContent() %></pre>
			</td>
		</tr>
	
	</table>
	
	<%if(loggedInMember != null && "admin".equals(loggedInMember.getUserId())) {%>
	<div id="modify-Notice">
		<button id="noticeModify-Btn" onclick="noticeModify();">수정하기</button>
		&nbsp;&nbsp;
		<button id="noticeDelete-Btn" onclick="noticeDelete();">삭제하기</button>
	</div>
	<%} %>
</div>

<script>
function noticeModify(){
	location.href = "<%=request.getContextPath()%>/notice/noticeUpdate?noticeNo=<%=n.getNoticeNo()%>";
}

function noticeDelete(){
	var temp = confirm("이 공지사항을 정말로 삭제하시겠습니까?");
	
	if(!temp){
		return;
	}
	else{
		location.href = "<%=request.getContextPath()%>/notice/noticeDelete?noticeNo=<%=n.getNoticeNo()%>";
	}
}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>