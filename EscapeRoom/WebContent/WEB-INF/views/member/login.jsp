<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
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
<!-- 로그인 -->
<div class="login-container">
	<form action="<%=request.getContextPath()%>/member/loginEnd" method="post" id="loginFrm">
		<table>
			<tr>
				<td>
					<input type="text" 
						   name="userid" id="userid"
						   value="<%=userid %>" 
						   placeholder="아이디" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="password"
						   name="userpassword"
						   id="userpassword"
						   placeholder="비밀번호" />
				</td>
				<td>
					<input type="submit"
						   value="로그인"
						   onclick="return loginValidate();" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="checkbox"
						   name="saveId"
						   id="saveId"
						   <%=saveId?"checked":"" %> />
					<label for="saveId">
					아이디저장
					</label>
					&nbsp;&nbsp;
					<input type="button" 
						   value="회원가입"
						   onclick="location.href='<%=request.getContextPath() %>/member/memberRegister'" />
				</td>
			</tr>
		</table>
	</form>
</div>