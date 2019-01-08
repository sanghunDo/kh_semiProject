<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*, semi.board.rank.model.vo.*" %>

<%
	List<Rank> list = (List<Rank>)request.getAttribute("list");
%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/rank/ranking.css" />
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Fredericka+the+Great|Noto+Serif+KR|Permanent+Marker" rel="stylesheet">
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<h2>BEST 3</h2>

	<div id="top3">
		<table id="tbl-top3">
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
					if(r.getPlayno() < 4) {
			%>
			<tr>
				<td><%=r.getPlayno()%></td>
				<td><%=r.getGameId()%></td>
				<td><%=r.getGameruntime()%></td>
				<td><%=r.getGameescapedate()%></td>
			</tr>
			<% }}} %>
		</table>
	</div>
	
	<div id="from4to10">
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
					if(r.getPlayno() >= 4) {
			%>
			<tr>
				<td><%=r.getPlayno()%></td>
				<td><%=r.getGameId()%></td>
				<td><%=r.getGameruntime()%></td>
				<td><%=r.getGameescapedate()%></td>
			</tr>
			<% }}} %>
		</table>
	</div>
	
	<div id="reply-container">
		<h2>Reply</h2>
		<p>* 비방 및 욕설, 도배글 등은 관리자에 의해 삭제될 수 있으니 주의하시길 바랍니다. *</p>
		
		
		<div id="reply">
			
		</div>
		
	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>