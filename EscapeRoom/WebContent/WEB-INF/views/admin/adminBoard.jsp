<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, semi.member.model.vo.*, semi.admin.model.vo.*, semi.admin.controller.*" %>
<%
	List<Member> memberList = (List<Member>) request.getAttribute("memberList");
	List<ReportBoard> reportList = (List<ReportBoard>) request.getAttribute("reportList");
	List<ReportBoardComment> reportCmtList = (List<ReportBoardComment>) request.getAttribute("reportCmtList");
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<style>
h1{
	color:white;
	font-family:'Noto Serif KR', serif;
	text-align:center;
}

h3{
	color:white;
	font-family:'Noto Serif KR', serif;
	text-align:center;
	margin-top:20px;
	margin-bottom:40px;
}

section{
  	font-family: 'Noto Serif KR', serif;
	border-collapse:collapse;
	width:80%;
	margin:0 auto;
	color:white;
	margin-bottom:50px;
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

table a:link {
	color: blue;
}
table a:visited {
	color: purple;
}
table a:hover {
	color: black;
}

table th, td{
	text-align:center;
	font-weight:bold;
	font-size:15px;
	padding-top:5px;
	padding-bottom:5px;
	border-bottom: 1px solid black;
}

img.userProfile{
	width:100px;
	height:100px;
	cursor:pointer;
}

#showAll, #hide{
	width:200px;
	height:40px;
	background:#353535;
	color:white;
	border:1px solid #353535;
	border-radius:10px;
	font-size:18px;
	font-weight:bold;
	font-family:'Noto Serif KR', serif;
	cursor:pointer;
}

.hideThis{
	display:none;
}
</style>
<script>
$(function(){
	$("#showAll").on("click", function(){
		$(".toggleTr").toggleClass("hideThis");
		$("#hide").toggleClass("hideThis");
		$("#showAll").toggleClass("hideThis");
	});
	
	$("#hide").on("click", function(){
		$(".toggleTr").toggleClass("hideThis");
		$("#hide").toggleClass("hideThis");
		$("#showAll").toggleClass("hideThis");
	});
	
	$(".userProfile").on("click", function(){
		var temp = confirm("해당 프로필 사진은 부적절한 사진입니까?");
		if(!temp) return;
		else{
			alert("해당 회원은 프로필 사진이 등록되어 있지 않습니다.")
			location.href = "<%=request.getContextPath()%>/admin/adminBoard";
		}
	});
});
</script>
<title>관리자용 게시판</title>
<h1>전체 회원 목록</h1>
<h3>목록에서 프로필 사진 클릭 시 바로 삭제할 수 있습니다.</h3>
<section id="member-list-container">
<table id="tbl-member">
	   <tr>
    	  	<th>아이디</th>
      		<th>이메일</th>
      		<th>프로필사진</th>
      		<th>가입날짜</th>
      		<th>보유코인</th>
	   </tr>
		<%if(memberList != null && !memberList.isEmpty()) { 
			for (int i=0; i<5; i++){%>
		<tr>
			<td>
				<!-- 아이디 클릭시 회원 상세보기 페이지로 이동 -->
				<input type="hidden" class="hidden" value="<%=memberList.get(i).getUserId() %>"/>
				<a href="<%=request.getContextPath()%>/admin/adminMemberView?userId=<%=memberList.get(i).getUserId()%>">
				<%=memberList.get(i).getUserId()%>
				</a>
			</td>
			<td><%=memberList.get(i).getUserEmail() %></td>
			<td>
				<%if(memberList.get(i).getUserProfileRenamedFile() != null){ %>
				<img class="userProfile" src="<%=request.getContextPath() %>/upload/member/<%=memberList.get(i).getUserProfileRenamedFile() %>" alt="" />
				<%} else{ %>
				<img class="userProfile" src="<%=request.getContextPath() %>/images/nonProfile.png" alt="" />
				<%} %>
			</td>
			<td><%=memberList.get(i).getEnrollDate() %></td>
			<td><%=memberList.get(i).getCoin() %></td>
		</tr>
		<%} %>
		<tr>
			<td colspan="5">
				<button id="showAll">▼ 전체회원 보기</button>
			</td>
		</tr>
		<%for (int i=5; i<memberList.size(); i++) { %>
				<tr class="toggleTr hideThis">
			<td>
				<input type="hidden" class="hidden" value="<%=memberList.get(i).getUserId() %>"/>
				<a href="<%=request.getContextPath()%>/admin/adminMemberView?userId=<%=memberList.get(i).getUserId()%>">
				<%=memberList.get(i).getUserId()%>
				</a>
			</td>
			<td><%=memberList.get(i).getUserEmail() %></td>
			<td>
				<%if(memberList.get(i).getUserProfileRenamedFile() == null){ %>
				<img class="userProfile" src="<%=request.getContextPath() %>/images/nonProfile.png" alt="" />
				<%} else{ %>
				<img class="userProfile" src="<%=request.getContextPath() %>/upload/member/<%=memberList.get(i).getUserProfileRenamedFile() %>" alt="" />
				<%} %>
			</td>
			<td><%=memberList.get(i).getEnrollDate() %></td>
			<td><%=memberList.get(i).getCoin() %></td>
		</tr>
		<%} %>
		<tr>
			<td colspan="5">
				<button class="hideThis" id="hide">▲ 접기</button>
			</td>
		</tr>
		<%} else {  %>
		<tr>
			<td>
				데이터가 없습니다.
			</td>
		</tr>
		<% } %>
</table>
</section>
<br />
<h1>신고된 게시글 목록</h1>
<section id="report-list-container">
	<table id="tbl-report">
			<tr>
				<th>카테고리</th>
				<th>글번호</th>
				<th>게시글제목</th>
				<th>게시글작성자</th>
				<th>신고사유</th>
				<th>신고내용</th>
			</tr>
			<%if(reportList != null && !reportList.isEmpty()) { 
				for (ReportBoard rb : reportList) {%>
			<tr>
				<td><%=rb.getCategory() %></td>
				<td>
					<!-- 게시글 번호 클릭시 상세보기 페이지로 이동하기 -->
					<a href="<%=request.getContextPath()%>/admin/adminReportView?postNo=<%=rb.getPostNo()%>">
					<%=rb.getPostNo()%>
					</a>
				</td>
				<td>
					<%=rb.getPostTitle()%>
				</td>
				<td><%=rb.getPostWriter()%></td>
				<td><%=rb.getReason()%></td>
				<td><%=rb.getUserComment()%></td>
			</tr>
			<%} } else {  %>
			<tr>
				<td>
					데이터가 없습니다.
				</td>
			</tr>
		<% }  %>
	</table>
</section>
<br />
<h1>신고된 댓글 목록</h1>
<section id="report-cmt-container">
	<table id="tbl-report-cmt">
			<tr>
				<th>카테고리</th>
				<th>게시글번호</th>
				<th>댓글번호</th>
				<th>댓글내용</th>
				<th>댓글작성자</th>
				<th>신고사유</th>
				<th>신고내용</th>
			</tr>
			<%if(reportCmtList != null && !reportCmtList.isEmpty()) { 
				for (ReportBoardComment rbc : reportCmtList) {%>
			<tr>
				<td><%=rbc.getCategory() %></td>
				
				<td>
					<%=rbc.getPostNo()%>
				</td>
				<td><!-- 댓글번호 클릭시  상세보기 페이지로 이동하기-->
					<a href="<%=request.getContextPath() %>/admin/adminReportCmtView?commentNo=<%=rbc.getCommentNo()%>">
					<%=rbc.getCommentNo() %>
					</a>
					</td>
				<td><%=rbc.getCommentContent()%></td>
				<td><%=rbc.getCommentWriter()%></td>
				<td><%=rbc.getReason()%></td>
				<td><%=rbc.getUserComment()%></td>
			</tr>
			<%} } else {%>
			<tr>
				<td>
					데이터가 없습니다.
				</td>
			</tr>
			<% }  %>
	</table>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>