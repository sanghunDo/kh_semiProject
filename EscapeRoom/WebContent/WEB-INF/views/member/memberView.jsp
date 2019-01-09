<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/memberView.css" />
<%
	/* return타입이 Object이기때문에 형변환 필수 */
	Member m = (Member) request.getAttribute("member");
	String userId_ = m.getUserId(); // header.jsp에서 memberId 변수명을 이미 사용중이므로 _ 추가
	String userPassword = m.getUserPassword();
	String userEmail = m.getUserEmail()!=null?m.getUserEmail():"";
	String userProfileOriginalFile = m.getUserProfileOriginalFile()!=null?m.getUserProfileOriginalFile():"";	
	String userProfileRenamedFile = m.getUserProfileRenamedFile()!=null?m.getUserProfileRenamedFile():request.getContextPath()+"images/nonProfile.png";
%>
<script>
/* 회원정보수정 유효성 검사 */
function updateValidate(){
	// 아이디 검사
	var $userId_ = $("#userId_"); // 유저 아이디
	
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
		alert("아이디는 영문자와 숫자를 포함한 5~15 자리로 입력해주세요.");
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
	var status = "left=500px, top=200px, width=400px, height=400px";
	
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
<section id="memberView-Container">
	<h2>회원 정보 보기</h2>
	<form action="<%=request.getContextPath() %>/member/memberUpdateEnd" 
		  method="post"
		  name="memberUpdateFrm"
		  onsubmit="return updateValidate();"
		  enctype="multipart/form-data">
		  <table id="tbl-MemberView">
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
						<div id="userProfile-Div">
						<input type="file" name="userProfile" id="userProfile" accept="image/jpg, image/jpeg, image/png, image/gif">
						
						<!-- 프로필사진 변경시 삭제 -->
						<input type="hidden" name="oldUserRenamedProfile" value="<%=userProfileRenamedFile%>" />
						<input type="hidden" name="oldUserOriginalProfile" value="<%=userProfileOriginalFile%>" />
						
						<!-- 실제 파일이 있는 경우만 보여주기 -->
						<%if(m.getUserProfileRenamedFile() != null) { %>
						<br />
						<input type="checkbox" name="delProfile" id="delProfile" />
						<label for="del_Profile">프로필사진 삭제</label>
						<img src="<%=request.getContextPath() %>/upload/member/<%=userProfileRenamedFile %>"/>
						<%}
						else {%>
						   <img width="100px" height="100px" id="null-Profile" src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Antu_im-user-offline.svg/512px-Antu_im-user-offline.svg.png">
						<%} %>
						</div>
					</td>
					<td>
						<div id="profile-Container">
							<img id="profilePre" src="" alt="" />
						</div>
					</td>
				</tr>
		</table>
		  <input type="submit" id="editInfo-Btn" value="회원정보 수정" />
		  <input type="button" id="password-Btn" value="비밀번호 수정"
		  		 onclick="updatePassword();" />
		  <input type="button" id="delete-Btn" value="탈퇴" onclick="deleteMember();" />
	</form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>