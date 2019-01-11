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

table a:link {
	color: blue;
}
table a:visited {
	color: purple;
}
table a:hover {
	color: red;
}

section#memberList-container, #reportArtcList-container, #reportCmtList-container {
   text-align: center;
}

section#memberList-container, #reportArtcList-container, #reportCmtList-container{
   width: 100%;
   border: 1px solid gray;
   border-collapse: collapse;
}

table#tbl-member, #tbl-report-artc, #tbl-report-cmt {
   width: 100%;
   border: 1px solid gray;
   border-collapse: collapse;
}

table#tbl-member, #tbl-report-artc, #tbl-report-cmt th {
   border: 1px solid gray;
   padding: 1px;
   background : white;
}
table#tbl-member, #tbl-report-artc, #tbl-report-cmt td{
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
				불러올 회원 목록이 없습니다. 개발자에게 문의하세요.
			</td>
		</tr>
	<%}
		else {
			for(Member m : list){
	%>
		<tr>
			<td>
				<a href="<%=request.getContextPath()%>/admin/adminMemberView?userId=<%=m.getUserId()%>">
				<%=m.getUserId()%>
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
<h2>신고된 게시글 목록</h2>
<section id="reportArtcList-container">
	<table id="tbl-report-artc">
		<thead>
			<tr>
				<th>카테고리</th>
				<th>글번호</th>
				<th>게시글제목</th>
				<th>게시글작성자</th>
				<th>날짜</th>
				<th>신고사유</th>
				<th>신고내용</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>F(자유)</td>
				<td>1</td>
				<td>멍멍</td>
				<td>강아지</td>
				<td>19/01/01</td>
				<td>개털 알레르기</td>
				<td>으악</td>
			</tr>
			<tr>
				<td>S(공략)</td>
				<td>3</td>
				<td>야옹</td>
				<td>고양이</td>
				<td>19/01/03</td>
				<td>고양이털 알레르기</td>
				<td>꺄악</td>
			</tr>
		</tbody>
	</table>
</section>
<div id="pageBar"><%=pageBar %></div>
<h2>신고된 댓글 목록</h2>
<section id="reportCmtList-container">
	<table id="tbl-report-cmt">
		<thead>
			<tr>
				<th>카테고리</th>
				<th>게시글번호</th>
				<th>댓글번호</th>
				<th>댓글내용</th>
				<th>댓글작성자</th>
				<th>신고사유</th>
				<th>신고내용</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>F(자유)</td>
				<td>2</td>
				<td>3</td>
				<td>멍멍멍멍</td>
				<td>강아지</td>
				<td>개털 알레르기</td>
				<td>으악</td>
			</tr>
			<tr>
				<td>S(공략)</td>
				<td>3</td>
				<td>6</td>
				<td>야옹야옹</td>
				<td>고양이</td>
				<td>고양이털 알레르기</td>
				<td>꺄악</td>
			</tr>
			<tr>
				<td>R(랭킹)</td>
				<td>0</td>
				<td>7</td>
				<td>짹짹짹짹</td>
				<td>참새</td>
				<td>참새깃털 알레르기</td>
				<td>끼엑</td>
			</tr>
		</tbody>
	</table>
</section>
<div id="pageBar"><%=pageBar %></div>
>>>>>>> 7510a0c2945e07763ace83a5b59f394f2871f68b
<%@ include file="/WEB-INF/views/common/footer.jsp"%>