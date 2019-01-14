<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	boolean isUsable = (boolean)request.getAttribute("isUsable");
	String userEmail = (String)request.getAttribute("userEmail");
	System.out.printf("[%s %s]\n", isUsable, userEmail);
	System.out.println("userEmail@checkEmailDuplicate.jsp=" + userEmail);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복검사</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/checkEmailDuplicate.css" />
<script>
function checkEmailDuplicate(){
	var userEmail = $("#userEmail").val(); // 유저 이메일
	var getUserEmail = RegExp(/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/); // 유저 이메일 유효성 검사
	
	if(userEmail == ""){
		alert("이메일을 입력해주세요.");
		return;
	}
	
	if(!getUserEmail.test(userEmail)){
		alert("이메일 형식에 맞게 입력해주세요.");
		return;
	}
	
	checkEmailDuplicateFrm.userEmail.value = userEmail;
	checkEmailDuplicateFrm.submit();
	
}

function setUserEmail(userEmail){
	// 부모창의 frm
	//*opener : 자식 창이 부모창으로 값을 전달해주겠다는것
	console.log("function setUserEmail(userEmail) 들어옴");
	var frm = opener.document.memberRegisterFrm;
	frm.userEmail.value = userEmail;
	frm.emailRegister.value = 1;
	
	// 현재 창을 제어
	self.close();
}
</script>
</head>
<body>
	<div id="checkEmail-Container">
	<%if(isUsable){ %>
		[<%=userEmail %>] 는 <br />사용가능합니다.
		<br /><br />
		<button type="button" class="myBtn" onclick="setUserEmail('<%=userEmail %>');">닫기</button>
	<%}
	else{%>
		[<span id="duplicated"><%=userEmail %></span>]는 <br />이미 사용중입니다.
		<form action="<%=request.getContextPath() %>/member/checkEmailDuplicate"
	 		  method="post"
	 		  id="checkEmailDuplicateFrm"
	  		  name="checkEmailDuplicateFrm">
		<input type="email" 
			   name="userEmail"
			   id="userEmail"
			   placeholder="이메일을 입력하세요." />
		<button type="button" class="myBtn" onclick="checkEmailDuplicate();">중복검사</button>
</form>
	<%} %>
	</div>
	
	
</body>
</html>
