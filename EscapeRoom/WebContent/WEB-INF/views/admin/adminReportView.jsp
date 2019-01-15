<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, semi.admin.controller.*, semi.admin.model.vo.*" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/free/boardCommunityView.css" />
<%
	List<ReportBoard> reportList = (List<ReportBoard>) request.getAttribute("reportList");
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
h1{
	color:white;
	font-family:'Noto Serif KR', serif;
	text-align:center;
}
table {
   	font-family: 'Noto Serif KR', serif;
   	width: 100%;
   	border: 1px solid gray;
   	border-collapse: collapse;
   	padding: 1px;
   	margin:0 auto;
	background: white;
}
button {
	outline:none;
	font-family: 'Noto Serif KR', serif;
	font-weight:bold;
	border:1px solid #353535;
	color:white;
	background: #353535;
	border-radius: 10px;
	width:200px;
	height:35px;
	font-size:15px;
	cursor:pointer;
	display:block;
	margin:0 auto;
	margin-top:20px;
}
</style>
<script>
function deleteReport(){
	if(!confirm("정말 게시글을 삭제하시겠습니까?")){
        return;
     }
	
     $("[name=adminReportDeleteFrm]").submit();
}
</script>
<title>관리자용 게시판</title>
<h1>신고된 게시글 상세 보기</h1>
<!-- 신고된 게시글 상세 보기 및 삭제 -->
<form action="<%=request.getContextPath()%>/admin/adminReportDelete" name="reportDeleteFrm">
<section id="report-list-container">
	<table id="tbl-report">
		<%if(reportList != null && !reportList.isEmpty()) { 
					for (ReportBoard rb : reportList) {%>
			<tr>
				<th>카테고리</th>
				<td><%=rb.getCategory() %></td>
			</tr>
			<tr>
				<th>글번호</th>
				<td><%=rb.getPostNo() %></td>
			</tr>
			<tr>
				<th>게시글제목</th>
				<td><%=rb.getPostTitle() %></td>
			</tr>
			<tr>
				<th>게시글작성자</th>
				<td><%=rb.getPostWriter() %></td>
			</tr>
			<tr>
				<th>신고사유</th>
				<td><%=rb.getReason() %></td>
			</tr>
			<tr>
				<th>신고내용</th>
				<td><%=rb.getUserComment() %></td>
			</tr>
			<%} } else {  %>
			<tr>
				<td>
					데이터가 없습니다.
				</td>
			</tr>
		<% }  %>
	</table>
	<!-- <button onclick="editReport();">수정하기</button> -->
	<button onclick="deleteReport();">삭제하기</button>
</section>
</form>
<form action="<%=request.getContextPath()%>/admin/adminReportDelete"
	  method="post"
	  name="adminReportDeleteFrm">
</form>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
