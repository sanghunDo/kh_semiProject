<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,
				semi.member.model.vo.*,
				semi.adminMode.model.vo.*" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Admin> adminList = (List<Admin>) request.getAttribute("adminList");
	List<Member> memberList = (List<Member>) request.getAttribute("memberList");
	List<Report_Board> rbList = (List<Report_Board>) request.getAttribute("rbList");
	List<Report_Comment> rcList = (List<Report_Comment>) request.getAttribute("rcList");
%>
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/adminMode/adminMain.css" />
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
	
});

function deleteProfile(userId){
	var temp = confirm("해당 사진이 게시되기에 부적절한 사진입니까?");
	if(!temp) return;
	else location.href = "<%=request.getContextPath()%>/adminMode/deleteProfile?userId=" + userId;
}

function deleteReportBoard(postNo, category){
	var temp = confirm("해당 글에 대한 신고를 취소하시겠습니까?");
	if(!temp) return;
	else location.href = "<%=request.getContextPath()%>/adminMode/deleteReportBoard?postNo=" + postNo + "&category=" + category;
}

function deleteReportComment(commentNo, category){
	var temp = confirm("해당 댓글에 대한 신고를 취소하시겠습니까?");
	if(!temp) return;
	else location.href = "<%=request.getContextPath()%>/adminMode/deleteReportComment?commentNo=" + commentNo + "&category=" + category;
}

function deletePost(postNo, category){
	var temp = confirm("해당 게시글을 삭제처리 하시겠습니까?");
	if(!temp) return;
	else location.href = "<%=request.getContextPath()%>/adminMode/deletePost?postNo=" + postNo + "&category=" + category;
}

function deleteComment(commentNo, category){
	var temp = confirm("해당 댓글을 삭제처리 하시겠습니까?");
	if(!temp) return;
	else location.href = "<%=request.getContextPath()%>/adminMode/deleteComment?commentNo=" + commentNo + "&category=" + category;
}

function adminWarn(userId){
	var temp = confirm("해당 관리자에게 경고처리를 하시겠습니까?");
	if(!temp) return;
	else location.href = "<%=request.getContextPath()%>/adminMode/adminWarn?userId=" + userId;
}

function adminGrant(userId){
	var temp = confirm("해당 회원에게 관리자 권한을 부여하시겠습니까?");
	if(!temp) return;
	else location.href = "<%=request.getContextPath()%>/adminMode/adminGrant?userId=" + userId;
}
</script>

<h1>&lt; 신고게시글 목록 &gt;</h1>
<table id="report_Post">
	<tr>
		<th>분류</th>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>사유</th>
		<th>의견</th>
		<th>처리</th>
	</tr>
	<%if(rbList != null && !rbList.isEmpty()) {  
		for(Report_Board rb : rbList) { %>
		<tr>
			<td>
				<%if("F".equals(rb.getCategory())) {%>[ 자유 ]
				<%}else %>[ 공략 ]
			</td>
			<td><%=rb.getPostNo()%></td>
			<td>
				<a href="<%=request.getContextPath()%>/board/<%=("F".equals(rb.getCategory()))?"free/freeBoardView":"solve/solveBoardView"%>?postNo=<%=rb.getPostNo()%>">
				<%=rb.getPostTitle()%></a>
			</td>
			<td><%=rb.getPostWriter()%></td>
			<td><%=rb.getReasonChecked()%></td>
			<td><%=rb.getUserComment()%></td>
			<td>
				<button class="notOK" onclick="deletePost('<%=rb.getPostNo()%>', '<%=rb.getCategory()%>');">삭제</button>
				&nbsp;
				<button class="OK" onclick="deleteReportBoard('<%=rb.getPostNo()%>', '<%=rb.getCategory()%>');">X</button>
			</td>
		</tr>
		<%}%>
	<%} else { %>
		<tr>
			<td colspan="7">데이터가 없습니다.</td>
		</tr>
	<%} %>
</table>

<h1>&lt; 신고댓글 목록 &gt;</h1>
<table id="report_Comment">
	<tr>
		<th>분류</th>
		<th>글번호</th>
		<th>댓글번호</th>
		<th>내용</th>
		<th>작성자</th>
		<th>사유</th>
		<th>의견</th>
		<th>처리</th>
	</tr>
	<%if(rcList != null && !rcList.isEmpty()) { 
		for(Report_Comment rc : rcList) {%>
		<tr>
			<td>
				<%if("F".equals(rc.getCategory())) {%>[ 자유 ]
				<%} else if("S".equals(rc.getCategory())) {%>[ 공략 ]
				<%}else %>[ 랭킹 ]
			</td>
			<td><%=rc.getPostNo()%></td>
			<td><%=rc.getCommentNo()%></td>
			<td>
				<a href="#"><!-- 해당 게시글 링크, 랭킹일 경우 랭킹게시판으로 이동 -->
				<%=rc.getCommentContent()%></a>
			</td>
			<td><%=rc.getCommentWriter()%></td>
			<td><%=rc.getReasonChecked()%></td>
			<td><%=rc.getUserComment()%></td>
			<td>
				<button class="notOK" onclick="deleteComment('<%=rc.getCommentNo() %>', '<%=rc.getCategory()%>');">삭제</button>
				&nbsp;
				<button class="OK" onclick="deleteReportComment('<%=rc.getCommentNo() %>', '<%=rc.getCategory()%>');">X</button>
			</td>
		</tr>
		<%} %>
	<%} else{ %>
		<tr>
			<td colspan="8">데이터가 없습니다.</td>
		</tr>
	<%} %>
</table>
<h1>&lt; 전체회원 목록 &gt;</h1>
<h3>부적절하다고 판단되는 사진을 클릭하면 강제로 삭제할 수 있습니다.</h3>
<table id="memberTab">
	<tr>
		<th>아이디</th>
		<th>이메일</th>
		<th>프로필사진</th>
		<th>가입날짜</th>
		<th>보유코인</th>
		<th>권한</th>
	</tr>
	<%if(memberList != null && !memberList.isEmpty()) { 
		for(int i=0; i<5; i++){%>
		<tr>
			<td>
				<a href="<%=request.getContextPath()%>/member/memberView?userId=<%=memberList.get(i).getUserId()%>">
					<%=memberList.get(i).getUserId() %></a>
			</td>
			<td><%=memberList.get(i).getUserEmail() %></td>
			<td>
				<%if(memberList.get(i).getUserProfileRenamedFile() == null){ %>
				<img class="userProfile" onclick="deleteProfile('<%=memberList.get(i).getUserId()%>');" src="<%=request.getContextPath() %>/images/nonProfile.png" alt="" />
				<%} else{ %>
				<img class="userProfile" onclick="deleteProfile('<%=memberList.get(i).getUserId()%>');" src="<%=request.getContextPath() %>/upload/member/<%=memberList.get(i).getUserProfileRenamedFile() %>" alt="" />
				<%} %>
			</td>
			<td><%=memberList.get(i).getEnrollDate() %></td>
			<td><%=memberList.get(i).getCoin() %></td>
			<td>
				<%if("admin".equals(memberList.get(i).getUserId())) {%>
					<button class="master" disabled>MASTER</button>				
				<%}
				else if(adminList != null && !adminList.isEmpty()){
					for(int j=0; j<adminList.size(); j++){ 
						if(memberList.get(i).getUserId().equals(adminList.get(j).getAdminId())) {%>
							<button class="admin" disabled>관리자</button>
							<button class="adminWarn" onclick="adminWarn('<%=memberList.get(i).getUserId()%>');">경고</button>
							<%break;
						}
						else if(j == adminList.size() - 1){%>
							<button class="adminGrant" onclick="adminGrant('<%=memberList.get(i).getUserId()%>');">관리자 등록</button>
						<%}
						else continue;
					}
				} else{%>
					데이터 X
				<%} %>
			</td>
		</tr>
		<%} %>
		<tr><td colspan="6"><button id="showAll">▼ 전체회원 보기</button></td></tr>
		<%for(int i=5; i<memberList.size(); i++) { %>
		<tr class="toggleTr hideThis">
			<td>
				<a href="<%=request.getContextPath()%>/member/memberView?userId=<%=memberList.get(i).getUserId()%>">
					<%=memberList.get(i).getUserId() %></a>
			</td>
			<td><%=memberList.get(i).getUserEmail() %></td>
			<td>
				<%if(memberList.get(i).getUserProfileRenamedFile() == null){ %>
				<img class="userProfile" onclick="deleteProfile('<%=memberList.get(i).getUserId()%>');" src="<%=request.getContextPath() %>/images/nonProfile.png" alt="" />
				<%} else{ %>				
				<img class="userProfile" onclick="deleteProfile('<%=memberList.get(i).getUserId()%>');" src="<%=request.getContextPath() %>/upload/member/<%=memberList.get(i).getUserProfileRenamedFile() %>" alt="" />
				<%} %>
			</td>
			<td><%=memberList.get(i).getEnrollDate() %></td>
			<td><%=memberList.get(i).getCoin() %></td>
			<td>
				<%if("admin".equals(memberList.get(i).getUserId())) {%>
					<button class="master" disabled>MASTER</button>				
				<%}
				else if(adminList != null && !adminList.isEmpty()){
					for(int j=0; j<adminList.size(); j++){ 
						if(memberList.get(i).getUserId().equals(adminList.get(j).getAdminId())) {%>
							<button class="admin" disabled>관리자</button>
							<button class="adminWarn" onclick="adminWarn('<%=memberList.get(i).getUserId()%>');">경고</button>
							<%break;
						}
						else if(j == adminList.size() - 1){%>
							<button class="adminGrant" onclick="adminGrant('<%=memberList.get(i).getUserId()%>');">관리자 등록</button>
						<%}
						else continue;
					}
				} else{%>
					데이터 X
				<%} %>
			</td>
		</tr>
		<%} %>
		<tr><td colspan="6"><button class="hideThis" id="hide">▲ 접기</button></td></tr>
	<%} else{ %>
		<tr><td colspan="6">데이터가 없습니다.</td></tr>
	<%} %>
	
</table>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>