<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="semi.member.model.vo.*" %>
<%
	Member loggedInMember = (Member)request.getAttribute("loggedInMember");
%>
<div id="store-Top">
	<img id="item" src="<%=request.getContextPath()%>/images/coin.png"
		alt="" /> &nbsp;&nbsp;<span id="userCoin"><%=loggedInMember!=null?loggedInMember.getCoin():"-" %></span>
	&nbsp;&nbsp;&nbsp;&nbsp; <img id="item"
		src="<%=request.getContextPath()%>/images/hint_paper.png" alt="" />
	&nbsp;&nbsp;<span id="hintPaper"><%=loggedInMember!=null?loggedInMember.getHintPaper():"-" %></span>
</div>
<p id="store-Help">힌트쪽지를 구매할 수 있습니다.</p>
<div id="myStore-Btn">
	<h2>쪽지 구매하기</h2>
	&nbsp;&nbsp;&nbsp; <img id="price"
		src="<%=request.getContextPath()%>/images/coin.png" alt="" />
	<h2>50</h2>
</div>
<p id="store-Help">
	구매한 쪽지의 내용은 랜덤입니다.<br> 뽑은 쪽지가 얼마나 유용할지는 알 수 없으며,<br> 쪽지를
	읽으면 보유 쪽지수가 차감됩니다.<br> (쪽지는 보관되지 않습니다.)
</p>
<div id="myStore-Btn">
	<h2>쪽지 읽기</h2>
	&nbsp;&nbsp;&nbsp; <img id="price"
		src="<%=request.getContextPath()%>/images/hint_paper.png" alt="" />
	<h2>1</h2>
</div>
<div class="close">=</div>