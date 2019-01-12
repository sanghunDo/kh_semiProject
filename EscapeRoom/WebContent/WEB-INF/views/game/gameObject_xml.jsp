<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, semi.game.model.vo.MainObj" %>
<%
	List<MainObj> objList = (List<MainObj>)request.getAttribute("objList");
%>
<map>
<%if(!objList.isEmpty()) {%>
	<% for(MainObj m : objList){%>
		<obj>
			<objNo><%=m.getObjNo() %></objNo>
			<objName><%=m.getObjName() %></objName>
			<seconedName><%=m.getSecondName() %></seconedname>
			<thirdname><%=m.getThirdName() %></thirdname>
			<position><%=m.getPosition() %></position>
			<objlevel><%=m.getObjLevel() %></objlevel>
			<refNo><%=m.getRefNo() %></refNo>
			<isItem><%=m.getIsItem() %></isItem>
		</obj>
<%}}%>
</map>

