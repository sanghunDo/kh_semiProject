<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="semi.admin.controller.*" %>
<%@ page import="semi.member.model.vo.Member" %>
<%
	List<Member> list = (List<Member>)request.getAttribute("list");
	
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardCommunityTable.css" />
<script>
$(function(){
	
});
</script>
<body>
<h2>관리자 전용 회원 검색</h2>
</body>
</html>