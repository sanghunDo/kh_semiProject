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
div#wrap{
	position: relative;
	width: 100%;
	height: 100%;
	display: none;
}
img#back-ground{
	position: fixed;
	width: 100%;
	height: 100%;
}
div#inventory{
	position: relative;
	width: 70%;
	height: 22%;
	top: 100%;
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
	width: 535px;
	height: 75%;
	top: 7%;
	margin: 0 auto;
	overflow: hidden;
}
div#inventory div#obj-list{
	position: relative;
	width: 200%;
	height: 100%;
	white-space: nowrap;
}
div#inventory div#obj-list div{
	position: relative;
	display: inline-block;
	width: 90px;
	height: 90px;
	top: 13%;
	margin-right: 12.5px;
	border: 1px solid black;
}
div#inventory div#obj-list div#obj5{
	margin-right: 0;
}
div#inventory:before{
	content:"open"; 
	position: absolute;
	width: 100%;
	height: 15%; 
	top: -50px;
	font-size: 30px;
	color: gray;
	text-align: center;
	cursor: pointer;
}
div#inventory.on:before{content:"close";}
div#pause{
	position: absolute;
	left: 960px;
	top: 10px;
}
div#pause img{width: 35px;}
img#back-ground.paused{
	opacity: .5;
}
div#pause-menu-container{
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	display: none;
}
div#pause-menu-container div#pause-menu{
	position: relative;
    width: 20%;
    height: 50%;
    top: 25%;
    border: 1px solid;
    border-radius: 5px;
    margin: 0 auto;
    background: black;
    box-shadow: 5px 5px 50px;
}
div#pause-menu ul{
	list-style: none;
}
div#pause-menu ul li{
	width: 120px;
	height: 40px;
	color: white;
	border: 4px inset white;
	text-align: center;
	margin-bottom: 20px;
	background: lightgray;
}
</style>
</head>
<body>
<img src="<%=request.getContextPath() %>/images/game/gameMain/game_start_again.jpeg" alt="" id="back-ground"/>
<div id="wrap">
	<div id="pause-menu-container">
		<div id="pause-menu">
			<ul>
				<li>a</li>
				<li>b</li>
				<li>c</li>
				<li>d</li>
				<li>e</li>
			</ul>
		</div>
	</div>
	<div id="pause"><img src="<%=request.getContextPath() %>/images/game/gameMain/pause.png" alt="" /></div>
	<div id="inventory">
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
$("#back-ground").fadeOut(2000);
setTimeout(function(){
	$("#back-ground").attr("src", "<%=request.getContextPath()%>/images/game/gameMain/test.png").show();
	$("#wrap").show();
}, 2500);

$("#next").click(function(e){
	$(this).css("visibility", "hidden").siblings("#prev").css("visibility", "visible");
	$("#obj-list").animate({"left":"-100%"});
});
$("#prev").click(function(){
	$(this).css("visibility", "hidden").siblings("#next").css("visibility", "visible");
	$("#obj-list").animate({"left":0});
});
$("#inventory").on('click',{flag:0},function(e){
	var cnt = e.data.flag++;
	if(cnt%2==0) $(this).animate({"top":"80%"});
	else $(this).animate({"top":"100%"});
	$(this).toggleClass('on');
	$(this).children().click(function(e){
		e.stopPropagation();
	});
});
$("#pause").on("click", {flag:1}, function(e){
	var cnt = e.data.flag++;
	$("#back-ground").toggleClass("paused");
	if(cnt%2!=0){
		$(this).children().attr("src", "<%=request.getContextPath()%>/images/game/gameMain/play.png");
		$("#pause-menu-container").show();
	}
	else{
		$(this).children().attr("src", "<%=request.getContextPath()%>/images/game/gameMain/pause.png");
		$("#pause-menu-container").hide();
	}
});
</script>
</body>
</html>