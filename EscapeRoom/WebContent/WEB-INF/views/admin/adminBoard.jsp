<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD

<%@ page import = "java.util.*" %>
<%
	List<Member> list = (List<Member>)request.getAttribute("list");
	int cPage = (int)request.getAttribute("cPage");
	int numPerPage = (int)request.getAttribute("numPerPage");
	String pageBar = (String)request.getAttribute("pageBar");
%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
section#memberList-container {
	text-align: center;
}

section#memberList-container table#tbl-member {
	width: 100%;
	border: 1px solid gray;
	border-collapse: collapse;
}

table#tbl-member th {
	border: 1px solid gray;
	padding: 1px;
	background : white;
}
table#tbl-member td{
	border: 1px solid gray;
	padding: 1px;
	background : white;
}
/*검색*/
div#search-container {
	margin : 0 0 10px 0;
	padding : 3px;
	background-color: lightblue;
}

div#search-memberId {
	display : inline-block;
}

div#search-memberName, div#search-gender{
	display:none;
=======
<%@ page import = "java.util.*" %>
<%@ page import = "semi.admin.controller.*" %>
<%
	List<Member> list = (List<Member>)request.getAttribute("list");
	// 신고된 게시글 목록도 불러오기
   	
   int cPage = (int)request.getAttribute("cPage");
   int numPerPage = (int)request.getAttribute("numPerPage");
   String pageBar = (String)request.getAttribute("pageBar");
 
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
h2{
	color: white;
}

section#memberList-container, #reportList-container {
   text-align: center;
}

section#memberList-container, #reportList-container{
   width: 100%;
   border: 1px solid gray;
   border-collapse: collapse;
}

table#tbl-member, #tbl-report {
   width: 100%;
   border: 1px solid gray;
   border-collapse: collapse;
}

table#tbl-member, #tbl-report th {
   border: 1px solid gray;
   padding: 1px;
   background : white;
}
table#tbl-member, #tbl-report td{
   border: 1px solid gray;
   padding: 1px;
   background : white;
}

/*검색*/
div#search-container {
   margin : 0 0 10px 0;
   padding : 3px;
   background-color: lightblue;
}

div#search-memberId {
   display : inline-block;
}

div#search-memberName, div#search-gender{
   display:none;
>>>>>>> 7510a0c2945e07763ace83a5b59f394f2871f68b
}

/*페이지바*/
div#pageBar {
<<<<<<< HEAD
	margin-top : 10px;
	text-align: center;
	background-color: rgba(0,188,212,0.3);
}
div#pageBar span.cPage{
	color:#06f;
	margin-right:10px;
}
div#pageBar a{
	margin-right: 10px;
}

</style>
<title>관리자용 게시판</title>
<section id="memberList-container">
<table id="tbl-member">
	<thead>
	<tr>
		<th>아이디</th>
		<th>이메일</th>
		<th>가입날짜</th>
	</tr>
	</thead>
	     <tbody>
   <%if(list == null || list.isEmpty()) { %>
            <tr>
         <td>
            회원이 없습니다.
         </td>
      </tr>
   <%}
      else {
         for(Member m : list){
   %>
      <tr>
         <td><%=m.getUserId() %></td>
         <td><%=m.getUserEmail() %></td>
         <td><%=m.getEnrollDate() %></td>
      </tr>
   <% }
      } %>
=======
   margin-top : 10px;
   text-align: center;
   background-color: rgba(0,188,212,0.3);
}
div#pageBar span.cPage{
   color:#06f;
   margin-right:10px;
}
div#pageBar a{
   margin-right: 10px;
}
</style>
<script>
</script>
<title>관리자용 게시판</title>
<h2>회원 목록</h2>
<section id="memberList-container">
<table id="tbl-member">
   <thead>
	   <tr>
    	  	<th>아이디</th>
      		<th>이메일</th>
      		<th>가입날짜</th>
	   </tr>
   </thead>
   <tbody>
	<%if(list == null || list.isEmpty()) { %>
	   		<tr>
			<td>
				회원이 없습니다. 데이터베이스 연동을 확인해주세요.
			</td>
		</tr>
	<%}
		else {
			for(Member m : list){
	%>
		<tr>
			<!-- 회원아이디 클릭시 adminMemberView로 이동 -->
			<td>
				<a href="<%=request.getContextPath()%>/admin/adminMemberView?UserId=<%=m.getUserId()%>">
				<%=m.getUserId() %>
				</a>
			</td>
			<td><%=m.getUserEmail() %></td>
			<td><%=m.getEnrollDate() %></td>
		</tr>
	<% }
		} %>
>>>>>>> 7510a0c2945e07763ace83a5b59f394f2871f68b
   </tbody>
</table>
<div id="pageBar"><%=pageBar %></div>
</section>
<<<<<<< HEAD

<section id="reportList-container">

</section>
=======
<hr />
<h2>신고된 게시글 & 댓글 목록</h2>
<section id="reportList-container">
	<table id="tbl-report">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>추천수</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>멍멍</td>
				<td>강아지</td>
				<td>19/01/01</td>
				<td>1</td>
				<td>6</td>
			</tr>
		</tbody>
	</table>
</section>
<!-- 아이디 클릭시 회원정보 상세내역(+사진파일) + 개인정보 수정/탈퇴 가능 -->
<!-- 신고받은 게시글&댓글 보이는 섹션 -->
<!-- 회원목록/신고글/신고댓글 보는 버튼/안 보는 버튼 -->
<!-- 버튼 클릭시 displayNone 사용해서 섹션 숨김 기능 -->
<!-- 추가기능: 새로운 신고 게시글/댓글 있을시 알림 뜨게 만들기 -->
<div id="pageBar"><%=pageBar %></div>
>>>>>>> 7510a0c2945e07763ace83a5b59f394f2871f68b
<%@ include file="/WEB-INF/views/common/footer.jsp"%>