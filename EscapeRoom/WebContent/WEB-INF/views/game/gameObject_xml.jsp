<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, semi.game.model.vo.MainObj" %>
<%
	List<MainObj> objList = (List<MainObj>)request.getAttribute("objList");
	System.out.println(objList);
%>
<map>
<%if(!objList.isEmpty()) {%>
	<% for(MainObj m : objList){%>
		<obj>
			<objNo><%=m.getObjNo() %></objNo>
			<objName><%=m.getObjName() %></objName>
			<coment><%=m.getComent() %></coment>
			<position><%=m.getPosition() %></position>
			<refNo><%=m.getRefNo() %></refNo>
			<isItem><%=m.getIsItem() %></isItem>
		</obj>
<%}}%>
</map>

