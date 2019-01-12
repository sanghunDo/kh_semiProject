<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="semi.admin.controller.*" %>
<%@ page import="semi.member.model.vo.Member" %>
<% 
	List<Member> memberList = (List<Member>)request.getAttribute("memberList");
	
	Member m = (Member)request.getAttribute("member");
	// header.jsp의 userId 변수명 충돌 방지용
	String userId_1 = m.getUserId();
	String userPassword = m.getUserPassword();
	String userEmail = m.getUserEmail()!=null?m.getUserEmail():"";
	String userProfileOriginalFile = m.getUserProfileOriginalFile()!=null?m.getUserProfileOriginalFile():"";	
	String userProfileRenamedFile = m.getUserProfileRenamedFile()!=null?m.getUserProfileRenamedFile():"";
	Date enrollDate = m.getEnrollDate();

	int cPage = (int)request.getAttribute("cPage");
	int numPerPage = (int)request.getAttribute("numPerPage");
	String pageBar = (String)request.getAttribute("pageBar");
	
	if(session.getAttribute("userId")!=null && session.getAttribute("userId").equals("admin")) {
		
	} else {
		
	}
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardCommunityTable.css" />
<script>
$(function(){
	var 
	
	$(function(){
		
	});
});
</script>
<h2>관리자 전용 게시판</h2>
<h3>회원 정보 수정하기</h3>
<!-- 전체 회원 목록 표시 -->
<table id="memberList">
	<thead>
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이메일</th>
		<th>가입한 날짜</th>
	</tr>
	</thead>	
	<tbody>
	<%
		for(Member member : memberList) {
	%>	
	<tr>
		<td><%=member.getUserId() %></td>
		<td><%=member.getUserPassword() %></td>
		<td><%=member.getUserEmail() %></td>
		<td><%=member.getEnrollDate() %></td>
	</tr>
	<%} %>
	</tbody>
	<!-- 페이지바 등 추가 -->
</table>
<!-- 회원 검색하기 -->
<div class="user-search-container">
   	<div id="search" style="width:50px">검색</div>
    <div class="search-userid">
		<form action="<%=request.getContextPath()%>/admin/adminMemberSearch"></form>
  			<input type="search" name="" id="" placeholder="검색할 아이디를 입력하세요."/>
 	</div>
    <div class="serach-useremail">
	   	<form action="<%=request.getContextPath()%>/admin/adminMemberSearch"></form>
			<input type="search" name="" id="검색할 이메일을 입력하세요." />
    </div>
	<button>검색하기</button>
	<%if(memberList == null || memberList.isEmpty()) {%>
		<p>검색 결과가 없습니다.</p>
	<%} else {%>
		<!-- 검색 결과 표시하기 -->
		<table>
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<td><%= %></td>
				<td><%= %></td>
				<td><%= %></td>
				<td><%= %></td>
			</tr>
		</table>
		<%=pageBar %>
	<%} %>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>