<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	System.out.println("userId@adminPwdUpdate.jsp=" + userId);
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 회원 비밀번호 변경</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
<style>
div#update-Pwd-container {
	background: black;
	color: white;
}

div#update-Pwd-container table{
	margin: 0 auto;
	border-spacing: 20px;
}

div#update-Pwd-Container table tr:last-of-type td{
	text-align: center;
}
</style>
<script>
function pwdValidate(){
	var $userId = $("#userId");
	var $userPwd = $("#userPwd");
	
	var $userPwd_New = $("#userPwd_New"); // 새 비밀번호
	var $userPwd_Check = $("#userPwd_Check"); // 비교할 비밀번호
	
	// 비밀번호 유효성 검사
	var getUserPwd = RegExp(/^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[#?!@$%^&*-]).{5,19}$/);

	// 비밀번호 유효성 검사
	if (!getUserPwd.test($userPwd_New.val())) {
		alert("비밀번호는 영문자와 숫자, 특수 문자를 포함한 \n6~20 자리로 입력해주세요.\n특수문자는 '#?!@$%^&*-_'만 가능합니다.");
		$userPwd_New.val("");
		$userPwd_New.focus();
		return false;
	}
	
	// 아이디와 비밀번호가 같은지 확인
	if ($userId.val() == $userPwd_New.val()) {
		alert("아이디와 비밀번호가 같습니다. 아이디와 비밀번호는 달라야 합니다.");
		$userPwd_New.val("");
		$userPwd_New.focus();
		return false;
	}
	
	// 비밀번호 공백 확인
	if ($userPwd_New.val() == "") {
		alert("비밀번호를 입력하세요.");
		$userPwd_New.focus();
		return false;
	}
	
	// 비밀번호 확인란 공백 확인
	if ($userPwd_Check.val() == "") {
		alert("비밀번호 확인란에 입력하세요.");
		$userPwd_Check.focus();
		return false;
	}
	
	// 비밀번호 일치 여부 확인
	if ($userPwd_New.val() != $userPwd_Check.val()) {
		alert("비밀번호가 다릅니다. 다시 입력해주세요.");
		$userPwd_New.val("");
		$userPwd_Check.val("");
		$userPwd_New.focus();
		return false;
	}
	
	// 현재 비밀번호와 일치여부 확인
	if ($userPwd.val() == $userPwd_New.val()){
		alert("현재 비밀번호와 같습니다. 다른 비밀번호를 입력하세요.");
		$userPwd_New.val("");
		$userPwd_Check.val("");
		$userPwd_New.focus();
		return false;
	}
	
	return true;
}
</script>
</head>
<body>
<div id="update-Pwd-container">
	<form action="<%=request.getContextPath()%>/admin/adminPwdUpdate"
		  name="adminPwdUpdateFrm"
	 	 method="post">
	  	<input type="hidden" name="userId" id="userId"
	  			 value="<%=userId%>"/>
	<table>
			<tr>
				<th>
					현재 비밀번호
				</th>
				<td>
					<input type="password" 
					  	   name="current_pwd"
					  	   id="current_pwd"
				  		   required />
				</td>
			</tr>
			<tr>
				<th>
					새 비밀번호
				</th>
				<td>
					<input type="password" 
						   name="new_pwd"
						   id="new_pwd"
						   required />
				</td>
			</tr>
			<tr>
				<th>
					새 비밀번호 확인
				</th>
				<td>
					<input type="password" 
						   name="new_pwd"
						   id="new_pwd_check"
						   required />
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" 
						   onclick="return pwdValidate();"
						   value="변경하기"/>
					<input type="button" 
						   onclick="self.close();"
						   value="취소하기"/>
				</td>
			</tr>
	</table>
	</form>
</div>
</body>
</html>