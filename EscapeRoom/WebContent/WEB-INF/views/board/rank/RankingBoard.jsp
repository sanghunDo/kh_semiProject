<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ page import="java.util.*, semi.board.rank.model.vo.*" %>

<%
   List<Rank> list = (List<Rank>)request.getAttribute("list");
%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/rank/ranking.css" />
<link href="https://fonts.googleapis.com/css?family=Abril+Fatface|East+Sea+Dokdo|Fredericka+the+Great|Noto+Serif+KR|Permanent+Marker" rel="stylesheet">

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
	            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Antu_im-user-offline.svg/512px-Antu_im-user-offline.svg.png"
	                style="width : 120px; height : 120px; margin-top : -115px; margin-left : 140px;"/>
	         <%}
	            else {%>
	            <img src="<%=request.getContextPath() %>/upload/member/<%=list.get(0).getUserprofilerenamedfile() %>" alt="" 
	            style="width : 120px; height : 120px; margin-top : -115px; margin-left : 140px;"/>
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
	            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Antu_im-user-offline.svg/512px-Antu_im-user-offline.svg.png"
	                style="width : 120px; height : 120px; margin-top : -115px; margin-left : 140px;"/>
	         <%}
	            else {%>
	            <img src="<%=request.getContextPath() %>/upload/member/<%=list.get(1).getUserprofilerenamedfile() %>" alt="" 
	            style="width : 120px; height : 120px; margin-top : -115px; margin-left : 140px;"/>
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
	            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Antu_im-user-offline.svg/512px-Antu_im-user-offline.svg.png"
	                style="width : 120px; height : 120px; margin-top : -115px; margin-left : 140px;"/>
	         <%}
	            else {%>
	            <img src="<%=request.getContextPath() %>/upload/member/<%=list.get(2).getUserprofilerenamedfile() %>" alt="" 
	            style="width : 120px; height : 120px; margin-top : -115px; margin-left : 140px;"/>
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
            <td colspan="4" align="center">아직 랭크에 기록된 결과가 없습니다.</td>
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
      <p>* 비방 및 욕설, 도배글 등은 관리자에 의해 삭제될 수 있으니 주의하시길 바랍니다. *</p>
      <div id="reply">
         
         
         
      </div>
      
   </div>
   <!-- 댓글 끝 -->

<%@ include file="/WEB-INF/views/common/footer.jsp" %>