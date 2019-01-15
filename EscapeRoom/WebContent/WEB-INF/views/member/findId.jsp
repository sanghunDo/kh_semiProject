<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FIND ID</title>
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/findId.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<script>
</script>
</head>
<body>
<section id="findId-Container">
	<h2>- FIND ID -</h2>
	<form action="<%=request.getContextPath()%>/member/memberFindIdEnd" method="POST" 
		  name="findIdFrm">
		<table>
			<tr>
				<td><input type="email" name="userEmail" id="userEmail" placeholder="이메일을 입력하세요." required></td>
			</tr>
		</table>
		<input type="submit" id="findId-Btn" value="FIND"> 
	</form>
</section>
</body>
</html>