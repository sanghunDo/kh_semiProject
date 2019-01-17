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

<script>
	function deleteRankComment() {
		
		if(!confirm("정말로 댓글을 삭제하시겠습니까?")) {
			return false;
		}
		else {
			$("[name=rankCommentDelFrm]").submit();
		}
	}
</script>

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
            <td><%=i+1%></td>
            <td><%=list.get(i).getGameId()%></td>
            <td><%=list.get(i).getEndRuntime()%></td>
            <td><%=list.get(i).getGameescapedate()%></td>
         </tr>
         <% }}%>
      </table>
   </div>
   
   <!-- 댓글 시작  -->
   <div id="rankComment-container">
   		<h2>Reply</h2>
   		
   		<p class="warningMessage">* 비방 및 욕설, 도배글 등은 관리자에 의해 삭제될 수 있으니 주의하시길 바랍니다. *</p>
   		
   		<div id="rankComment-editor">
   			<p>
   				총 <span><%=totalRankComment%></span>개의 댓글이 작성되었습니다.
   			</p>
   			
   			<hr />
   			
   			<form action="<%=request.getContextPath()%>/board/rank/RankBoardCommentInsert" name="rankCommentSubmitFrm" method="post">
   				<input type="hidden" name="rankCommentWriter" value="<%=loggedInMember!=null?loggedInMember.getUserId():""%>"/>
   				<input type="hidden" name="rankCommentLevel" value="1" />
   				<input type="hidden" name="rankCommentRef" value="0" />
   				
   				<textarea name="rankCommentContent" cols="60" rows="3"></textarea>
   				<button type="submit" id="btn-insert">등록</button>
   			</form>
   			
   			<hr style="margin-top:-30px;" />
   			
   		</div>
   		
   		<!-- 댓글 목록 테이블 -->
   		
   		<table id="tbl-rankComment">
   			<% for(RankComment rc : rankCommentList) {
   				if(rc.getCommentLevel() == 1) { %>
   				
   				<tr class="rankLevel1">
   					<input type="hidden" name="rankCommentNo" value="<%=rc.getCommentNo()%>" />
   					<td>
   						<sub class="rComment-Writer">
   							<%=rc.getCommentWriter()%>
   						</sub>
   						<sub class="rComment-Date">
   							<%=rc.getCommentDate()%>
   						</sub>
   						&nbsp;&nbsp;
   						<sub class="rComment-like">
   							<a href="<%=request.getContextPath()%>/board/rank/rankCommentLike?rankCommentNo=<%=rc.getCommentNo()%>">추천</a>
   						</sub>
   						<sub class="rComment-likeAmount">
   							<%=rc.getCommentLike()%>
   						</sub>
   						&nbsp;
   						<sub class="rComment-dislike">
   							<a href="<%=request.getContextPath()%>/board/rank/rankCommentDisLike?rankCommentNo=<%=rc.getCommentNo()%>">비추천</a>
   						</sub>
   						<sub class="rComment-dislikeAmount">
   							<%=rc.getCommentDisLike()%>
   						</sub>
   						&nbsp;&nbsp;
   						<sub class="rComment-report">
   							<span onclick="report('<%=rc.getCommentNo()%>');">신고하기</span>
   						</sub>
   						<br />
   						<sub class="rComment-Content">
   							<%=rc.getCommentContent()%>
   						</sub>
   					</td>
   					<td>
   						<button class="btn-reply" value="<%=rc.getCommentNo()%>">답글</button>
   						
   						<% if(loggedInMember != null){
   							if(rc.getCommentWriter().equals(loggedInMember.getUserId()) || "admin".equals(loggedInMember.getUserId())) {%>
   							<form action="<%=request.getContextPath()%>/board/rank/RankBoardCommentDelete" name="rankCommentDelFrm">
   								<input type="hidden" name="rankCommentNo" value="<%=rc.getCommentNo()%>" />
   								<input type="hidden" name="rankCommentLevel" value="1" />
   								<button type="submit" id="btn-delete" onclick="deleteRankComment();">삭제</button>
   							</form>
   							<button type="submit" class="btn-update">수정</button>
   							<%} %>
   						<%} %>
   					</td>
   				</tr>
   			<%}
   				else {%>
   				
   				<tr class="rankLevel2">
   					<td>
   						<sub class="rComment-Writer">
   							└→ <%=rc.getCommentWriter()%>
   						</sub>
   						<sub class="rComment-Date">
   							<%=rc.getCommentDate()%>
   						</sub>
   						&nbsp;&nbsp;
   						<sub class="rComment-report">
   							<span onclick="report('<%=rc.getCommentNo()%>');">신고하기</span>
   						</sub>
   						<br />
   						<sub class="rComment-Content">
   							<%=rc.getCommentContent()%>
   						</sub>
   					</td>
   					
   					<td>
   						<% if(loggedInMember != null && (rc.getCommentWriter().equals(loggedInMember.getUserId()) || "admin".equals(loggedInMember.getUserId()))) {%>
   						
   							<form action="<%=request.getContextPath()%>/board/rank/RankBoardCommentDelete" name="rankCommentDelFrm">
   								<input type="hidden" name="rankCommentNo" value="<%=rc.getCommentNo()%>" />
   								<input type="hidden" name="rankCommentLevel" value="2" />
   								<button type="submit" id="btn-delete2" onclick="deleteRankComment();">삭제</button>
   							</form>
   						<%} %>
   					</td>
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
		
		$(".btn-reply").on('click', function() {
			<% if(loggedInMember != null) { %>
				/* 로그인한 경우 */
				var tr = $("<tr></tr>");
				var html = '<td style="display:none; text-align:left;" colspan="2">';
				
				html += '<form action="RankBoardCommentInsert" method="post">';
				html += '<input type="hidden" name="rankCommentWriter" value="<%=loggedInMember.getUserId()%>">';
				html += '<input type="hidden" name="rankCommentLevel" value="2">';
				html += '<input type="hidden" name="rankCommentRef" value="' + $(this).val() + '">';
				html += '<textarea name="rankCommentContent" cols="60" rows="3"></textarea>';
				html += '<button type="submit" class="btn-insert2">답글</button></form></td>';
				
				tr.html(html);
				
				tr.insertAfter($(this).parent().parent()).children("td").slideDown(800);
				
				// 한번 실행 후 이벤트 핸들러를 제거한다.
 				$(this).off('click');
				
				// 생성된 폼에 대해 submit 이벤트 핸들러를 설치한다.
				tr.find('form').submit(function(e) {
					var len = $(this).find("textarea").val().trim().length;
					
					if(len == 0) {
						e.preventDefault();
					}
				});
			<%} else {%>
				/* 로그인하지 않은 경우 */
				loginAlert();
			<% }%>
		});
		
		/* 수정하기 버튼 눌렀을 때
		   - 답글과 똑같은 형식으로 하는 이유는 본인이 작성했던 원래의 댓글을 수정 중 까먹을 수 있기 때문이다.*/		
		$(".btn-update").on('click', function() {
			<% if(loggedInMember != null) { %>
			/* var rankCommentNum = $("[name=rankCommentNo]").val(); */
			/* console.log(rankCommentNum); */
			var tr = $("<tr></tr>");
			var html = '<td style="display:none; text-align:left;" colspan="2">';
			
			html += '<form action="RankBoardCommentUpdate" method="post" name="rankCommentUpdateFrm">';
			html += '<input type="hidden" name="rankCommentNo" value="' + $("[name=rankCommentNo]").val() + '">';
			html += '<input type="hidden" name="rankCommentWriter" value="<%=loggedInMember.getUserId()%>">';
			html += '<input type="hidden" name="rankCommentLevel" value="2">';
			html += '<input type="hidden" name="rankCommentRef" value="' + $(this).val() + '">';
			html += '<textarea name="rankCommentUpdateContent" cols="60" rows="3"></textarea>';
			html += '<button type="submit" class="btn-update2">완료</button></form></td>';
			
			tr.html(html);
			
			tr.insertAfter($(this).parent().parent()).children("td").slideDown(800);
			
			// 한번 실행 후 이벤트 핸들러를 제거한다.
				$(this).off('click');
			
			// 생성된 폼에 대해 submit 이벤트 핸들러를 설치한다.
			tr.find('form').submit(function(e) {
				var len = $(this).find("textarea").val().trim().length;
				
				if(len == 0) {
					e.preventDefault();
				}
			});
			<%} else {%>
			/* 로그인하지 않은 경우 */
			loginAlert();
		<% }%>
		});
		
		$(".rComment-like").on('click', function() {
			<% if(loggedInMember != null) {%>
			
				var commentWriter = $("[name=rankCommentWriter]").val();
				
				if(!confirm("해당 댓글을 추천하시겠습니까?")) {
					return false;
				}
				
				if(commentWriter=="<%=loggedInMember.getUserId()%>") {
					alert("본인이 작성한 댓글은 추천 및 비추천을 하실 수 없습니다.");
					return false;
				}
				console.log();
			<%} else {%>
				loginAlert();
				return false;
			<%}%>
		});
		
		$(".rComment-dislike").on('click', function() {
			<% if(loggedInMember != null) {%>
			
				var cw = $("[name=rankCommentWriter]").val();
				
				if(!confirm("해당 댓글을 비추천하시겠습니까?")) {
					return false;
				}
				
				if(cw == "<%=loggedInMember.getUserId()%>") {
					alert("본인이 작성한 댓글에는 추천 및 비추천을 하실 수 없습니다.");
				}
			<%}
			else {%>
				loginAlert();
				return false;
			<%}%>
		});
		
		function report(item) {
			var rankCommentNo = item;
			
			var url = "<%=request.getContextPath()%>/board/rank/rankCommentReport?rankCommentNo="+rankCommentNo;
			
			var title = "댓글 신고";
			var status = "left = 500px, top=200px, width=600px, height=600px";
			
			open(url, title, status);
		}
		
		</script>
   <!-- 댓글 끝 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>