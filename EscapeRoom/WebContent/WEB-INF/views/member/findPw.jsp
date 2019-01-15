<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FIND PW</title>
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/findPw.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<script>
</script>
</head>
<body>
<section id="findPw-Container">
	<h2>- FIND PW -</h2>
	<form action="<%=request.getContextPath()%>/member/memberFindPwEnd" method="POST" 
		  name="findPwFrm">
		<table>
			<tr>
				<td><input type="text" name="userId" id="userId" placeholder="아이디를 입력하세요." required/></td>
			</tr>
			<tr>
				<td><input type="email" name="userEmail" id="userEmail" placeholder="이메일을 입력하세요." required></td>
			</tr>
		</table>
		<input type="submit" id="findPw-Btn" value="FIND"> 
	</form>
</section>
</body>
</html>
