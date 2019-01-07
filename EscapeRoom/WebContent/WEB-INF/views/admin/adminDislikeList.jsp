<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	// 자바 코드 입력란
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
<h2>관리자 전용 게시판</h2>
<h3>비추천 게시글 목록</h3>
<!-- 비추천 수 일정 이상 달성하면 자동으로 이 게시판으로 이동됨 -->
<!-- 게시글 DB에서 삭제, 타 게시판으로 이동 -->
<table id="dislikeList">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>날짜</th>
		<th>추천수</th>
		<th>조회수</th>
	</tr>
	<tr>
	</tr>
</table>
	<button id="deleteArticleBtn">삭제하기</button>
    <div class="search-container">
        <select name="searchOpt" id="searchOpt">
            <option value="title">제목</option>
            <option value="content">내용</option>
            <option value="id">아이디</option>
        </select>
        <input type="text" name="searchVal" id="searchVal">
        <div id="search" style="width:50px">검색</div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>