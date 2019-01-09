<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/notice/notice.css" />
<style>

</style>
<div id="noticeForm-Container">
<form action="<%=request.getContextPath()%>/notice/insertNotice" method="post"
	enctype="multipart/form-data">
<h1 id="title">공지사항 등록</h1>
<table id="noticeForm">
	<tr>
		<th>구분</th>
		<td>
			<input type="radio" name="noticeUrgent" id="plain" value="N" checked/>
			<label for="plain">일반공지</label>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="noticeUrgent" id="urgent" value="Y"/>
			<label for="urgent">긴급공지</label>
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="noticeTitle" id="noticeTitle" required/>
		</td>
	</tr>
	<tr>
		<th>링크이미지</th>
		<td>
			<input type="file" name="up-file" required/>
			<p>링크이미지가 없으면 업로드가 불가능합니다. 반드시 선택하여 주십시오.</p>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="noticeContent" id="noticeContent" cols="90" rows="10" required></textarea>
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<p>모든 유저가보는 게시물입니다. 업로드 전 검토하여 주십시오.</p>
			<button type="submit" id="noticeSubmit-Btn">UPLOAD</button>
		</th>
	</tr>

</table>
</form>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>