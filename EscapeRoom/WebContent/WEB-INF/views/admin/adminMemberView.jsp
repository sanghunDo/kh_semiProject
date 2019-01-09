<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="semi.admin.controller.*" %>
<%@ page import="semi.member.model.vo.Member" %>
<%
	Member m = (Member) request.getAttribute("member");
	//header.jsp의 userId 변수명 충돌 방지용
	String userId_1 = m.getUserId();
	String userPassword = m.getUserPassword();
	String userEmail = m.getUserEmail()!=null?m.getUserEmail():"";
	String userProfileOriginalFile = m.getUserProfileOriginalFile()!=null?m.getUserProfileOriginalFile():"";	
	String userProfileRenamedFile = m.getUserProfileRenamedFile()!=null?m.getUserProfileRenamedFile():""; 
	Date enrollDate = m.getEnrollDate();
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardCommunityTable.css " />
<style>
th, td{
	text-align: left;
}
img#null-Profile{
	width: 150px;
}
</style>
<script>
//회원 정보 수정 유효성 검사
function updateValidate(){
// 프로필 사진명 변수
var $userProfileOrigianlFile = $("#userProfile");
var fileText = $userProfileOriginalFile.val().subString($userProfileOriginalFile.val().lastIndexOf(".") + 1);
var getUserProfileOriginalFile = RegExp(/jpg|jpeg|png|gif/i);

// 비밀번호 변수
var $userPassword_1 = $("#userPassword_1"); // 기존 비밀번호
var $userPassword_2 = $("#userPassword_2"); // 비교할 비밀번호
var getUserPassword = RegExp(/^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[#?!@$%^&*-]).{5,19}$/);

// 이메일 변수
var $userEmail = $("#userEamil")
var getUserEmail = RegExp(/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/);

// 공백 확인
//비밀번호
if($userPwd.val() == "") {
	alert("비밀번호를 입력해주세요.");
	$userPwd.focus();
	return false;
}

// 이메일
if($userEmail.val() == "") {
	alert("이메일을 입력해주세요.");
	$userEmail.focus();
	return false;
}

// 유효성 검사
// 프로필 사진
if(!getUserProfileOriginalFile.test(fileExt) && $userProfileOriginalFile.val().length > 0){
	alert("첨부 파일은 jpg, jpeg, png, gif로 된 이미지만 가능합니다.");
	return false;
}
	
// 비밀번호
if(!getUserPwd.test($userPwd.val())){
	alert("비밀번호는 영문 대소문자, 숫자가 들어가고 5~19자리여야 합니다.");
	$userPwd.val("");
	$userPwd.focus();
	return false;
}

// 이메일
if(!getUserEmail.test($userEmail.val())){
	alert("이메일 형식에 맞게 입력해주세요.");
	$userEmail.val("");
	$userEmail.focus();
	return false;
}

return true;
}

// 프로필 사진 변경
function changeProfile(){
	var bool = confirm("프로필 이미지를 변경하시겠습니까?");
	
	if(bool) {
		
	}
};

// 비밀번호 변경
function changePwd(){
	var bool = confirm("회원의 비밀번호를 변경하시겠습니까?");
	

};

// 회원 삭제 기능
function deleteMember(){
	var bool = confirm("정말로 이 회원을 삭제하시겠습니까?");
	
	if(bool) {
		var form = document.memberDeleteFrm;
		form.action = "<%=request.getContextPath()%>/admin/adminMemberDelete"
		form.submint()
	}
	
};

</script>
<h2>관리자 전용 게시판</h2>
<h3>회원 정보 상세 보기</h3>
<!-- 회원 한 명 정보 상세 보기 -->
<form action="<%=request.getContextPath()%>/admin/AdminMemberView"
	  method="post"
	  name="adminMemberViewFrm"
	  onsubmit="return updateValidate();">
<table id="tbl-memberView">
	<tr>
		<th>아이디</th>
		<td><input type="text"
				   name="userId"
				   id="userId_"
				   value="<%=m.getUserId() %>"
				   required
				   readonly/>
		</td>
	</tr>
	<tr>
		<th>프로필 사진</th>
		<td><input type="file"
				   name="userProfile"
				   id="userProfile">
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
		<th>비밀번호</th>
		<td><input type="password" 
				   name="userPwd"
				   id="userPwd"
				   value="<%=m.getUserPassword() %>"
				   required/>
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="email" 
				   name="userEmail"
				   id="userEmail"
				   value="<%=m.getUserEmail() %>"
				   required/>
		</td>
	</tr>
	<tr>
		<th>가입한 날짜</th>
		<td><input type="text"
				   name="enrollDate"
				   id="enrollDate"
				   value="<%=m.getEnrollDate() %>"
				   required
				   readonly/></td>
	</tr>
</table>
</form>
<div id="user-update">
	<label for="userUpdate">회원정보 수정</label>
	<input type="submit" id="userUpdate" value="회원정보 수정"/>
</div>
<div id="profile-img-edit">
	<label for="userProfileEdit">프로필 사진 수정</label>
	<input type="button" id="userProfileEdit" onclick="changeProfile();" value="프로필 사진 수정"/>
</div>
<div id="user-pwd-edit">
	<label for="usesrPwdEdit">비밀번호 수정</label>
	<input type="button" id="userPwdEdit" onclick="changePwd();" value="비밀번호 수정"/>
</div>
<div id="user-delete">
	<label for="deleteMember">회원 삭제하기</label>
	<input type="button" id="deleteMember" onclick="deleteMember();" value="회원 삭제"/>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>