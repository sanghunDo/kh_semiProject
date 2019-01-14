<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="semi.admin.controller.*" %>
<%@ page import="semi.member.model.vo.Member" %>
<% 
	List<Member> list = (List<Member>)request.getAttribute("list");
	System.out.println("list@adminMemberSearch.jsp="+list);
	
	String searchType = request.getParameter("searchType");
	String searchKeyword = request.getParameter("searchKeyword");
	
	int numPerPage = (int)request.getAttribute("numPerPage");
	int cPage = (int)request.getAttribute("cPage");
	
	String pageBar = (String)request.getAttribute("pageBar");
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardCommunityTable.css" />
<script>
$function (){
	var sid = $("#search-userId");
	var semail = $("#search-userEmail");

	$("select#searchType").change(function(){
		sid.hide();
		semail.hide();
		
		$("#search-"+$(this).val()).css("display","inline-block");
	});
		
});
</script>
<!-- 회원 검색 기능 -->
<section id="userList-container">
<h2>관리자 전용 게시판</h2>
<h3>전체 회원 검색</h3>
<!-- 검색 시작 -->
<div class="user-search-container">
   	<div class="searchType">검색타입: 
		<select id="searchType">
			<option value="userId" <%="userId".equals(searchType)?"selected":"" %>>아이디</option>
			<option value="userEmail" <%="userEmail".equals(searchType)?"selected":"" %>>이메일</option>
		</select>
   	</div>
   	<!-- 아이디 검색폼 -->
    <div class="search-userid">
  			<form action="<%=request.getContextPath()%>/admin/adminMemberSearch">
				<input type="hidden" 
					   name="numPerPage" 
					   value="<%=numPerPage%>"/>
				<input type="hidden" 
					   name="searchType"
					   value="userId" />
				<input type="search" 
					   name="searchKeyword"
					   size="25"
					   placeholder="검색할 아이디를 입력하세요."
					   value="<%="userId".equals(searchType)?searchKeyword:""%>"/>
				<button type="submit">검색</button>
			</form>
 	</div>
 	<!-- 이메일 검색폼 -->
    <div class="search-useremail">
			<form action="<%=request.getContextPath()%>/admin/adminMemberSearch">
				<input type="hidden" 
					   name="numPerPage" 
					   value="<%=numPerPage%>"/>
				<input type="hidden" 
					   name="searchType"
					   value="memberName" />
				<input type="search" 
					   name="searchKeyword"
					   size="25"
					   placeholder="검색할 회원 이메일을 입력하세요."
					   value="<%="userEmail".equals(searchType)?searchKeyword:""%>"/>
				<button type="submit">검색</button>
			</form>
    </div>
    <!-- 검색 끝 -->
    <br />
    <hr />
    <br />
    <!-- 검색 결과 목록으로 표시하기 -->
    <section id="searchResult-container">
    <div class="search-result">
		<table id="tbl-member">
			<thead>
				<tr>
					<th>아이디</th>
					<th>프로필 사진</th>
					<th>비밀번호</th>
					<th>이메일</th>
					<th>가입한 날짜</th>
				</tr>
			</thead>
			<tbody>
			<%if(list == null || list.isEmpty()) {%>
				<tr>
					<td>
					불러올 회원 목록이 없습니다. 개발자에게 문의하세요.
					</td>
				</tr>
		<%} else {
			for(Member m : list){
		%>
			<tr>
				<td><%=m.getUserId() %> </td>
				<td><%=m.getUserProfileOriginalFile() %></td>
				<td><%=m.getUserPassword() %></td>
				<td><%=m.getUserEmail() %></td>
				<td><%=m.getEnrollDate() %></td>
			<% }
		} %>
   </tbody>
</table>
</div>
<div id="pageBar"><%=pageBar %></div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>