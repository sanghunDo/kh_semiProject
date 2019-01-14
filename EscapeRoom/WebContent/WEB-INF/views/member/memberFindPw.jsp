<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
 	Member m = (Member) request.getAttribute("member");
	String userId = m.getUserId();
	String userEmail = m.getUserEmail();
	System.out.println("userId@memberFindPw.jsp = " + userId);
	System.out.println("userEmail@memberFindPw.jsp = " + userEmail);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/findPw.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<script>
</script>
</head>
<body>
<section id="sendPw-Container">
	<h2>- SEND PW -</h2>
	<form action="<%=request.getContextPath()%>/member/memberFindPwEnd" method="POST" 
		  name="findPwFrm">
		<table>
			<tr>
				<td id="SendPw"><span><%=userId%></span> 회원님의 이메일로 <br /><br />임시 비밀번호를 발송하였습니다.</td>
			</tr>
		</table>
	</form>
</section>
</body>
</html>