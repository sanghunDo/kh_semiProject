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
// 프로필 사진 변경
function changeProfile(){
	var bool = confirm("프로필 이미지를 변경하시겠습니까?");
	
	if(bool) {
		
	}
};

// 비밀번호 변경
function changePwd(){
	var bool = confirm("회원의 비밀번호를 변경하시겠습니까?");
	
	if(bool) {
		
	}
};

// 회원 삭제 기능
function deleteMember(){
	var bool = confirm("정말로 삭제하시겠습니까?");
	
	if(bool) {

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
<table id="memberView">
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
				   required
				   readonly/>
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
	<tr>
		<th>플레이 시간</th>
		<td><input type="text" />
		<!-- 클리어한 기준 플레이 시간 가져오기 -->
		</td>
	</tr>
	<tr>
		<th>클리어한 날짜</th>
		<td><input type="text" />
		<!-- 클리어 날짜 가져오기 -->
		</td>
	</tr>
	<tr>
		<th>작성한 게시글 수</th>
		<td><input type="text" />
		<!-- 게시글 수 가져오기 -->
		</td>
	</tr>
	<tr>
		<th>작성한 댓글 수</th>
		<td><input type="text" />
		<!-- 댓글 수 가져오기 -->
		</td>
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