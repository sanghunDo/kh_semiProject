<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="semi.admin.controller.*" %>
<%
	Member m = (Member) request.getAttribute("member");
	//header.jsp에서 userId 변수명을 이미 사용중이므로 살짝 변경
	String userId_ = m.getUserId(); 
	System.out.println("어드민멤버뷰.jsp 회원아이디: " + userId_);
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

img#null-Profile{
	width: 150px;
}
</style>
<script>
// 회원수정 기능 스크립트 추가하기
</script>
<h2>관리자 전용 게시판</h2>
<h3>회원 정보 상세 보기</h3>
<!-- 회원 한 명 정보 상세 보기 및 수정 -->
<form action=""> <!-- adminMemberUpdate 서블릿으로 연결 -->
	<section id="admin-memberView-container">
		<table id="tbl-memberView">
				<tr>
					<th>아이디</th>
					<td>
						<%=m.getUserId() %>
					</td>
				</tr>
				<tr>
					<th>프로필 사진</th>
					<td>
						<!-- 추가 -->
						
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
						<%=m.getUserEmail() %>
					</td>
				</tr>
				<tr>
					<th>가입한 날짜</th>
					<td>
						<%=m.getEnrollDate() %>
					</td>
				</tr>
				
		</table>
	</section>
	<input type="submit" id="userUpdate" value="회원정보 수정"/>
	<input type="button" id="userProfileEdit" onclick="changeProfile();" value="프로필 사진 수정"/> <!--  -->
	<input type="button" id="userPwdEdit" onclick="changePwd();" value="비밀번호 수정"/> <!-- adminMemberPasswordUpdate와 연결  -->
	<input type="button" id="deleteMember" onclick="deleteMember();" value="회원 삭제"/> <!-- adminMemberDelete와 연결 -->
</form>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>