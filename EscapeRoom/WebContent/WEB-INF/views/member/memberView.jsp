<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
	/* return타입이 Object이기때문에 형변환 필수 */
	Member m = (Member) request.getAttribute("member");
	String userId_ = m.getUserId(); // header.jsp에서 memberId 변수명을 이미 사용중이므로 _ 추가
	String userPassword = m.getUserPassword();
	String userEmail = m.getUserEmail()!=null?m.getUserEmail():"";
	String userProfileOriginalFile = m.getUserProfileOriginalFile()!=null?m.getUserProfileOriginalFile():"";	
	String userProfileRenamedFile = m.getUserProfileRenamedFile()!=null?m.getUserProfileRenamedFile():"";
%>
<style>
th{
	text-align: left;
}

img#null-Profile{
	width: 150px;
}
</style>
<script>
function deleteMember(){
	var bool = confirm("정말로 탈퇴하시겠습니까?");
	if(bool){
		var frm = document.memberUpdateFrm;
		frm.action = "<%=request.getContextPath()%>/member/memberDelete";
		frm.submit();
	}
	
}

// 비밀번호 변경 팝업 요청
function updatePassword(){
	var url = "<%=request.getContextPath() %>/member/updatePassword?userId=<%=userId_%>";
	// 팝업창 이름
	var title = "updatePassword";
	var status = "left=500px, top=200px, width=400px, height=210px";
	
	open(url, title, status);
}

// 프로필 사진 변경
$(function(){
    $("#userProfile").on('change', function(){
        readURL(this);
    });
});

function readURL(input){
   if(input.files && input.files[0]){
       var reader = new FileReader();

       reader.onload = function(e){
           $('#profilePre').attr('src', e.target.result);
       }

       reader.readAsDataURL(input.files[0]);
   }
}
</script>
<section id="enroll-Container">
	<h2>회원 정보 보기</h2>
	<form action="<%=request.getContextPath() %>/member/memberUpdateEnd" 
		  method="post"
		  name="memberUpdateFrm"
		  onsubmit="return updateValidate();">
		  <table>
		  	<tr>
		  		<th>아이디</th>
		  		<td>
		  			<input type="text" 
		  				   name="userId" 
		  				   id="userId_"
		  				   value="<%=userId_%>"
		  				   required
		  				   readonly />
		  		</td>
		  	</tr>
		  	<tr>
		  		<th>이메일</th>
		  		<td>
		  			<input type="email" 
		  				   name="userEmail" 
		  				   id="userEmail"
		  				   value="<%=userEmail %>" />
		  		</td>
		  	</tr>
			<tr>
				<th>프로필 사진</th>
					<td>
						<input type="file" name="userProfile" id="userProfile">
						<%if(m.getUserProfileOriginalFile() != null) { %>
						<img src="<%=request.getContextPath() %>/upload/member/<%=userProfileRenamedFile %>"/>
						<%}
						else {%>
						   <img width="512" alt="Antu im-user-offline" id="null-Profile" 
						   		src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Antu_im-user-offline.svg/512px-Antu_im-user-offline.svg.png">
						<%} %>
					</td>
				</tr>
			<tr>
				<td colspan="6" id="profile_Td">
					<img src="" alt="" id="profilePre">
				</td>
			</tr>
		</table>
		  <input type="submit" value="회원정보 수정" />
		  <input type="button" value="비밀번호 수정"
		  		 onclick="updatePassword();" />
		  <input type="button" value="탈퇴" onclick="deleteMember();" />
	</form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>