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
<style>
div#updatePassword-Container{
	background: red;
}

div#updatePassword-Container table{
	margin: 0 auto;
	border-spacing: 20px;
}

div#updatePassword-Container table tr:last-of-type td{
	text-align: center;
}
</style>
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
			  				   name="UserPassword_New" 
			  				   id="UserPassword_New"
			  				   required />
			  		</td>
			  	</tr>
			  	<tr>
			  		<th>새 비밀번호 확인</th>
			  		<td>
			  			<input type="password" 
			  				   name="UserPassword_Check"
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