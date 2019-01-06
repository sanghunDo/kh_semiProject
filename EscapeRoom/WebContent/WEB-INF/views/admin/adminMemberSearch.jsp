<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="semi.admin.controller.*" %>
<%@ page import="semi.member.model.vo.Member" %>
<%
	Member m = (Member)request.getAttribute("member");
	
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardCommunityTable.css" />
<script>
$(function(){
	
});
</script>
<h2>관리자 전용 회원 검색</h2>
<div id="search-container">
		<div id="search-id">
			<form action="<%=request.getContextPath()%>/admin/adminMemberSearch">
			<input type="hidden" />
			<input type="hidden" />
			<input type="search" name="" id="" placeholder="검색할 아이디를 입력하세요."/>
			</form>
		</div>
		<!-- 이름으로 검색 추가 -->
		<div id="search-email">
			<form action="<%=request.getContextPath()%>/admin/adminMemberSearch">
			<input type="hidden" />
			<input type="hidden" />
			<input type="search" name="" id="검색할 이메일을 입력하세요." />
			</form>
		</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>