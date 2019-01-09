<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/notice/notice.css" />
<style>
div#noticeForm-Container{
	font-family:'Noto Serif KR', serif;
}

table#noticeForm{
	color:white;
	border-collapse:collapse;
	width:800px;
	margin:0 auto;
}

table#noticeForm th{
	padding-top:20px;
	padding-bottom:20px;
	width:100px;
	border-bottom:1px solid gray;
}

table#noticeForm td{
	padding-top:10px;
	padding-bottom:10px;
	padding-left:30px;
	border-bottom:1px solid gray;
}

h1#title{
	color:white;
	text-align:center;
}

#noticeTitle{
	width:500px;
	height:30px;
	background:black;
	color:white;
	border-style:none;
	border-bottom:1px solid gray;
}

#noticeSubmit-Btn{
	width:150px;
	height:50px;
	outline:none;
	border:1px solid white;
	border-radius: 20px;
	background:white;
	font-size:20px;
	font-family: 'Roboto Slab', serif;
	font-weight:bold;
	cursor:pointer;
}

textarea#noticeContent{
	resize:none;
}
</style>
<div id="noticeForm-Container">
<form action="<%=request.getContextPath()%>/notice/InsertNotice" method="post">
<h1 id="title">공지사항 등록</h1>
<table id="noticeForm">
	<tr>
		<th>구분</th>
		<td>
			<input type="radio" name="noticeCategory" id="plain" checked/>
			<label for="plain">일반공지</label>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="noticeCategory" id="urgent" />
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
			<input type="file" name="noticeOriginalFileName" id="noticeOriginalFileName" required/>
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