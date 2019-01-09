<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
}

/*페이지바*/
div#pageBar {
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
   </tbody>
</table>
<div id="pageBar"><%=pageBar %></div>
</section>

<section id="reportList-container">

</section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>