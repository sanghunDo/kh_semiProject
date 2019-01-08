<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="semi.admin.controller.*" %>
<%@ page import="semi.member.model.vo.Member" %>
<% 
	List<Member> memberList = (List<Member>)request.getAttribute("memberList");
	
	Member m = (Member)request.getAttribute("member");
	// header.jsp의 userId 변수명 충돌 방지용
	String userId_1 = m.getUserId();
	String userPassword = m.getUserPassword();
	String userEmail = m.getUserEmail()!=null?m.getUserEmail():"";
	String userProfileOriginalFile = m.getUserProfileOriginalFile()!=null?m.getUserProfileOriginalFile():"";	
	String userProfileRenamedFile = m.getUserProfileRenamedFile()!=null?m.getUserProfileRenamedFile():"";
	Date enrollDate = m.getEnrollDate();

	int cPage = (int)request.getAttribute("cPage");
	int numPerPage = (int)request.getAttribute("numPerPage");
	String pageBar = (String)request.getAttribute("pageBar");
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardCommunityTable.css" />
<script>
$(function checkValue(){
	// 검색창 값 미입력하고 검색시 경고창 띄우기
	
});
</script>
<h2>관리자 전용 게시판</h2>
<h3>전체 회원 검색</h3>
<!-- 회원 검색 기능 -->
<div class="user-search-container">
   	<div class="search-keyword">검색 키워드: 
		<select id="search-keyword">
			<option value="userId">아이디</option>
			<option value="userPwd">비밀번호</option>
			<option value="userEmail">이메일</option>
		</select>
   	</div>
    <div class="search-userid">
  			<input type="search" name="" id="" placeholder="검색할 아이디를 입력하세요."/>
 	</div>
 	<div class="search-password">
  			<input type="search" name="" id="" placeholder="검색할 비밀번호를 입력하세요."/>
 	</div>
    <div class="search-useremail">
			<input type="search" name="" id="검색할 이메일을 입력하세요." />
    </div>
    <button type="submit">검색하기</button>
    <!-- 검색 결과 표시하기 -->
    <br />
    <hr />
    <br />
    <div class="search-result">
	<%if(memberList == null || memberList.isEmpty()) {%>
		<p>검색 결과가 없습니다.</p>
	<%} else {%>
		<table>
			<tr>
				<th>아이디</th>
				<th>프로필 사진</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>가입한 날짜</th>
			</tr>
			<tr>
				<td><%=m.getUserId() %> </td>
				<td><%= %></td>
				<td><%=m.getUserPassword() %></td>
				<td><%=m.getUserEmail() %></td>
				<td><%=m.getEnrollDate() %></td>
			</tr>
		</table>
	<%} %>
		<div id="pageBar">
		<%=pageBar %>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>