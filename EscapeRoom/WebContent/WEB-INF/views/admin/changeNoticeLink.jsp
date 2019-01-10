<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ page import="java.util.*, semi.notice.model.vo.*" %>
<%
	List<Notice> list = (List<Notice>) request.getAttribute("list");
%>
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<style>
#changeNoticeLink-Container{
	color:white;
	font-family:'Noto Serif KR', serif;
}

#title{
	color:white;
	text-align:center;
}
</style>
<div id="changeNoticeLink-Container">
	<h1 id="title">상단 바 공지사항 링크 변경</h1>

	<table>
		<%for(Notice n : list){ %>
		<%} %>
	</table>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>