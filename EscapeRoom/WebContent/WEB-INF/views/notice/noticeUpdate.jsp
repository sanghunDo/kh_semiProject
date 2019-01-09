<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="semi.notice.model.vo.*" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/notice/notice.css" />
<%
	Notice n = (Notice) request.getAttribute("notice");
%>

<style>

#fname-Container{
	position:relative;
	left:-181px;
	top:1px;
	width:300px;
	height:30px;
	background:black;
	display:inline-block;	
}
span#fname{
	position:relative;
	background:black;
}
</style>
<div id="noticeForm-Container">
<form action="<%=request.getContextPath()%>/notice/noticeUpdateEnd?noticeNo=<%=n.getNoticeNo() %>" method="post"
	enctype="multipart/form-data">
<h1 id="title">공지사항 수정</h1>
<table id="noticeForm">
	<tr>
		<th>구분</th>
		<td>
			<input type="radio" name="noticeUrgent" id="plain" value="N" <%="N".equals(n.getNoticeUrgent()) ? "checked" : ""%>/>
			<label for="plain">일반공지</label>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="noticeUrgent" id="urgent" value="Y" <%="Y".equals(n.getNoticeUrgent()) ? "checked" : ""%>/>
			<label for="urgent">긴급공지</label>
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="noticeTitle" id="noticeTitle" value="<%=n.getNoticeTitle()%>" required/>
		</td>
	</tr>
	<tr>
		<th>링크이미지</th>
		<td>
			<input type="file" name="up_file">
         	<div id="fname-Container">
         		<span id="fname"><%=n.getNoticeOriginalFile() != null ? n.getNoticeOriginalFile() : ""%></span>
         	</div>
         
         	<!-- 파일변경시 삭제 -->
         	<input type="hidden" name="old_renamed_file" value="<%=n.getNoticeRenamedFile()%>"/>
         	<input type="hidden" name="old_original_file" value="<%=n.getNoticeOriginalFile()%>"/>
         	
			<p>링크이미지가 없으면 업로드가 불가능합니다. 반드시 선택하여 주십시오.</p>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="noticeContent" id="noticeContent" cols="90" rows="10" required><%=n.getNoticeContent() %></textarea>
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<p>모든 유저가보는 게시물입니다. 업로드 전 검토하여 주십시오.</p>
			<button type="submit" id="noticeSubmit-Btn" onclick="return confirmModify();">MODIFY</button>
		</th>
	</tr>

</table>
</form>
</div>

<script>
function confirmModify(){
	var temp = confirm("해당 내용으로 공지사항을 수정하시겠습니까?");
	
	if(!temp){
		return;
	}
}

$("#up_file").on("click", function(){
	if($(this).val() != null){
		console.log($(this));
		$("#fname-Container").css("display", "none");
	}
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>