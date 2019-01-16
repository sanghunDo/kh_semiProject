<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, semi.admin.controller.*, semi.admin.model.vo.*" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/free/boardCommunityView.css" />
<%
	List<ReportBoardComment> reportCmtList = (List<ReportBoardComment>) request.getAttribute("reportCmtList");
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
button{
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
function deleteReportCmt(){
	if(!confirm("정말 댓글을 삭제하시겠습니까?")){
        return;
     }
	
     $("[name=adminReportCmtDeleteFrm]").submit();
}
</script>
<title>관리자용 게시판</title>
<h1>신고된 덧글 상세보기</h1>
<!-- 신고된 덧글 상세 보기 및 수정, 삭제 -->
<section>
	<table>
	<%if(reportCmtList != null && !reportCmtList.isEmpty()) { 
					for (ReportBoardComment rbc : reportCmtList) {%>
			<tr>
				<th>카테고리</th>
				<td><%=rbc.getCategory() %></td>
			</tr>
			<tr>
				<th>게시글번호</th>
				<td><%=rbc.getPostNo() %></td>
			</tr>
			<tr>
				<th>댓글번호</th>
				<td><%=rbc.getCommentNo() %></td>
			</tr>
			<tr>
				<th>댓글내용</th>
				<td><%=rbc.getCommentContent() %></td>
			</tr>
			<tr>
				<th>댓글작성자</th>
				<td><%=rbc.getCommentWriter() %></td>
			</tr>
			<tr>
				<th>신고사유</th>
				<td><%=rbc.getReason() %></td>
			</tr>
			<tr>
				<th>신고내용</th>
				<td><%=rbc.getUserComment() %></td>
			</tr>
			<%} } else {  %>
			<tr>
				<td>
					데이터가 없습니다.
				</td>
			</tr>
		<% }  %>
	</table>
	<!-- <button onclick="editReportCmt();">수정하기</button> -->
	<button onclick="deleteReportCmt();">삭제하기</button>
</section>
<form action="<%=request.getContextPath()%>/admin/adminReportCmtDelete"
	  method="post"
	  name="adminReportCmtDeleteFrm">
</form>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>