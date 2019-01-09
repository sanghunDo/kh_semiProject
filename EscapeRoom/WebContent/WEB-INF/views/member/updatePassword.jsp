<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	System.out.println("userId@updatePassword.jsp=" + userId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 비밀번호 변경</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
<style>
div#updatePassword-Container{
	background: black;
	color: white;
}

div#updatePassword-Container table{
	margin: 0 auto;
	border-spacing: 20px;
}

div#updatePassword-Container table tr:last-of-type td{
	text-align: center;
}
</style>
<script>
	function passwordValidate() {
		var $userId = $("#userId");
		console.log("유저아이디양ㄻ;ㅐㅇ런ㅇㅁㄹ0", $userId.val());
	
		var $userPassword = $("#userPassword");
		console.log("유저패스워드양ㄻ;ㅐㅇ런ㅇㅁㄹ0", $("#userPassword").val());
		
		var $userPassword_New = $("#userPassword_New"); // 유저 비밀번호
		console.log("유저새로운패스워드양ㄻ;ㅐㅇ런ㅇㅁㄹ0", $userPassword_New.val());
		var $userPassword_Check = $("#userPassword_Check"); // 비교할 유저 비밀번호
		var getUserPassword = RegExp(/^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[#?!@$%^&*-]).{5,19}$/); // 유저 비밀번호 유효성 검사

		// 비밀번호 공백 확인
		if ($userPassword_New.val() == "") {
			alert("비밀번호를 입력해주세요.");
			$userPassword_New.focus();
			return false;
		}

		// 아이디와 비밀번호 같은지 확인
		if ($userId.val() == $userPassword_New.val()) {
			alert("아이디와 비밀번호가 같습니다.");
			$userPassword_New.val("");
			$userPassword_New.focus();
			return false;
		}

		// 비밀번호 유효성 검사
		if (!getUserPassword.test($userPassword_New.val())) {
			alert("비밀번호는 영문자와 숫자, 특수 문자를 포함한 6~20 자리로 입력해주세요.");
			$userPassword_New.val("");
			$userPassword_New.focus();
			return false;
		}

		// 비밀번호 확인란 공백 확인
		if ($userPassword_Check.val() == "") {
			alert("비밀번호 확인란을 입력해주세요.");
			$userPassword_Check.focus();
			return false;
		}

		// 비밀번호 일치여부 확인
		if ($userPassword_New.val() != $userPassword_Check.val()) {
			alert("비밀번호가 다릅니다.");
			$userPassword_New.val("");
			$userPassword_Check.val("");
			$userPassword_New.focus();
			return false;
		}
		
		// 현재 비밀번호와 일치여부 확인
		if ($userPassword.val() == $userPassword_New.val()){
			alert("현재 비밀번호와 같습니다.");
			$userPassword_New.val("");
			$userPassword_Check.val("");
			$userPassword_New.focus();
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
	<div id="updatePassword-Container">
		<form action="<%=request.getContextPath() %>/member/updatePasswordEnd"
			  name="updatePasswordFrm"
			  method="POST">
			  <input type="hidden" 
			  		 name="userId" 
			  		 id="userId"
			  		 value="<%=userId%>" />
			  <table>
			  	<tr>
			  		<th>현재비밀번호</th>
			  		<td>
			  			<input type="password" 
			  			       name="userPassword" 
			  			       id="userPassword"
			  			       required />
			  		</td>
			  	</tr>
			  	<tr>
			  		<th>새 비밀번호</th>
			  		<td>
			  			<input type="password" 
			  				   name="userPassword_New" 
			  				   id="userPassword_New"
			  				   required />
			  		</td>
			  	</tr>
			  	<tr>
			  		<th>새 비밀번호 확인</th>
			  		<td>
			  			<input type="password" 
			  				   name="userPassword_Check"
			  				   id="userPassword_Check"
			  				   required />
			  		</td>
			  	</tr>
			  	<tr>
			  		<td colspan="2">
			  			<input type="submit"
			  				   onclick="return passwordValidate();"
			  				   value="변경"	/>
			  			<input type="button"
			  				   onclick="self.close();"
			  				   value="취소"	/>
			  		</td>			  		
			  	</tr>
			  </table>
		
		</form>
	</div>
</body>
</html>