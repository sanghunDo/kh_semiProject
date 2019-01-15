<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ page import = "java.util.*, semi.member.model.vo.*, semi.admin.model.vo.*, semi.admin.controller.*" %>
<%
	List<Member> memberList = (List<Member>) request.getAttribute("memberList");
	List<ReportBoard> reportList = (List<ReportBoard>) request.getAttribute("reportList");
	List<ReportBoardComment> reportCmtList = (List<ReportBoardComment>) request.getAttribute("reportCmtList");
=======
<%@ page import = "java.util.*" %>
<%@ page import = "semi.admin.controller.*" %>
<%-- <%@ page import = "semi.admin.model.vo.ReportBoard.*" %> --%>
<%
	List<Member> list = (List<Member>)request.getAttribute("list");
	/* List<ReportBoard> reportList = (List<ReportBoard>)request.getAttribute("reportList"); */
	
	// 신고된 게시글 목록도 불러오기
   	
   int cPage = (int)request.getAttribute("cPage");
   int numPerPage = (int)request.getAttribute("numPerPage");
   String pageBar = (String)request.getAttribute("pageBar");
 
>>>>>>> fda3c2a1d3896f04f423bd772a9e5b17e8fb969f
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<style>
h1{
	color:white;
	font-family:'Noto Serif KR', serif;
	text-align:center;
}

h3{
	color:white;
	font-family:'Noto Serif KR', serif;
	text-align:center;
	margin-top:20px;
	margin-bottom:40px;
}

table a:link {
	color: blue;
}
table a:visited {
	color: purple;
}
table a:hover {
	color: black;
}

section#member-list-container, #report-list-container, #report-cmt-container {
   text-align: center;
   width: 100%;
   border: 1px solid gray;
   border-collapse: collapse;
}

table#tbl-member, #tbl-report, #tbl-report-cmt {
   width: 100%;
   border: 1px solid gray;
   border-collapse: collapse;
   padding: 1px;
   background : white;
}
</style>
<script>
</script>
<title>관리자용 게시판</title>
<h1>회원 목록</h1>
<section id="member-list-container">
<table id="tbl-member">
   <thead>
	   <tr>
    	  	<th>아이디</th>
      		<th>이메일</th>
      		<th>프로필사진</th>
      		<th>가입날짜</th>
      		<th>보유코인</th>
	   </tr>
   </thead>
   <tbody>
		<%if(memberList != null && !memberList.isEmpty()) { for (Member m : memberList){ %>
		<tr>
			<td>
				<!-- 아이디 클릭시 회원 상세보기 페이지로 이동 -->
				<a href="<%=request.getContextPath()%>/admin/adminMemberView?userId=<%=m.getUserId()%>">
				<%=m.getUserId()%>
				</a>
			</td>
			<td><%=m.getUserEmail() %></td>
			<td>
				<%if(m.getUserProfileRenamedFile() != null){ %>
				<img class="userProfile" src="<%=request.getContextPath() %>/upload/member/<%=m.getUserProfileRenamedFile() %>" alt="" />
				<%} else{ %>
				<img class="userProfile" src="<%=request.getContextPath() %>/images/nonProfile.png" alt="" />
				<%} %>
			</td>
			<td><%=m.getEnrollDate() %></td>
			<td><%=m.getCoin() %></td>
		</tr>
		<%} } else {  %>
		<tr>
			<td>
				데이터가 없습니다.
			</td>
		</tr>
		<% }  %>
   </tbody>
</table>
</section>
<h3>전체 회원 검색</h3>
<section id="search-container">
	<div class="searchType">검색타입: 
		<select id="searchType">
			<option value="userId" >아이디</option> <!-- < %="userId".equals()?"selected":"" %> -->
			<option value="userEmail" >이메일</option> <!-- < %="userEmail".equals()?"selected":"" %> -->
		</select>
	</div>
	<!-- 아이디 검색폼 -->
	<div class="search-userid">
	<form action="">
				<input type="hidden" 
					   name="searchType"
					   value="userId" />
				<input type="search" 
					   name="searchKeyword"
					   size="25"
					   placeholder="검색할 아이디를 입력하세요."
					   value=""/>
				<button type="submit">검색</button>
			</form>
	</div>
	 	<!-- 이메일 검색폼 -->
    <div class="search-useremail">
			<form action="">
				<input type="hidden" 
					   name="searchType"
					   value="memberName" />
				<input type="search" 
					   name="searchKeyword"
					   size="25"
					   placeholder="검색할 회원 이메일을 입력하세요."
					   value=""/>
				<button type="submit">검색</button>
			</form>
    </div>
    <!-- 검색 끝 -->
</section>
<section id="show-search-user-result">
<table>
	<thead>
		<tr>
			<th>1</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>2</td>
		</tr>
	</tbody>
</table>
</section>
<!-- 검색된 회원 표시 -->
<h1>신고된 게시글 목록</h1>
<section id="report-list-container">
	<table id="tbl-report">
		<thead>
			<tr>
				<th>카테고리</th>
				<th>글번호</th>
				<th>게시글제목</th>
				<th>게시글작성자</th>
				<th>신고사유</th>
				<th>신고내용</th>
			</tr>
		</thead>
		<tbody>
			<%if(reportList != null && !reportList.isEmpty()) { 
				 for (ReportBoard rb : reportList){ %>
			<tr>
				<td><%=rb.getCategory() %></td>
				<td>
					<!-- 게시글 번호 클릭시 상세보기 페이지로 이동하기 -->
					<a href="<%=request.getContextPath()%>/admin/adminReportView?postNo=<%=rb.getPostNo()%>">
					<%=rb.getPostNo()%>
					</a>
				</td>
				<td>
					<%=rb.getPostTitle()%>
				</td>
				<td><%=rb.getPostWriter()%></td>
				<td><%=rb.getReason()%></td>
				<td><%=rb.getUserComment()%></td>
			</tr>
			<%} } else { %>
			<tr>
				<td>
					데이터가 없습니다.
				</td>
			</tr>
			<% }  %>
		</tbody>
	</table>
</section>
<h3>신고된 게시글 검색</h3>
<section id="search-report-container">
	<div class="searchType">검색타입: 
		<select id="searchType">
			<option value="postTitle" >제목</option> <!-- < %="userId".equals()?"selected":"" %> -->
			<option value="postContent" >내용</option> <!-- < %="userEmail".equals()?"selected":"" %> -->
			<option value="postTitleANDContent" >제목+내용</option>
			<option value="postWriter" >작성자</option>
		</select>
	</div>
	<!-- 제목 검색폼 -->
	<div class="search-userid">
	<form action="">
				<input type="hidden" 
					   name="searchType"
					   value="userId" />
				<input type="search" 
					   name="searchKeyword"
					   size="25"
					   placeholder="검색할 아이디를 입력하세요."
					   value=""/>
				<button type="submit">검색</button>
			</form>
	</div>
	 	<!-- 이메일 검색폼 -->
    <div class="search-useremail">
			<form action="">
				<input type="hidden" 
					   name="searchType"
					   value="memberName" />
				<input type="search" 
					   name="searchKeyword"
					   size="25"
					   placeholder="검색할 회원 이메일을 입력하세요."
					   value=""/>
				<button type="submit">검색</button>
			</form>
    </div>
</section>
    <!-- 검색 끝 -->
<!-- 검색된 게시글 표시 -->
<h1>신고된 댓글 목록</h1>
<section id="report-cmt-container">
	<table id="tbl-report-cmt">
		<thead>
			<tr>
				<th>카테고리</th>
				<th>게시글번호</th>
				<th>댓글번호</th>
				<th>댓글내용</th>
				<th>댓글작성자</th>
				<th>신고사유</th>
				<th>신고내용</th>
			</tr>
		</thead>
		<tbody>
			<%if(reportCmtList != null && !reportCmtList.isEmpty()) { 
				for (ReportBoardComment rbc : reportCmtList){%>
			<tr>
				<td><%=rbc.getCategory() %></td>
				<!-- 글번호 클릭시  상세보기 페이지로 이동하기-->
				<td><a href="<%=request.getContextPath() %>/admin/adminReportCmtView?postNo=<%=rbc.getPostNo()%>">
					<%=rbc.getPostNo()%>
					</a>
				</td>
				<td><%=rbc.getCommentNo() %></td>
				<td><%=rbc.getCommentContent()%></td>
				<td><%=rbc.getCommentWriter()%></td>
				<td><%=rbc.getReason()%></td>
				<td><%=rbc.getUserComment()%></td>
			</tr>
			<%} } else {%>
			<tr>
				<td>
					데이터가 없습니다.
				</td>
			</tr>
			<% }  %>
		</tbody>
	</table>
</section>
<h3>신고된 댓글 검색</h3>
<section id="search-cmt-container">
	<div class="searchType">검색타입: 
		<select id="searchType">
			<option value="postTitle" >제목</option> <!-- < %="userId".equals()?"selected":"" %> -->
			<option value="postContent" >내용</option> <!-- < %="userEmail".equals()?"selected":"" %> -->
			<option value="postTitleANDContent" >제목+내용</option>
			<option value="postWriter" >작성자</option>
		</select>
	</div>
	<!-- 제목 검색폼 -->
	<div class="search-userid">
	<form action="">
				<input type="hidden" 
					   name="searchType"
					   value="userId" />
				<input type="search" 
					   name="searchKeyword"
					   size="25"
					   placeholder="검색할 아이디를 입력하세요."
					   value=""/>
				<button type="submit">검색</button>
			</form>
	</div>
	 	<!-- 이메일 검색폼 -->
    <div class="search-useremail">
			<form action="">
				<input type="hidden" 
					   name="searchType"
					   value="memberName" />
				<input type="search" 
					   name="searchKeyword"
					   size="25"
					   placeholder="검색할 회원 이메일을 입력하세요."
					   value=""/>
				<button type="submit">검색</button>
			</form>
    </div>
</section>
<!-- 검색된 댓글 표시 -->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>