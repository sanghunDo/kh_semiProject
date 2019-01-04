<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	boolean isUsable = (boolean)request.getAttribute("isUsable");
	String userid = (String)request.getAttribute("userid");
	System.out.printf("[%s %s]\n", isUsable, userid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복검사</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.3.1.js"></script>
<script>
function checkIdDuplicate(){
	var userid = $("#userid"); // 유저 아이디
	var getuserid = RegExp(/^[a-zA-Z0-9]{4,20}$/); // 유저 아이디 유효성 검사
	if(userid.val() == ""){
		alert("아이디를 입력해주세요.");
		return;
	}
	
	if(!getuserid.test(userid.val())){
		alert("아이디는 영문자나 숫자를 포함한 5~21 자리로 입력해주세요.");
		return;
	}
	
	checkIdDuplicateFrm.userid.value = userid;
	checkIdDuplicateFrm.submit();
	
}

function setUserId(userid){
	// 부모창의 frm
	//*opener : 자식 창이 부모창으로 값을 전달해주겠다는것
	console.log("function setUserId(userid) 들어옴");
	var frm = opener.document.memberRegisterFrm;
	frm.userid.value = userid;
	frm.idRegister.value = 1;
	frm.userpassword.focus();
	
	// 현재 창을 제어
	self.close();
}
</script>
<style>
#checkid-container{
	text-align: center;
	padding-top: 50px;
}

span#duplicated{
	color: red;
	font-weight: bold;
}

</style>
</head>
<body>
	<div id="checkid-container">
	<%if(isUsable){ %>
		[<%=userid %>]는 사용가능합니다.
		<br /><br />
		<button type="button" onclick="setUserId('<%=userid %>');">닫기</button>
	<%}
	else{%>
		[<span id="duplicated"><%=userid %></span>]는 이미 사용중입니다.
		<form action="<%=request.getContextPath() %>/member/checkIdDuplicate"
	 		  method="post"
	  		 name="checkIdDuplicateFrm">
		<input type="text" 
			   name="userid"
			   id="userid"
			   placeholder="아이디를 입력하세요." />
		<button type="button" onclick="checkIdDuplicate();">중복검사</button>
</form>
	<%} %>
	</div>
	
	
</body>
</html>
