<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="semi.admin.controller.*" %>
<%@ page import="semi.member.model.vo.Member" %>
<% 
	List<Member> list = (List<Member>)request.getAttribute("list");
	System.out.println("list@memberList.jsp=" + list);

	int cPage = (int)request.getAttribute("cPage");
	int numPerPage = (int)request.getAttribute("numPerPage");
	String pageBar = (String)request.getAttribute("pageBar");
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardCommunityTable.css" />
<script>
$(function(){
	
});
</script>
<body>
<h2>관리자 전용 게시판</h2>
<h3>전체 회원 정보</h3>
<table id="memberList">
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이메일</th>
		<th>가입한 날짜</th>
	</tr>
	<tr>
		<td><%= %></td>
		<td><%= %></td>
		<td><%= %></td>
		<td><%= %></td>
	</tr>
</table>
	<!-- 회원 삭제 -->
	<button id="deleteUserBtn">삭제하기</button>
	
	<!-- 회원 검색 -->
	<div class="search-container">
	    <div class="search-userid">
    		<form action="<%=request.getContextPath()%>/admin/adminMemberSearch"></form>
    	    <input type="text" name="searchVal" id="searchVal">
       	 <div id="search" style="width:50px">검색</div>
	    </div>
    	<div class="serach-useremail">
	    	<form action="<%=request.getContextPath()%>/admin/adminMemberSearch"></form>
	    </div>
    </div>
</body>
</html>