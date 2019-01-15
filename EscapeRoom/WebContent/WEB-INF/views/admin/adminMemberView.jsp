<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, semi.admin.controller.*, semi.member.model.vo.Member" %>
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
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
	
	// 아이디 중복검사 여부 체크
	var $idValid = $("#idValid").val();
	if($idValid == 0){
		alert("아이디 중복검사를 해주세요.");
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

// 아이디 중복 검사하기
// adminCheckIdDupilcate 서블릿
// 클릭시 팝업 창 띄우기
function adminCheckIdDuplicate(){
	var getUserId = RegExp(/^[a-zA-Z]+[a-zA-Z0-9]{4,11}$/); // 아이디 유효성 검사
	
	// 아이디 중복검사 폼 전송
	var $userId = $("#userId_").val();
	if($userId == ""){
		alert("아이디를 입력해주세요.");
		return;
	}
	
	// 아이디 유효성 검사
	if(!getUserId.test($userId)){
		alert("아이디는 영문자로 시작하고, 5~12자를 채워서 영문자 또는 숫자를 입력해주세요.");
		return;
	}
	
	// 조건 만족시 팝업 창을 target으로 폼 전송
	var target = "adminCheckIdDuplicate";
	
	// 첫 번째 인자인 url은 생략, form의 action값이 이를 대신한다.
	var popup = open("", target, "left=300px, top=100px, width=450px, height=150px");
	
	admincheckIdDuplicateFrm.userId.value = $userId;
	console.log("userId@adminCheckIdDuplicate()@adminMemberView.jsp = ", $userId);
	
	// 폼의 대상을 작성한 popup 창의 이름(target)으로 지정
	adminCheckIdDuplicateFrm.target = target;
	adminCheckIdDuplicateFrm.submit();
}

// 비밀번호 수정하기
// adminPwdUpdate 서블릿
// 비밀번호 수정 버튼 클릭시 팝업이 뜸
function updatePwd(){
	var url = "<%=request.getContextPath() %>/admin/adminPwdUpdate?userId=<%=userId_%>";
	
	// 팝업창 이름
	var title = "관리자용 회원번호 수정하기";
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
<title>관리자용 게시판</title>
<h1>관리자용 회원 정보 상세 보기</h1>
<!-- 회원 한 명 정보 상세 보기 및 수정, 삭제 -->
<form action="<%=request.getContextPath()%>/admin/adminCheckIdDuplicate" 
	  method="post"
	  name="adminCheckIdDuplicateFrm">
	  <input type="hidden" name="userId"/>
</form>
<section id="admin-memberView-container">
<input type="hidden" name="userIdTest" name="userIdTest" 
	   id="userIdTest" value="<%=userId_%>"/>
<form action="<%=request.getContextPath()%>/admin/adminMemberUpdateEnd"
	  method="post"
	  name="adminMemberUpdateFrm"
	  onsubmit="return updateValidate();"
	  enctype="multipart/form-data"> 
	<table id="tbl-memberView">
			<tr>
				<th>아이디</th>
					<td>
						<input type="text" name="userId" id="userId_" value="<%=userId_%>" required />
					</td>
					<!-- 아이디 중복검사 버튼 -->
					<td><input type="button" id="id-check" value="중복검사" onclick="adminCheckIdDuplicate();"></td>
					<!-- 중복검사 여부 확인용 태그 -->
					<td><input type="hidden" name="idRegister" id="idRegister" value="0"><td>
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
				<th>이메일</th>
					<td>
						<input type="email" name="userEmail" id="userEmail" value="<%=userEmail %>" />
					</td>
			</tr>
			<tr>
				<th>가입한 날짜</th>
					<td>
						<%=m.getEnrollDate() %>
					</td>
			</tr>
			<tr>
				<th>코인</th>
				<td><%=m.getCoin()%></td>
			</tr>
		</table>
	<input type="submit" id="userInfoEdit" value="회원정보 수정" />
	<input type="button" id="userPwdEdit" onclick="updatePwd();" value="비밀번호 수정" />
	<input type="button" id="deleteMember" onclick="deleteMember();" value="회원 삭제" />
</form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>