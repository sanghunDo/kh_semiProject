<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,
				semi.member.model.vo.*,
				semi.adminMode.model.vo.*" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Member> memberList = (List<Member>) request.getAttribute("memberList");
	List<Report_Board> rbList = (List<Report_Board>) request.getAttribute("reportBoardList");
	List<Report_Comment> rcList = (List<Report_Comment>) request.getAttribute("reportCommentList");
%>
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

table#memberTab{
	font-family: 'Noto Serif KR', serif;
	border-collapse:collapse;
	width:80%;
	margin:0 auto;
	color:white;
}

th, td{
	text-align:center;
	font-weight:bold;
	font-size:15px;
	padding-top:5px;
	padding-bottom:5px;
}

th{
	border-bottom: 1px solid white;
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

#report_Post, #report_Comment{
	font-family: 'Noto Serif KR', serif;
	border-collapse:collapse;
	width:80%;
	margin:0 auto;
	color:white;
	margin-bottom:50px;
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
		var temp = confirm("해당 사진이 게시되기에 부적절한 사진입니까?");
		if(!temp) return;
		else{
			location.href = "<%=request.getContextPath()%>/adminMode/deleteProfile?userId=" + 
					$(this).parent().siblings(".hiddenVal").val();
		}
	});
});
</script>

<h1>&lt; 신고게시글 목록 &gt;</h1>
<table id="report_Post">
	<tr>
		<th>분류</th>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>사유</th>
		<th>의견</th>
	</tr>
	<%if(rbList != null && !rbList.isEmpty()) {  
		for(Report_Board rb : rbList) { %>
		<tr>
			<td>
				<%if("F".equals(rb.getCategory())) {%>[자유]
				<%}else %>[공략]
			</td>
			<td><%=rb.getPostNo()%></td>
			<td>
				<a href="#">
				<%=rb.getPostTitle()%></a>
			</td>
			<td><%=rb.getPostWriter()%></td>
			<td><%=rb.getReason()%></td>
			<td><%=rb.getUserComment()%></td>
		</tr>
		<%}%>
	<%}else { %>
		<tr>
			<td colspan="6">데이터가 없습니다.</td>
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
	</tr>
	<%if(rcList != null && !rcList.isEmpty()) { 
		for(Report_Comment rc : rcList) {%>
		<tr>
			<td>
				<%if("F".equals(rc.getCategory())) {%>[자유]
				<%} else if("S".equals(rc.getCategory())) {%>[공략]
				<%}else %>[랭킹]
			</td>
			<td><%=rc.getPostNo()%></td>
			<td><%=rc.getCommentNo()%></td>
			<td>
				<a href="#"><!-- 해당 게시글 링크, 랭킹일 경우 랭킹게시판으로 이동 -->
				<%=rc.getCommentContent()%></a>
			</td>
			<td><%=rc.getCommentWriter()%></td>
			<td><%=rc.getReason()%></td>
			<td><%=rc.getUserComment()%></td>
		</tr>
		<%} %>
	<%} else{ %>
		<tr>
			<td colspan="7">데이터가 없습니다.</td>
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
	</tr>
	<%if(memberList != null && !memberList.isEmpty()) { 
		for(int i=0; i<5; i++){%>
		<tr>
			<td>
				<input type="hidden" class="hiddenVal" value="<%=memberList.get(i).getUserId() %>"/>
				<a href="<%=request.getContextPath()%>/member/memberView?userId=<%=memberList.get(i).getUserId()%>">
					<%=memberList.get(i).getUserId() %></a>
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
		<tr><td colspan="5"><button id="showAll">▼ 전체회원 보기</button></td></tr>
		<%for(int i=5; i<memberList.size(); i++) { %>
		<tr class="toggleTr hideThis">
			<td>
				<input type="hidden" value="<%=memberList.get(i).getUserId() %>"/>
				<a href="<%=request.getContextPath()%>/member/memberView?userId=<%=memberList.get(i).getUserId()%>">
					<%=memberList.get(i).getUserId() %></a>
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
		<tr><td colspan="5"><button class="hideThis" id="hide">▲ 접기</button></td></tr>
	<%} else{ %>
		<tr><td colspan="5">데이터가 없습니다.</td></tr>
	<%} %>
	
</table>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>