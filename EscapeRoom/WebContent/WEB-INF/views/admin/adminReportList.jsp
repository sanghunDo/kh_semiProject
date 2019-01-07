<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	Member m = (Member)request.getAttribute("member");
	//header.jsp의 userId 변수명 충돌 방지용
	String userId_1 = m.getUserId();
	String userPassword = m.getUserPassword();
	String userEmail = m.getUserEmail()!=null?m.getUserEmail():"";
	String userProfileOriginalFile = m.getUserProfileOriginalFile()!=null?m.getUserProfileOriginalFile():"";	
	String userProfileRenamedFile = m.getUserProfileRenamedFile()!=null?m.getUserProfileRenamedFile():"";
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>>/css/borderCommunityTable.css"/>
<script>
$(function(){
	// 게시글 삭제하기
	$("#deleteArticleBtn").click(function(){
		var isChecked = $(this).prop("checked");
		$(".deleteArticle").prop("checked", isChecked);
		
		if(isChecked)
			alert("정말로 삭제하시겠습니까?");
		
	});
	
});
</script>
<div class="container">
<h2>관리자 전용 게시판</h2>
<h3>신고된 게시글 목록</h3>
<!-- 신고 수 일정 이상 달성하면 자동으로 이 게시판으로 이동됨 -->
<!-- 게시글 DB에서 삭제 -->
<!-- 타 게시판으로 이동? -->
</div>
<table id="ReportList">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>날짜</th>
		<th>추천수</th>
		<th>조회수</th>
	</tr>
</table>
<table id="Report">
	<tr>
		<td><%= %></td>
		<td><%= %></td>
		<td><%= %></td>
		<td><%= %></td>
		<td><%= %></td>
		<td><%= %></td>
	</tr>
</table>
<button id="moveArticleBtn">이동하기</button>
<button id="deleteArticleBtn">삭제하기</button>
<!-- 게시글 검색하기 -->
<div class="article-search-container">
	<select name="searchOpt" id="searchOpt">
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="id">글쓴이 아이디</option>
		<option value="id">댓글 아이디</option>
     </select>
	<input type="text" name="searchVal" id="searchVal">
	<div id="search" style="width:50px">검색</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>