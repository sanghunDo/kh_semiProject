<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>You Can't Escape..</title>
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/register.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<script>
/* 회원가입 유효성 검사 */
function registerValidate(){
	
	// 아이디 검사
	var $userId_ = $("#userId_"); // 유저 아이디
	var getUserId = RegExp(/^[a-zA-Z]+[a-zA-Z0-9]{4,11}$/); // 유저 아이디 유효성 검사
	
	// 비밀번호 검사
	var $userPassword_ = $("#userPassword_"); // 유저 비밀번호
	var $userPassword__ = $("#userPassword__"); // 비교할 유저 비밀번호
	var getUserPassword = RegExp(/^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[#?!@$%^&*-]).{5,19}$/); // 유저 비밀번호 유효성 검사

	// 이메일 검사 
	var $userEmail = $("#userEmail"); // 유저 이메일
	var getUserEmail = RegExp(/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/); // 유저 이메일 유효성 검사
	
	// 프로필 검사
	var $userProfileOriginalFile = $("#userProfile"); // 유저 프로필 사진명
	var fileExt = $userProfileOriginalFile.val().substring($userProfileOriginalFile.val().lastIndexOf(".") + 1); // 확장자명 구하기 위함
	var getUserProfileOriginalFile = RegExp(/jpg|jpeg|png|gif/i); // 유저 프로필 사진 유효성 검사

	
	// 아이디 공백 확인
	if($userId_.val() ==""){
		alert("아이디를 입력해주세요.");
		$userId_.focus();
		return false;
	}
	
	// 아이디 유효성 검사
	if(!getUserId.test($userId_.val())){
		alert("아이디는 영문자로 시작하고, 5~12자 영문자 또는 숫자를 입력해주세요.");
		$userId_.val("");
		$userId_.focus();
		return false;
	}
	
	// 아이디중복검사여부 체크
	var $idValid = $("#idValid").val();
	if($idValid == 0){
		alert("아이디 중복검사해주세요.");
		return false;
	}
	
	// 비밀번호 공백 확인
	if($userPassword_.val() == ""){
		alert("비밀번호를 입력해주세요.");
		$userPassword_.focus();
		return false;
	}
	
	// 아이디와 비밀번호 같은지 확인
	if($userId_.val() == $userPassword_.val()){
		alert("아이디와 비밀번호가 같습니다.");
		$userPassword_.val("");
		$userPassword_.focus();
		return false;
	}
	
	// 비밀번호 유효성 검사
	if(!getUserPassword.test($userPassword_.val())){
		alert("비밀번호는 영문자와 숫자, 특수 문자를 포함한 \n6~20 자리로 입력해주세요.\n특수문자는 '#?!@$%^&*-_'만 가능합니다.");
		$userPassword_.val("");
		$userPassword_.focus();
		return false;
	}
	
	// 비밀번호 확인란 공백 확인
	if($userPassword_.val() == ""){
		alert("비밀번호 확인란을 입력해주세요.");
		$userPassword_.focus();
		return false;
	}
	
	// 비밀번호 일치여부 확인
	if($userPassword_.val() != $userPassword__.val()){
		alert("비밀번호가 다릅니다.");
		$userPassword_.val("");
		$userPassword__.val("");
		$userPassword_.focus();
		return false;
	}
	
	
	// 이메일 공백 확인
	if($userEmail.val() == ""){
		alert("이메일을 입력해주세요.");
		$userEmail.focus();
		return false;
	}
	
	// 이메일 유효성 검사
	if(!getUserEmail.test($userEmail.val())){
		alert("이메일 형식에 맞게 입력해주세요.");
		$userEmail.val("");
		$userEmail.focus();
		return false;
	}
	
	
	// 프로필사진 유효성 검사
	if(!getUserProfileOriginalFile.test(fileExt) && $userProfileOriginalFile.val().length > 0){
		alert("첨부파일은 jpg, jpeg, png, gif로 된 이미지만 가능합니다.");
		return false;
	}

	return true;
}

function checkIdDuplicate(){
	var getUserId = RegExp(/^[a-zA-Z]+[a-zA-Z0-9]{4,11}$/); // 유저 아이디 유효성 검사
	// 아이디 중복검사폼 전송
	var $userId = $("#userId_").val();
	if($userId == ""){
		alert("아이디를 입력해주세요.");
		return;
	}
	
	if(!getUserId.test($userId)){
		alert("아이디는 영문자로 시작하고, 5~12자 영문자 또는 숫자를 입력해주세요.");
		return;
	}
	
	// 팝업창을 target으로 폼전송
	var target = "checkIdDuplicate";
	
	// 첫 번째 인자인 url은 생략, form의 action값이 이를 대신한다.
	var popup = open("", target, "left=300px, top=100px, width=450px, height=150px");
	
	checkIdDuplicateFrm.userId.value = $userId;
	console.log("userId@checkIdDuplicate()@register.jsp = ", $userId);
	
	// 폼의 대상을 작성한 popup을 가리키게 한다. 이때 이용하는게 popup창의 이름(target)
	checkIdDuplicateFrm.target = target;
	checkIdDuplicateFrm.submit();
}
</script>
<script>
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

</head>
<body>
<form action="<%=request.getContextPath()%>/member/checkIdDuplicate" method="POST"
	  name="checkIdDuplicateFrm">
	  <input type="hidden" name="userId"/>
</form>
<div id="logo" onclick="location.href='<%=request.getContextPath()%>/home'">Escape, if you can.</div>
<section id="register-Container">
	<h1>HELLO, STRANGER.</h1>
	<form action="<%=request.getContextPath()%>/member/memberRegisterEnd" method="POST" 
		  name="memberRegisterFrm" onsubmit="return registerValidate();" enctype="multipart/form-data">
		<table id="tbl-Register">
			<tr>
				<td><input type="text" name="userId" id="userId_" placeholder="아이디를 입력하세요." required></td>
				<td><input type="button" id="id-check" value="확인" onclick="checkIdDuplicate();"></td>
					<!-- 검사여부 알려주는 태그 -->
				<td><input type="hidden" name="idRegister" id="idRegister" value="0"></td>
			</tr>
			<tr>
				<td>
					<input type="password" name="userPassword" id="userPassword_" placeholder="비밀번호를 입력하세요." required />
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" id="userPassword__" placeholder="비밀번호를 한번 더 입력하세요." required />
				</td>
			</tr>
			<tr>
				<td>
					<input type="email" name="userEmail" id="userEmail"
						placeholder="이메일을 입력하세요. 예) escape@gmail.com" required />
				</td>
			</tr>
			<tr>
				<td>프로필 사진</td>
			</tr>
			<tr>
				<td><input type="file" name="userProfile" id="userProfile"
					accept="image/jpg, image/jpeg, image/png, image/gif"></td>
			</tr>
			<tr>
				<td>
					<div id="profile-Container">
						 <img width="100px" height="100px" id="profilePre" src="<%=request.getContextPath()%>/images/nonProfile.png">
					</div>
				</td>
			</tr>
		</table>
		<input type="submit" id="register-Btn" value="SIGN UP"> 
	</form>
</section>
</body>
</html>