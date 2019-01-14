<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	
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
<!-- 신고된 댓글 목록도 추가 -->
</div>
<table id="ReportArticleList">
	<tr>
		<th>카테고리</th> <!-- 자유/공략 -->
		<th>글번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>날짜</th>
		<th>추천수</th>
		<th>조회수</th>
		<th>신고사유</th>
		<th>신고내용</th>
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
		<td><%= %></td>
		<td><%= %></td>
		<td><%= %></td>
	</tr>
</table>
<button id="moveArticleBtn">이동하기</button>
<button id="deleteArticleBtn">삭제하기</button>
<table id="ReportCmtList">
	<tr>
		<th>카테고리</th> <!-- 자유/랭킹/공략 -->
		<th>게시글 번호</th>
		<th>댓글 번호</th>
		<th>댓글 작성자</th>
		<th>댓글 내용</th>
		<th>신고 사유</th>
		<th>신고 내용</th>
	</tr>
	<tr>
		<td><%= %></td>
		<td><%= %></td>
		<td><%= %></td>
		<td><%= %></td>
		<td><%= %></td>
		<td><%= %></td>
		<td><%= %></td>
	</tr>
</table>
<!-- 신고된 게시글 검색하기 -->
<div class="article-search-container">
	<select name="searchOpt" id="searchOpt">
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="titleAndContent">제목+내용</option>
		<option value="writer-id">글쓴이 아이디</option>
		<option value="comment-id">댓글 아이디</option>
     </select>
	<input type="text" name="searchVal" id="searchVal">
	<div id="search" style="width:50px">검색</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>