<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//전송된 쿠키확인
	boolean saveId = false;
	String userid = "";
	Cookie[] cookies = request.getCookies(); // 배열 타입을 리턴한다.
	// System.out.println("브라우저가 전송한 쿠키목록@header.jsp");
	// System.out.println("-------------------------------------");
	for(Cookie c : cookies){
		String key = c.getName();
		String value = c.getValue();
	// System.out.printf("%s = %s\n", key, value);
		if("saveId".equals(key)){
			saveId = true;
			userid = value;
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>You Can't Escape..</title>
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<script>
function loginValidate(){
	if($("#userid").val().trim().length == 0){
		alert("아이디를 입력하세요.");
		$("#userid").focus();
		return false; // 폼 전송 방지
	}
	if($("#userpassword").val().trim().length == 0){
		alert("비밀번호를 입력하세요.");
		$("#userpassword").focus();
		return false; // 폼 전송 방지
	}
		return true;
}
</script>
<style>
body{
	background:black;
	color:white;
}

.login-container{
	width:350px;
	height:270px;
	border:1px solid #5D5D5D;
	border-radius:20px;
	margin: 0 auto;
}

#userId, #userPassword{
	width:250px;
	height:20px;
	background:black;
	color:white;
	outline:none;
	border-style:none;
	border-bottom:1px solid gray;
}

table{
	font-size:15px;
	margin:0 auto;
	padding-top:35px;
}

table td{
	padding:5px 10px 5px 10px;
}

#submit-Btn{
	outline:none;
	background:beige;
	border:1px solid beige;
	border-radius:10px;
	width:250px;
	height:35px;
	font-size:15px;
	color:gray;
	cursor:pointer;
}

#register-Btn{
	outline:none;
	background: gray;
	border:1px solid gray;
	border-radius:10px;
	color:white;
	width:250px;
	height:35px;
	font-size:15px;
	cursor:pointer;
}

#saveId{
	position:relative;
	float:right;
	top:.5px;
	padding:0;
}

#label-saveId{
	font-size:13px;
	float:right;
}

div#logo{
	width: 500px;
	margin: 0 auto;
	color: white;
	font-size: 70px;
	font-family: 'Amatic SC', serif;
	text-shadow: 4px 4px 2px gray;
	letter-spacing: 4px;
	padding-top: 50px;
	padding-left: 80px;
	padding-bottom: 50px;
}
</style>
</head>
<body>
<!-- 로그인 -->
<div id="logo">Escape, if you can.</div>
<div class="login-container">
	<form action="<%=request.getContextPath()%>/member/login" method="post" id="loginFrm">
		<table>
			<tr><td><input type="text" name="userId" id="userId"
				value="<%=userid %>" placeholder="아이디를 입력하세요." /></td></tr>
			<tr><td><input type="password" name="userPassword" id="userPassword"
				placeholder="비밀번호를 입력하세요." /></td></tr>
			<tr><td><input type="checkbox" name="saveId" id="saveId" <%=saveId?"checked":"" %> />
				<label for="saveId" id="label-saveId">SAVE ID</label></td></tr>			
			<tr><td><input type="submit" value="LOGIN" 
				id="submit-Btn" onclick="return loginValidate();" /></td></tr>
			<tr><td><input type="button" value="JOIN US"
				id="register-Btn" onclick="location.href='<%=request.getContextPath() %>/member/memberRegister'" /></td></tr>
		</table>
	</form>
</div>
</body>
</html>