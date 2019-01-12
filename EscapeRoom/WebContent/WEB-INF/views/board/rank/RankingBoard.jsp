<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ page import="java.util.*, semi.board.rank.model.vo.*" %>

<%
	List<Rank> list = (List<Rank>)request.getAttribute("list");
	List<RankComment> rankCommentList = (List<RankComment>)request.getAttribute("rankCommentList");
	int totalRankComment = (int)request.getAttribute("totalRankComment");
%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/rank/ranking.css" />
<link href="https://fonts.googleapis.com/css?family=Abril+Fatface|East+Sea+Dokdo|Fredericka+the+Great|Noto+Serif+KR|Permanent+Marker|Song+Myung" rel="stylesheet">

   <h2>BEST 3</h2>
   
   <div id="top3">
      <div id="top1-container">
         <%if(list == null || list.isEmpty()) { %>
            <span id="none">랭크에 기록된 결과가 없습니다.</span>
         <% }
         else {%>
         <div id="first">
            <p id="label-for-grade">1st</p>
            <!-- 유저 프로필 이미지 시작 -->
            <%if(list.get(0).getUserprofilerenamedfile() == null || list.get(0).getUserprofilerenamedfile().isEmpty()) { %>
               <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Antu_im-user-offline.svg/512px-Antu_im-user-offline.svg.png"/>
            <%}
               else {%>
               <img src="<%=request.getContextPath() %>/upload/member/<%=list.get(0).getUserprofilerenamedfile() %>"/>
            <% } %>
               
            <!-- 유저 프로필 이미지 끝 -->
            </div>
            
            <p class="playerInfo"><%=list.get(0).getGameId() %></p>
            <p class="playerInfo"><%=list.get(0).getEndRuntime()%></p>
            <p class="playerInfo"><%=list.get(0).getGameescapedate()%></p>
         
         <%} %>
      </div>
      
      <div id="top2-container">
         <%if(list == null || list.isEmpty()) { %>
            <span id="none">랭크에 기록된 결과가 없습니다.</span>
         <% }
         else {%>
         <div id="second">
            <p id="label-for-grade">2nd</p>
            <!-- 유저 프로필 이미지 시작 -->
            <%if(list.get(1).getUserprofilerenamedfile() == null || list.get(1).getUserprofilerenamedfile().isEmpty()) { %>
               <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Antu_im-user-offline.svg/512px-Antu_im-user-offline.svg.png"/>
            <%}
               else {%>
               <img src="<%=request.getContextPath() %>/upload/member/<%=list.get(1).getUserprofilerenamedfile() %>"/>
            <% } %>
               
            <!-- 유저 프로필 이미지 끝 -->
            </div>
         
         <p class="playerInfo"><%=list.get(1).getGameId() %></p>
         <p class="playerInfo"><%=list.get(1).getEndRuntime()%></p>
         <p class="playerInfo"><%=list.get(1).getGameescapedate()%></p>
         
         <%} %>
      </div>
      
      <div id="top3-container">
         <%if(list == null || list.isEmpty()) { %>
            <span id="none">랭크에 기록된 결과가 없습니다.</span>
         <% }
         else {%>
         <div id="third">
            <p id="label-for-grade">3rd</p>
            <!-- 유저 프로필 이미지 시작 -->
            <%if(list.get(2).getUserprofilerenamedfile() == null || list.get(2).getUserprofilerenamedfile().isEmpty()) { %>
               <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Antu_im-user-offline.svg/512px-Antu_im-user-offline.svg.png"/>
            <%}
               else {%>
               <img src="<%=request.getContextPath() %>/upload/member/<%=list.get(2).getUserprofilerenamedfile() %>"/>
            <% } %>
               
            <!-- 유저 프로필 이미지 끝 -->
            </div>
         
         <p class="playerInfo"><%=list.get(2).getGameId() %></p>
         <p class="playerInfo"><%=list.get(2).getEndRuntime()%></p>
         <p class="playerInfo"><%=list.get(2).getGameescapedate()%></p>
         
         <%} %>
   </div>
   
   <div id="from4to10">
      <!-- 4등부터 10등까지의 테이블은 AJAX 사용하기! -->
      <table id="tbl-Rank4-10">
         <tr>
            <th>등수</th>
            <th>아이디</th>
            <th>클리어 시간</th>
            <th>클리어 날짜</th>
         </tr>
         
         <% if(list == null || list.isEmpty()) { %>
         
         <tr>
            <td colspan="4" align="center">
            아직 랭크에 기록된 결과가 없습니다.
            </td>
         </tr>
         <%}
         else {
            for(int i=3; i<list.size(); i++) {
         %>
         <tr>
            <!-- AJAX 사용 해야함! -->
            <td><%=i+1%></td>
            <td><%=list.get(i).getGameId()%></td>
            <td><%=list.get(i).getEndRuntime()%></td>
            <td><%=list.get(i).getGameescapedate()%></td>
         </tr>
         <% }}%>
      </table>
   </div>
   
   <!-- 댓글 시작  -->
   <div id="reply-container">
   
      <h2>Reply</h2>
      
      <p class="warningMessage">* 비방 및 욕설, 도배글 등은 관리자에 의해 삭제될 수 있으니 주의하시길 바랍니다. *</p>
      
      <div id="reply">
      
      	 <p>
      	 	<!-- 0은 댓글 갯수를 받아올 것 -->
      	 	총 <span><%=totalRankComment %></span>개의 댓글이 작성되었습니다.
      	 </p>
      
      	 <hr />
         
         <form action="<%=request.getContextPath()%>/board/rank/RankBoardCommentInsert" name="rankCommentSubmitFrm" method="post">
         	<input type="hidden" name="rankCommentWriter" value="<%=loggedInMember!=null?loggedInMember.getUserId():""%>" />
         	<input type="hidden" name="rankCommentLevel" value="1" />
         	<input type="hidden" name="rankCommentRef" value="0" />
         	
         	<textarea name="rankCommentContent" cols="60" rows="3"></textarea>
         	<button type="submit" id="btn-insert">등록</button>
         </form>
         <hr style="margin-top:-29.5px;"/>
         
      </div>
      
      
      <!-- 댓글 목록 테이블 -->
      
		 <table id="tbl-rankComment">
		 	
		 	<% for(RankComment rc : rankCommentList) { 
		 		if(rc.getCommentLevel() == 1) { %>
		 		
		 		<tr class="rankLevel1">
		 			<td>
		 				<sub class="rComment-Writer">
		 					<%=rc.getCommentWriter() %>
		 				</sub>
		 				<sub class="rComment-Date">
		 					<%=rc.getCommentDate()%>
		 				</sub>
		 				<br />
		 				<%=rc.getCommentContent() %>
		 			</td>
		 			<td>
		 				<button id="btn-reply" value="<%=rc.getCommentNo()%>">답글</button>
		 				
		 				<% if(loggedInMember != null && (rc.getCommentWriter().equals(loggedInMember.getUserId()) || "admin123".equals(loggedInMember.getUserId()))) {%>
		 				
		 				<form action="<%=request.getContextPath()%>/board/rank/RankBoardCommentDelete" name="deleteRankCommentFrm">
		 					<input type="hidden" name="rankCommentNo" value="<%=rc.getCommentNo()%>" />
		 					<input type="hidden" name="rankCommentLevel" value="1" />
		 					<button type="submit" id="btn-delete" onclick="deleteRankComment();">삭제</button>
		 				</form>
		 				
		 				<%} %>
		 			</td>
		 		</tr>
		 		
		 	<%}
		 		else {%>
		 		
		 		<tr class="rankLevel2">
		 			<td>
		 				<sub class="rComment-Writer">
		 					<%=rc.getCommentWriter()%>
		 				</sub>
		 				<sub class="rComment-Date">
		 					<%=rc.getCommentDate()%>
		 				</sub>
		 				<br />
		 				<%=rc.getCommentContent()%>
		 			</td>
		 			
		 			<!-- 관리자이거나 본인이 쓴 댓글(대댓글)에 대해서만 삭제버튼이 보여야하며,
		 				 삭제 요청 처리 이후에는 현재 페이지가 다시 보여져야 한다. -->
		 		</tr>
		 		
		 	<%}} %>
		 	
		 </table>
   </div>
   
	<script>
		$("[name=rankCommentContent]").on('click', function() {
			if(<%=loggedInMember == null%>)
				loginAlert();
		});
		
		function loginAlert() {
			alert("로그인 후 이용하실 수 있습니다.");
		}
		
		$("[name=rankCommentSubmitFrm]").submit(function(e) {
			if(<%=loggedInMember == null%>) {
				loginAlert();
				e.preventDefault();
				return;
			}
			
			// RankCommentContent 유효성 검사!
			var len = $("[name=rankCommentContent]").val().trim().length;
			
			if(len == 0) {
				alert("댓글을 작성하세요.");
				e.preventDefault();
			}
		});
		
		function deleteRankComment() {
			if(!confirm("댓글을 정말로 삭제하시겠습니까?")) {
				return false;
			}
			
			$("[name=deleteRankCommentFrm]").submit();
		}
	</script>
   <!-- 댓글 끝 -->