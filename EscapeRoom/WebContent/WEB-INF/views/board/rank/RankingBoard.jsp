<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*, semi.board.rank.model.vo.*" %>


<%
	List<Rank> list = (List<Rank>)request.getAttribute("list");
%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/rank/ranking.css" />
<link href="https://fonts.googleapis.com/css?family=Abril+Fatface|East+Sea+Dokdo|Fredericka+the+Great|Noto+Serif+KR|Permanent+Marker" rel="stylesheet">
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<h2>BEST 3</h2>
	
	<!-- div 1st, 2nd, 3rd는 css파일에서 적용이 되지 않아 jsp에 직접 써넣었습니다.ㅠㅠ
		 (세 개의 div태그 안에 있는 모든 태그 포함) -->
	<!-- 그리고 1등부터 10등까지 랭크 기준은 깔끔하게 보이도록 playno 기준으로 정했습니다.
		  조만간 GameRuntime 기준으로 수정하겠습니다. -->
	
	<div id="top3">
		<div id="top1-container">
			<%if(list == null || list.isEmpty()) { %>
				<span id="none">랭크에 기록된 결과가 없습니다.</span>
			<% } for(Rank r : list) {
					if(r.getPlayno() == 1) { %>
				<div id="1st" style="width : 100px; height : 100px;
								 border : 2px solid #FFDB0B;
								 border-radius : 40px;
								 background : #FFDB0B;
								 margin-left : -2px; margin-top : -2px;
								 text-align : center;">
								 
				<p style="color : black;
				   font-family: 'Abril Fatface', cursive;
				   font-size : 35px;
				   margin-top : 25px;">1st</p>
				   
				<!-- 유저 프로필 이미지 시작 -->
				
				<%if(r.getUserprofilerenamedfile() == null || r.getUserprofilerenamedfile().isEmpty()) { %>
					<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Antu_im-user-offline.svg/512px-Antu_im-user-offline.svg.png"
						 style="width : 120px; height : 120px; margin-top : -115px; margin-left : 140px;"/>
				<%}
					else {%>
					
				<% } %>
				
				<!-- 유저 프로필 이미지 끝 -->
			</div>
			
			<p style="color:white; font-family : 'Noto Serif KR', serif;"><%=r.getGameId() %></p>
			<p style="color:white; font-family : 'Noto Serif KR', serif;"><%=r.getEndRuntime()%></p>
			<p style="color:white; font-family : 'Noto Serif KR', serif;"><%=r.getGameescapedate()%></p>
			
			<%}} %>
		</div>
		
		<div id="top2-container">
			<%if(list == null || list.isEmpty()) { %>
				<span id="none">랭크에 기록된 결과가 없습니다.</span>
			<% } for(Rank r : list) {
					if(r.getPlayno() == 2) { %>
				<div id="1st" style="width : 100px; height : 100px;
								 border : 2px solid #CACED2;
								 border-radius : 40px;
								 background : #CACED2;
								 margin-left : -2px; margin-top : -2px;
								 text-align : center;">
								 
				<p style="color : black;
				   font-family: 'Abril Fatface', cursive;
				   font-size : 35px;
				   margin-top : 25px;">2nd</p>
				   
				<!-- 유저 프로필 이미지 시작 -->
				
				<%if(r.getUserprofilerenamedfile() == null || r.getUserprofilerenamedfile().isEmpty()) { %>
					<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Antu_im-user-offline.svg/512px-Antu_im-user-offline.svg.png"
						 style="width : 120px; height : 120px; margin-top : -115px; margin-left : 140px;"/>
				<%}
					else {%>
					
				<% } %>
				
				<!-- 유저 프로필 이미지 끝 -->
			</div>
			
			<p style="color:white; font-family : 'Noto Serif KR', serif;"><%=r.getGameId() %></p>
			<p style="color:white; font-family : 'Noto Serif KR', serif;"><%=r.getEndRuntime()%></p>
			<p style="color:white; font-family : 'Noto Serif KR', serif;"><%=r.getGameescapedate()%></p>
			
			<%}} %>
		</div>
		
		<div id="top3-container">
			<%if(list == null || list.isEmpty()) { %>
				<span id="none">랭크에 기록된 결과가 없습니다.</span>
			<% } for(Rank r : list) {
					if(r.getPlayno() == 3) { %>
				<div id="1st" style="width : 100px; height : 100px;
								 border : 2px solid #D49C75;
								 border-radius : 40px;
								 background : #D49C75;
								 margin-left : -2px; margin-top : -2px;
								 text-align : center;">
								 
				<p style="color : black;
				   font-family: 'Abril Fatface', cursive;
				   font-size : 35px;
				   margin-top : 25px;">3rd</p>
				   
				<!-- 유저 프로필 이미지 시작 -->
				
				<%if(r.getUserprofilerenamedfile() == null || r.getUserprofilerenamedfile().isEmpty()) { %>
					<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Antu_im-user-offline.svg/512px-Antu_im-user-offline.svg.png"
						 style="width : 120px; height : 120px; margin-top : -115px; margin-left : 140px;"/>
				<%}
					else {%>
					
				<% } %>
				
				<!-- 유저 프로필 이미지 끝 -->
			</div>
			
			<p style="color:white; font-family : 'Noto Serif KR', serif;"><%=r.getGameId() %></p>
			<p style="color:white; font-family : 'Noto Serif KR', serif;"><%=r.getEndRuntime()%></p>
			<p style="color:white; font-family : 'Noto Serif KR', serif;"><%=r.getGameescapedate()%></p>
			
			<%}} %>
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
				for(Rank r : list) {
			%>
			<tr>
				<!-- AJAX 사용 해야함! -->
				<td><%=r.getPlayno()%></td>
				<td><%=r.getGameId()%></td>
				<td><%=r.getEndRuntime()%></td>
				<td><%=r.getGameescapedate()%></td>
			</tr>
			<% }}%>
		</table>
	</div>
	
	
	<!-- 댓글 시작띠  -->
	<div id="reply-container">
		<h2>Reply</h2>
		<p>* 비방 및 욕설, 도배글 등은 관리자에 의해 삭제될 수 있으니 주의하시길 바랍니다. *</p>
		
		
		<div id="reply">
			
			
			
		</div>
		
	</div>
	<!-- 댓글 끝났띠 -->

<%@ include file="/WEB-INF/views/common/footer.jsp" %>