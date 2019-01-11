<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ page import="java.util.*, semi.notice.model.vo.*" %>
<%
	Notice currentLinkedNotice = (Notice) request.getAttribute("notice");
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

table#noticeList{
	color:white;
	width:60%;
	min-height:100px;
	margin:0 auto;
	border-collapse:collapse;
}

table#noticeList th, table#noticeList td{
	text-align:center;
	padding:7px;
}

table#noticeList th{
	border-bottom:1px solid white;
}

.checkedLink{
	color:red;
}

</style>
<div id="changeNoticeLink-Container">
	<h1 id="title">상단 바 공지사항 링크 변경</h1>
	<form action="<%=request.getContextPath()%>/admin/changeNoticeLinkEnd" method="post">
	<table id="noticeList">
		<tr>
			<th id="link">선택</th>
			<th id="category">분류</th>
			<th id="noticeTitle">공지 제목</th>
		</tr>
		<%for(Notice n : list){ %>
		<tr>
			<td>
				<input type="radio" name="linkedNotice" class="linkedNotice" 
					<%=(currentLinkedNotice!=null && currentLinkedNotice.getNoticeNo() == n.getNoticeNo()) ? "checked" : "" %>/>
				<input type="hidden" name="noticeNo" value="<%=n.getNoticeNo() %>"/>
			</td>
			<%if("N".equals(n.getNoticeUrgent())){ %>
				<td>일반</td>
			<%} else{%>
				<td>긴급</td>
			<%} %>
			<td><%=n.getNoticeTitle() %></td>
		</tr>
		<%} %>
		<tr>
			<td colspan="3">
				<button type="submit" id="changeLink">링크 변경하기</button>
			</td>
		</tr>
	</table>
	</form>	
</div>

<script>
$(".linkedNotice").on("click", function(){
	$(this).parent().siblings().toggleClass("checkedLink");
	$(this).parent().parent().siblings().find("td").removeClass("checkedLink");
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>