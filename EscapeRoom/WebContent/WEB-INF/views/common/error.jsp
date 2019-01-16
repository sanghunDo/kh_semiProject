<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    <!-- isErrorPage="true"이면 내장객체를 사용할 수 있다.  -->
<%
	String errMsg = exception!=null?exception.getMessage():String.valueOf(response.getStatus());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ESCAPE, IF YOU CAN 오류페이지</title>
<style>
body{
	text-align: center;
}
#errMsg{
	color: red;
	font-size: 2em;
}
</style>
</head>
<body>
	<h2>ESCAPE, IF YOU CAN 오류페이지</h2>
	<p><span id="errMsg"><%=errMsg %></span></p>
	<a href="<%=request.getContextPath()%>/home">Home으로 돌아가기</a>
</body>
</html>