<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//전송된 쿠키확인
	boolean saveId = false;
	String userId = "";
	Cookie[] cookies = request.getCookies(); // 배열 타입을 리턴한다.
	// System.out.println("브라우저가 전송한 쿠키목록@header.jsp");
	// System.out.println("-------------------------------------");
	for(Cookie c : cookies){
		String key = c.getName();
		String value = c.getValue();
	// System.out.printf("%s = %s\n", key, value);
		if("saveId".equals(key)){
			saveId = true;
			userId = value;
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>You Can't Escape..</title>
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/login.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<script>
function loginValidate(){
	if($("#userId").val().trim().length == 0){
		alert("아이디를 입력하세요.");
		$("#userId").focus();
		return false; // 폼 전송 방지
	}
	if($("#userPassword").val().trim().length == 0){
		alert("비밀번호를 입력하세요.");
		$("#userPassword").focus();
		return false; // 폼 전송 방지
	}
		return true;
}
</script>

</head>
<body>
<!-- 로그인 -->
<div id="logo">Escape, if you can.</div>
<div class="login-Container">
	<form action="<%=request.getContextPath()%>/member/loginEnd" method="post" id="loginFrm">
		<table>
			<tr><td><input type="text" name="userId" id="userId"
				value="<%=userId %>" placeholder="아이디를 입력하세요." /></td></tr>
			<tr><td><input type="password" name="userPassword" id="userPassword"
				placeholder="비밀번호를 입력하세요." /></td></tr>
			<tr><td><input type="checkbox" name="saveId" id="saveId" <%=saveId?"checked":"" %> />
				<label for="saveId" id="label-saveId">SAVE ID</label></td></tr>			
			<tr><td><input type="submit" value="LOGIN" 
				id="submit-Btn" onclick="return loginValidate();" /></td></tr>
			<tr><td><input type="button" value="JOIN US"
				id="register-Btn" onclick="location.href='<%=request.getContextPath() %>/member/memberRegister'" /></td></tr>
			<tr><td><input type="button" value="FIND ID" 
				id="findId-Btn" onclick="location.href='<%=request.getContextPath() %>/member/findId'"/></td></tr>
		</table>
	</form>
</div>
</body>
</html>