<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, semi.admin.controller.*, semi.member.model.vo.Member" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/memberView.css" />
<%
	Member m = (Member) request.getAttribute("member");
	String userId_ = m.getUserId();
	System.out.println("adminMemberView userId_:" + userId_);
	String userPassword = m.getUserPassword();
	String userEmail = m.getUserEmail()!=null?m.getUserEmail():"";
	String userProfileOriginalFile = m.getUserProfileOriginalFile()!=null?m.getUserProfileOriginalFile():"";	
	String userProfileRenamedFile = m.getUserProfileRenamedFile()!=null?m.getUserProfileRenamedFile():request.getContextPath()+"images/nonProfile.png";
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
h1{
	text-align:center;
}
#id-check{
	outline:none;
	border:1px solid white;
	color:white;
	background:black;
	border-radius: 5px;
	cursor:pointer;
}
#boardView-Btn{
	outline:none;
	font-family: 'Noto Serif KR', serif;
	font-weight:bold;
	border:1px solid #353535;
	color:white;
	background: #353535;
	border-radius: 10px;
	width:200px;
	height:35px;
	font-size:15px;
	cursor:pointer;
	display:block;
	margin:0 auto;
	margin-top:20px;
}
</style>
<script>
// 회원정보 수정 유효성 검사하기
function updateValidate(){	
	// 아이디 검사
	var $userId_ = $("#userId_"); // 아이디
	var getUserId = RegExp(/^[a-zA-Z]+[a-zA-Z0-9]{4,11}$/); // 아이디 유효성 검사용
	
	// 프로필 사진 검사
	var $userProfileOriginalFile = $("#userProfile"); // 프로필 사진명
	var fileExt = $userProfileOriginalFile.val().substring($userProfileOriginalFile.val().lastIndexOf(".") + 1); // 확장자명 구하기용
	var getUserProfileOriginalFile = RegExp(/jpg|jpeg|png|gif/i); // 프로필 사진 유효성 검사용
	
	// 비밀번호 검사
	var $userPassword_ = $("#userPassword_"); // 기존 비밀번호
	var $userPassword__ = $("#userPassword__"); // 비교할 새 비밀번호
	var getUserPassword = RegExp(/^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[#?!@$%^&*-]).{5,19}$/); // 비밀번호 유효성 검사용
	
	// 이메일 검사 
	var $userEmail = $("#userEmail"); // 이메일
	var getUserEmail = RegExp(/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/); // 이메일 유효성 검사용
	
	// 아이디 공백 확인
	if($userId_.val() ==""){
		alert("아이디를 입력해주세요.");
		$userId_.focus();
		return false;
	}
	
	// 아이디 유효성 검사
	if(!getUserId.test($userId_.val())){
		alert("아이디는 영문자와 숫자를 포함한 5~15 자리로 입력해주세요.");
		$userId_.val("");
		$userId_.focus();
		return false;
	}
	
	// 아이디 중복검사 여부 체크
	var $idValid = $("#idValid").val();
	if($idValid == 0){
		alert("아이디 중복검사해주세요.");
		return false;
	}
	
	// 프로필 사진 유효성 검사
	if(!getUserProfileOriginalFile.test(fileExt) && $userProfileOriginalFile.val().length > 0){
		alert("첨부파일은 jpg, jpeg, png, gif로 된 이미지만 가능합니다.");
		return false;
	}
	
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

// 아이디 중복검사용
// adminCheckIdDuplicate 서블릿
// 팝업으로 불러오기
function adminCheckIdDuplicate(){
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
	
	// 팝업창을 target으로 폼 전송
	var target = "adminCheckIdDuplicate";
	
	// url은 생략, form의 action값으로 대체
	var popup = open("", target, "left=300px, top=100px, width=450px, height=150px");
	
	adminCheckIdDuplicateFrm.userId.value = $userId;
	console.log("userId@adminCheckIdDuplicate()@register.jsp = ", $userId);
	
	// 폼의 대상을 작성한 popup을 가리키게 한다. 이때 이용하는게 popup창의 이름(target)
	adminCheckIdDuplicateFrm.target = target;
	adminCheckIdDuplicateFrm.submit();
}

// 회원 삭제하기
// adminMemberDelete 서블릿
function deleteMember(){
	var bool = confirm("정말로 삭제하시겠습니까?");
	if(bool){
		var form = document.adminMemberUpdateFrm;
		form.action = "<%=request.getContextPath()%>/admin/adminMemberDelete";
		form.submit();
	}
}

//프로필 사진 변경
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
   
   $(function(){
		$("#userId_").on("click", function(){
			alert("아이디는 수정이 불가능합니다.");
		});
	});
}
</script>
<title>관리자용 게시판</title>
<h1>관리자용 회원 정보 수정하기</h1>
<!-- 회원 한 명 정보 상세 보기 및 수정, 탈퇴 -->
<section id="memberView-Container">
<form action="<%=request.getContextPath()%>/admin/adminCheckIdDuplicate"
	  method="post"
	  name="adminCheckIdDuplicateFrm">
	  <input type="hidden" name="userId"/>
</form>
<input type="hidden" name="userIdTest" id="userIdTest" value="<%=userId_%>"/>
<form action="<%=request.getContextPath()%>/admin/adminMemberUpdateEnd"
	  method="post"
	  name="adminMemberUpdateFrm"
	  onsubmit="return updateValidate();"
	  enctype="multipart/form-data"> 
	<table id="tbl-MemberView">
			<tr>
				<th>아이디</th>
					<td>
						<input type="text" name="userId" id="userId_" value="<%=userId_%>" required readonly/>
					</td>
					<td>
						<!-- 팝업으로 중복검사 불러오기 -->
						<input type="button" id="id-check" value="중복검사" onclick="adminCheckIdDuplicate();">
					</td>
					<td>
						<!-- 아이디 중복검사 여부 확인 -->
						<input type="hidden" name="idRegister" id="idRegister" value="0">
					</td>
				</tr>
			<tr>
				<th>프로필사진</th>
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
				<th>이메일</th>
					<td>
						<input type="email" name="userEmail" id="userEmail" value="<%=userEmail %>" />
					</td>
			</tr>
			<tr>
				<th>가입한날짜</th>
					<td>
						<%=m.getEnrollDate() %>
					</td>
			</tr>
			<tr>
				<th>코인</th>
				<td><%=m.getCoin()%></td>
			</tr>
		</table>
	<input type="submit" id="editInfo-Btn" value="회원정보 수정" />
	<input type="button" id="delete-Btn" value="회원 삭제" onclick="deleteMember();" />
</form>
<!-- <a href="<%=request.getContextPath()%>' /admin/allBoardView"><button id="boardView-Btn" >작성한 게시글 보기</button></a>  -->
<form action="<%=request.getContextPath()%>/admin/adminMemberDelete"
	  method="post"
	  name="adminMemberDeleteFrm">
</form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>