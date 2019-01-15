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
input #id-check{
	outline:none;
	border:1px solid white;
	color:white;
	background:black;
	border-radius: 5px;
	cursor:pointer;
}

</style>
<script>
// 회원정보 수정 유효성 검사하기
function updateValidate(){	
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

// 비밀번호 수정하기
// adminPwdUpdate 서블릿
// 비밀번호 수정 버튼 클릭시 팝업 요청하기
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
}
</script>
<title>관리자용 게시판</title>
<h1>관리자용 회원 정보 상세 보기</h1>
<!-- 회원 한 명 정보 상세 보기 및 수정, 삭제 -->
<section id="memberView-Container">
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
	<input type="button" id="password-Btn" value="비밀번호 수정" onclick="updatePwd();" />
	<input type="button" id="delete-Btn" value="회원 삭제" onclick="deleteMember();" />
</form>
<form action="<%=request.getContextPath()%>/admin/adminMemberDelete"
	  method="post"
	  name="adminMemberDeleteFrm">
</form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>