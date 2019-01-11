<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="semi.admin.controller.*" %>
<%
	Member m = (Member) request.getAttribute("member");
	//header.jsp에서 userId 변수명을 이미 사용중이므로 살짝 변경
	String userId_ = m.getUserId(); 
	System.out.println("adminMemberView.jsp_userId_: " + userId_);
	String userPassword = m.getUserPassword();
	String userEmail = m.getUserEmail()!=null?m.getUserEmail():"";
	String userProfileOriginalFile = m.getUserProfileOriginalFile()!=null?m.getUserProfileOriginalFile():"";	
	String userProfileRenamedFile = m.getUserProfileRenamedFile()!=null?m.getUserProfileRenamedFile():request.getContextPath()+"images/nonProfile.png";
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/memberView.css" />
<style>
h2, h3{
	color: white;
}

img#Profile-Pre{
	width: 150px;
}
</style>
<script>
// 회원정보 수정하기
// adminMemberUpdate 서블릿
// 회원정보 수정 유효성 검사
function updateValidate(){
	// 아이디 검사
	var $userId_ = $("#userId_"); // 아이디
	
	// 아이디 공백 확인
	if($userId_.val() ==""){
		alert("아이디를 입력하세요.");
		$userId_.focus();
		return false;
	}
	
	// 아이디 유효성 검사
	if(!getUserId.test($userId_.val())){
		alert("아이디는 영문자와 숫자를 포함한 5~15 자리로 입력하세요.");
		$userId_.val("");
		$userId_.focus();
		return false;
	}
	
	// 아이디 중복 검사 여부 체크
	var $idValid = $("#idValid").val();
	if($idValid == 0){
		alert("아이디 중복 검사를 해주세요.");
		return false;
	}
	
	// 프로필 사진 검사
	var $userProfileOriginalFile = $("#userProfile"); // 프로필 사진명
	var fileExt = $userProfileOriginalFile.val().substring($userProfileOriginalFile.val().lastIndexOf(".") + 1); // 확장자명 구하기용
	var getUserProfileOriginalFile = RegExp(/jpg|jpeg|png|gif/i); // 프로필 사진 유효성 검사
	
	// 프로필 사진 유효성 검사
	if(!getUserProfileOriginalFile.test(fileExt) && $userProfileOriginalFile.val().length > 0){
		alert("첨부파일은 jpg, jpeg, png, gif로 된 이미지만 가능합니다.");
		return false;
	}
	
	// 비밀번호 검사
	var $userPassword_ = $("#userPassword_"); // 기존 비밀번호
	var $userPassword__ = $("#userPassword__"); // 비교할 새 비밀번호
	var getUserPassword = RegExp(/^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[#?!@$%^&*-]).{5,19}$/); // 비밀번호 유효성 검사
	
	// 이메일 검사 
	var $userEmail = $("#userEmail"); // 이메일
	var getUserEmail = RegExp(/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/); // 이메일 유효성 검사
	
	// 이메일 공백 확인
	if($userEmail.val() == ""){
		alert("이메일을 입력하세요.");
		$userEmail.focus();
		return false;
	}
	
	// 이메일 유효성 검사
	if(!getUserEmail.test($userEmail.val())){
		alert("이메일 형식에 맞게 입력하세요.");
		$userEmail.val("");
		$userEmail.focus();
		return false;
	}
	
	return true;
	
}

// 프로필 사진 변경하기 눌렀을 때
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

// 비밀번호 수정하기
// adminPwdUpdate 서블릿
// 비밀번호 수정 버튼 클릭시 팝업이 뜸
function updatePwd(){
	var url = "<%=request.getContextPath() %>/admin/adminPwdUpdate?userId=<%=userId_%>";
	
	// 팝업창 이름
	var title = "updatePassword";
	var status = "left=500px, top=200px, width=400px, height=400px";
	open(url, title, status);
}

// 회원 삭제하기
// adminMemberDelete 서블릿
function deleteMember(){
	var bool = confirm("정말로 탈퇴하시겠습니까?");
	if(bool){
		var form = document.adminMemberUpdateFrm;
		form.action = "<%=request.getContextPath()%>/admin/adminMemberDelete";
		form.submit();
	}
}
</script>
<h3>회원 정보 상세 보기</h3>
<!-- 회원 한 명 정보 상세 보기 및 수정 -->
<section id="admin-memberView-container">
<form action="<%=request.getContextPath()%>/admin/adminMemberUpdate"
	  method="post"
	  name="adminMemberUpdateFrm"
	  onsubmit="return updateValidate();"
	  enctype="multipart/form-data"> 
	<table id="tbl-memberView">
			<tr>
				<th>아이디</th>
					<td>
						<input type="text" 
		  				   name="userId" 
		  				   id="userId_"
		  				   value="<%=userId_%>"
		  				   required />
					</td>
				</tr>
			<tr>
				<th>프로필 사진</th>
					<td>						
						<div id="userProfile-Div">
						<input type="file" name="userProfile" id="userProfile" accept="image/jpg, image/jpeg, image/png, image/gif">
						
						<!-- 프로필 사진 변경시 삭제 -->
						<input type="hidden" name="oldUserRenamedProfile" value="<%=userProfileRenamedFile%>" />
						<input type="hidden" name="oldUserOriginalProfile" value="<%=userProfileOriginalFile%>" />
						
						<!-- 실제 파일이 있는 경우에만 보여주기 -->
						<%if(m.getUserProfileRenamedFile() != null) { %>
						<br /><br />
						<input type="checkbox" name="delProfile" id="delProfile" />
						<label for="del_Profile">프로필 사진 삭제</label>
						<br /><br />
						<div id="profile-Container">
							<img id="profilePre" src="<%=request.getContextPath() %>/upload/member/<%=userProfileRenamedFile %>"/>
						</div>
						<%} // end of if : 사진 있는 경우
						else {%>
						<br /><br />
						<div id="profile-Container">
						   <img id="profilePre" src="<%=userProfileRenamedFile%>">
						</div>
						<%} // end of else : 사진 없는 경우 기본 사진 보여주기 %>
						</div>
					</td>
			</tr>
			<tr>
				<th>비밀번호</th>
					<td>
						<%=m.getUserPassword() %>
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
				<th>가입한 날짜</th>
					<td>
						<%=m.getEnrollDate() %>
					</td>
			</tr>
		</table>
<input type="submit" id="userInfoEdit" value="회원정보 수정"/>
<input type="button" id="userPwdEdit" onclick="updatePwd();" value="비밀번호 수정"/>
<input type="button" id="deleteMember" onclick="deleteMember();" value="회원 삭제"/>
</form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>