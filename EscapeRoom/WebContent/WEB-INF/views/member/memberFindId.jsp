<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
<%
 	Member m = (Member) request.getAttribute("member");
	String userId = m.getUserId();
	String userEmail = m.getUserEmail();
	System.out.println("userId@memberFindId.jsp = " + userId);
	System.out.println("userEmail@memberFindId.jsp = " + userEmail);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/findId.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<script>
</script>
</head>
<body>
<section id="findId-Container">
	<h2>- FOUND ID -</h2>
	<form action="<%=request.getContextPath()%>/member/memberFindIdEnd" method="POST" 
		  name="findIdFrm">
		<table>
			<tr>
				<td id="foundId"><span><%=userEmail%></span> 회원님의 <br /><br />아이디는 <span><%=userId %></span> 입니다.</td>
			</tr>
		</table>
	</form>
</section>
</body>
</html>