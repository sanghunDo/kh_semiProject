<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script src="js/jquery-3.3.1.js"></script>
<script>
/* 회원가입 유효성 검사 */
function enrollValidate(){
	var $userid = $("#userid"); // 유저 아이디
	var $useremail = $("#useremail"); // 유저 이메일
	var $userprofileoriginalfile = $("#userprofileoriginalfile"); // 유저 원본 프로필 사진명
	var $userprofilerenamedfile = $("#userprofilerenamedfile"); // 서버저장용 유저 프로필 사진명
	
	if($userid.val())
}

$(function(){
	// 패스워드 일치여부 검사
	var $userpassword = $("#userpassword"); // 유저 비밀번호
	var $userpassword_ = $("#userpassword_"); // 비교할 유저 비밀번호
	$userpassword.on("focusout", function(){
		if($userpassword.val() != $userpassword_.val()){
			alert("패스워드가 일치하지 않습니다.");
		}
	});
});

function checkIdDuplicate(){
	// 아이디 중복검사폼 전송
	var userid = $("#userid").val().trim();
	
}

</script>
