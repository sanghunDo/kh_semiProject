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
<script>
$function(){
	// 프로필 사진 변경
	var bool = "";
};

$function(){
	// 회원 이메일 변경
	var email = "";
};

$function(){
	// 회원 삭제 기능
	$("#user-delete").click(function(){
		var isCheckec = $(this).prop("checked");
		$("#deleteMember").prop("checked", isChecked);
		
		if(isChecked)
			alert("정말로 삭제하시겠습니까?");
		
	});
};}

</script>
<h2>관리자 전용 게시판</h2>
<h3>회원 정보 상세 보기</h3>
<!-- 회원 한 명 정보 상세 보기 -->
<table id="memberView">
	<tr>
		<th>아이디</th>
		<th>프로필 사진</th>
		<th>비밀번호</th>
		<th>이메일</th>
		<th>가입한 날짜</th>
		<th>플레이 시간</th> <!-- 클리어한 기준 -->
		<th>클리어한 날짜</th>
		<!-- 작성한 게시글 수 -->
		<!-- 작성한 댓글 수 -->
	</tr>
	<tr>
		<td>
		<%=m.getUserId() %>
		</td>
		<td></td>
		<td>
		<%=m.getUserPassword() %>
		</td>
		<td>
		<%=m.getUserEmail() %>
		</td>
		<td>
		<%=m.getEnrollDate() %>
		</td>
		<td>
		<!-- 플레이 시간 가져오기 -->
		</td>
		<td>
		<!-- 클리어 날짜 가져오기 -->
		</td>
		<!-- 작성한 게시글 수 가져오기 -->
		<!-- 작성한 댓글 수 가져오기 -->
	</tr>
</table>
<div id="profile-file-edit">
	<button>프로필 사진 수정</button>
</div>
<div id="user-email-edit">
	<button>회원 이메일 수정</button>
</div>
<div id="user-delete">
	<button id="deleteMember">회원 삭제</button>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>