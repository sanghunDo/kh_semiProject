<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
	
%>
<script>
/* 회원가입 유효성 검사 */
function registerValidate(){
	
	// 아이디 검사
	var $userid_ = $("#userid_"); // 유저 아이디
	var getuserid = /^[a-zA-Z0-9]{4,20}$/; // 유저 아이디 유효성 검사
	
	// 비밀번호 검사
	var $userpassword_ = $("#userpassword_"); // 유저 비밀번호
	var $userpassword__ = $("#userpassword__"); // 비교할 유저 비밀번호
	/* var getuserpassword = RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,20}$/); // 유저 비밀번호 유효성 검사 */
	/* var getuserpassword = RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,20}$/); // 유저 비밀번호 유효성 검사 */
	var getuserpassword = RegExp(/^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[#?!@$%^&*-]).{6,20}$/); // 유저 비밀번호 유효성 검사

	// 이메일 검사 
	var $useremail = $("#useremail"); // 유저 이메일
	var getuseremail = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/; // 유저 이메일 유효성 검사
	
	// 프로필 검사
	var $userprofileoriginalfile = $("#userprofileoriginalfile"); // 유저 원본 프로필 사진명
	var $userprofilerenamedfile = $("#userprofilerenamedfile"); // 서버저장용 유저 프로필 사진명

	
	// 아이디 공백 확인
	if($userid_.val() ==""){
		alert("아이디를 입력해주세요.");
		$userid_.focus();
		return false;
	} 
	
	// 아이디 유효성 검사
	if(!getuserid.test($userid_.val())){
		alert("아이디는 영문자나 숫자를 포함한 5~21 자리로 입력해주세요.");
		$userid_.val("");
		$userid_.focus();
		return false;
	}
	
	
	// 비밀번호 공백 확인
	if($userpassword_.val() == ""){
		alert("비밀번호를 입력해주세요.");
		$userpassword_.focus();
		return false;
	}
	
	// 아이디와 비밀번호 같은지 확인
	if($userid_.val() == $userpassword_.val()){
		alert("아이디와 비밀번호가 같습니다.");
		$userpassword_.val("");
		$userpassword_.focus();
		return false;
	}
	
	// 비밀번호 유효성 검사
	if(!getuserpassword.test($userpassword_.val())){
		alert("비밀번호는 영문자와 숫자, 특수 문자를 포함한 6~20 자리로 입력해주세요.");
		$userpassword_.val("");
		$userpassword_.focus();
		return false;
	}
	
	// 비밀번호 확인란 공백 확인
	if($userpassword_.val() == ""){
		alert("비밀번호 확인란을 입력해주세요.");
		$userpassword_.focus();
		return false;
	}
	
	// 비밀번호 일치여부 확인
	if($userpassword_.val() != $userpassword__.val()){
		alert("비밀번호가 다릅니다.");
		$userpassword_.val("");
		$userpassword__.val("");
		$userpassword_.focus();
		return false;
	}
	
	
	// 이메일 공백 확인
	if($useremail.val() == ""){
		alert("이메일을 입력해주세요.");
		$useremail.focus();
		return false;
	}
	
	// 이메일 유효성 검사
	if(!getuseremail.test($useremail.val())){
		alert("이메일 형식에 맞게 입력해주세요.");
		$useremail.val("");
		$useremail.focus();
		return false;
	}
	
	
	
	
	
	return true;
	
	
	
	
}


function checkIdDuplicate(){
	var getuserid = RegExp(/^[a-zA-Z0-9]{4,20}$/);
	// 아이디 중복검사폼 전송
	var $userid = $("#userid_").val();
	if($userid == ""){
		alert("아이디를 입력해주세요.");
		return;
	}
	
	if(!getuserid.test($userid)){
		alert("아이디는 영문자나 숫자를 포함한 5~21 자리로 입력해주세요.");
		return;
	}
	
	// 팝업창을 target으로 폼전송
	var target = "checkIdDuplicate";
	
	// 첫 번째 인자인 url은 생략, form의 action값이 이를 대신한다.
	var popup = open("", target, "left=300px, top=100px, height=200px, width=300px");
	
	checkIdDuplicateFrm.userid.value = $userid;
	
	// 폼의 대상을 작성한 popup을 가리키게 한다. 이때 이용하는게 popup창의 이름(target)
	checkIdDuplicateFrm.target = target;
	checkIdDuplicateFrm.submit();
}
</script>
<script>
    $(function(){
        $("#userprofile").on('change', function(){
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

<body>
	<form action="<%=request.getContextPath()%>/member/checkIdDuplicate"
		  method="POST"
		  name="checkIdDuplicateFrm">
		  <input type="hidden" name="userid"/>
	</form>
	<section id="register-container">
		<h2>회원가입 정보 입력</h2>
		<form action="<%=request.getContextPath()%>/member/memberRegisterEnd"
			  method="POST" 
			  name="memberRegisterFrm"
			  onsubmit="return registerValidate();">

			<table id="tbl-register">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" 
							   name="userid" 
							   id="userid_"
							   placeholder="아이디를 입력하세요." 
							   required> 
						<input type="button"
							   value="중복검사" 
							   onclick="checkIdDuplicate();"> 
						<input type="hidden" 
							   name="idRegister" 
							   id="idRegister" 
							   value="0">
					</td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td>
						<input type="password" 
							   name="userpassword"
							   id="userpassword_"
							   placeholder="비밀번호"
							   required>
					</td>
				</tr>
				<tr>
					<th>패스워드 확인</th>
					<td>
						<input type="password" 
							   id="userpassword__" 
							   placeholder="비밀번호 확인"
							   required>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="email" 
							   name="useremail" 
							   id="useremail"
							   placeholder="예) escaperoom19@gmail.com">
					</td>
				</tr>
				<tr>
					<th>프로필 사진</th>
					<td>
						<input type="file" name="userprofile" id="userprofile">
					</td>
				</tr>
				<tr>
					<td colspan="6" id="profile_td">
						<img src="" alt="" id="profilePre">
					</td>
				</tr>
			</table>
			<input type="submit" value="회원가입"> 
			<input type="reset" value="초기화">
		</form>
	</section>