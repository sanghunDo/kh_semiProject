<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	boolean isUsable = (boolean)request.getAttribute("isUsable");
	String userId = (String)request.getAttribute("userId");
	System.out.printf("[%s %s]\n", isUsable, userId);
	System.out.println("userId@checkIdDuplicate.jsp=" + userId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복검사</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<script>
function checkIdDuplicate(){
	var userId = $("#userId").val(); // 유저 아이디
	var getUserId = RegExp(/^[a-zA-Z]+[a-zA-Z0-9]{4,11}$/); // 유저 아이디 유효성 검사
	
	if(userId == ""){
		alert("아이디를 입력해주세요.");
		return;
	}
	
	if(!getUserId.test(userId)){
		alert("아이디는 영문자로 시작하고, 5~12자 영문자 또는 숫자를 입력해주세요.");
		return;
	}
	
	checkIdDuplicateFrm.userId.value = userId;
	checkIdDuplicateFrm.submit();
	
}

function setUserId(userId){
	// 부모창의 frm
	//*opener : 자식 창이 부모창으로 값을 전달해주겠다는것
	console.log("function setUserId(userId) 들어옴");
	var frm = opener.document.memberRegisterFrm;
	frm.userId.value = userId;
	frm.idRegister.value = 1;
	frm.userPassword.focus();
	
	// 현재 창을 제어
	self.close();
}
</script>
<style>
body{
	background:black;
}

#checkId-Container{
	text-align: center;
	padding-top: 30px;
	background:black;
	color:white;
	font-family:'Noto Serif KR', serif;
	font-weight:bold;
	font-size:20px;
}

span#duplicated{
	color: red;
	font-weight: bold;
}

.myBtn{
	width:100px;
	height:40px;
	background:#353535;
	color:white;
	font-family: 'Noto Serif KR', serif;
	font-size:18px;
	font-weight:bold;
	border:1px solid #353535;
	border-radius:10px;
	cursor:pointer;
}
</style>
</head>
<body>
	<div id="checkId-Container">
	<%if(isUsable){ %>
		[<%=userId %>] 는 사용가능합니다.
		<br /><br />
		<button type="button" class="myBtn" onclick="setUserId('<%=userId %>');">닫기</button>
	<%}
	else{%>
		[<span id="duplicated"><%=userId %></span>]는 이미 사용중입니다.
		<form action="<%=request.getContextPath() %>/member/checkIdDuplicate"
	 		  method="post"
	  		 name="checkIdDuplicateFrm">
		<input type="text" 
			   name="userId"
			   id="userId"
			   placeholder="아이디를 입력하세요." />
		<button type="button" class="myBtn" onclick="checkIdDuplicate();">중복검사</button>
</form>
	<%} %>
	</div>
	
	
</body>
</html>
