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
   background: lightgray;
}
html{
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
div#inventory{
	position: relative;
	width: 70%;
	height: 22%;
	top: 77%;
	margin: 0 auto;
	background: lightgray;
	opacity: .7;
	border: 2px solid gray;
	border-radius: 22px;
}
div#inventory div#prev, div#inventory div#next{
	position: relative;
	width: 5%;
	height: 100%;
	opacity: .5;
	background: gray;
}
div#inventory div#prev{float:left; border-radius: 19px 0 0 0; visibility: hidden;}
div#inventory div#prev span{display: inline-block; margin: 57px 0 0 11px; cursor: cursor;}
div#inventory div#next{float:right; border-radius: 0 19px 0 0;}
div#inventory div#next span{display: inline-block; margin: 57px 0 0 8px; cursor: cursor;}
div#inventory div#prev:hover, div#inventory div#next:hover{cursor: pointer;opacity: 1;}
div#inventory div#prev:hover span, div#inventory div#next:hover span{transform: scale(1.2);}
div#inventory div#obj-list-container{
	position: relative;
	width: 88%;
	height: 75%;
	top: 7%;
	margin: 0 auto;
	overflow: hidden;
}
div#inventory div#obj-list{
	position: relative;
	width: 200%;
	height: 100%;
	border: 1px solid black;
}
</style>
</head>
<body>
<div id="back-ground">
	<img src="<%=request.getContextPath() %>/images/game/gameMain/game_start_again.jpeg" alt="" />
	<div id="inventory">
		<input type="hidden"/>
		<div id="prev"><span>◀</span></div>
		<div id="next"><span>▶</span></div>
		<div id="obj-list-container">
			<div id="obj-list">
				<div id="obj1"></div>
				<div id="obj2"></div>
				<div id="obj3"></div>
				<div id="obj4"></div>
				<div id="obj5"></div>
				<div id="obj6"></div>
				<div id="obj7"></div>
				<div id="obj8"></div>
				<div id="obj9"></div>
				<div id="obj10"></div>
			</div>
		</div>
	</div>
</div>
<script>
$("#back-ground img").fadeOut(2000);
setTimeout(function(){
	$("#back-ground img").attr("src", "").show();
}, 2500);

$("#next").click(function(){
	$(this).css("visibility", "hidden").siblings("#prev").css("visibility", "visible");
	$("#obj-list").animate({"left":"-100%"});
});
$("#prev").click(function(){
	$(this).css("visibility", "hidden").siblings("#next").css("visibility", "visible");
});
</script>
</body>
</html>