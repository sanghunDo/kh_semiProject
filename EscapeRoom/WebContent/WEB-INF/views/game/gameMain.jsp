<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<style>
body, html{
   width: 1008px;
   height: 704px;
   padding: 0px;
   margin: 0 auto;
   overflow: hidden;
   background: black;
}
div#back-ground{
	position: relative;
	width: 100%;
	height: 100%;
}
div#back-ground img{
	position: relative;
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
<div id="back-ground">
	<img src="<%=request.getContextPath() %>/images/game/gameMain/game_start_again.jpeg" alt="" />
	<div id="inventory">
		
	</div>
</div>
<script>
$("#back-ground img").fadeOut(2000);
setTimeout(function(){
	$("#back-ground img").attr("src", "").show();
}, 2500);
</script>
</body>
</html>