<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
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
	padding: 0;
	font-family:'Noto Serif KR', serif;
}
div#pause-menu ul li{
	width: 100%;
	height: 50px;
	margin: 0 auto;
	margin-bottom: 40px;
	text-align: center;
}
div#pause-menu ul li:first-of-type{
	font-size: 130%;
	margin-bottom: 75px;
	cursor: default;
}

div#pause-menu ul li:first-of-type h3{
	color: white;
	margin: 0 0 5px 0;
}
div#pause-menu ul li:first-of-type span{
	color: white;
}

@media screen and (max-width: 1260px) {
    .back {
        width: 50%;
    }
}

@media screen and (max-width: 840px) {
    .back {
        width: 100%;
    }
}

.button_base {
    margin: 0;
    border: 0;
    font-size: 20px;
    position: relative;
    top: 0%;
    left: 61%;
    margin-top: -25px;
    margin-left: -100px;
    width: 160px;
    height: 50px;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
}

.button_base:hover {
    cursor: pointer;
}

.b06_3d_swap {
    perspective: 500px;
    -webkit-perspective: 500px;
    -moz-perspective: 500px;
    transform-style: preserve-3d;
    -webkit-transform-style: preserve-3d;
}

.b06_3d_swap div {
    position: absolute;
    text-align: center;
    width: 100%;
    height: 50px;
    padding: 10px;
    border: #000000 solid 1px;
    pointer-events: none;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}

.b06_3d_swap div:nth-child(1) {
    color: #ffffff;
    background-color: #000000;
    transform: translateZ(0px);
    -webkit-transform: translateZ(0px);
    -moz-transform: translateZ(0px);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b06_3d_swap div:nth-child(2) {
    color: #000000;
    background-color: #ffffff;
    transform: rotateX(90deg);
    -webkit-transform: rotateX(90deg);
    -moz-transform: rotateX(90deg);
    transition: all 0.2s ease 0.05s;
    -webkit-transition: all 0.2s ease 0.05s;
    -moz-transition: all 0.2s ease 0.05s;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b06_3d_swap:hover div:nth-child(1) {
    color: #ffffff;
    background-color: #808080;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: translateZ(-200px);
    -webkit-transform: translateZ(-200px);
    -moz-transform: translateZ(-200px);
}

.b06_3d_swap:hover div:nth-child(2) {
    color: #000000;
    transition: all 0.2s ease 0.05s;
    -webkit-transition: all 0.2s ease 0.05s;
    -moz-transition: all 0.2s ease 0.05s;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
}
</style>
</head>
<body>
<img src="<%=request.getContextPath() %>/images/game/gameMain/game_start_again.jpeg" alt="" id="back-ground"/>
<div id="wrap">
	<input type="hidden" value=0 />
	<div id="pause-menu-container">
		<div id="pause-menu">
			<ul>
				<li><h3>플레이 시간</h3><span id="time">213131</span></li>
				<li>
				    <div class="button_base b06_3d_swap">
				        <div>상점</div>
				        <div>상점</div>
				    </div>
				</li>
				<li>
					<div class="button_base b06_3d_swap">
				        <div>도움말</div>
				        <div>도움말</div>
				    </div></li>
				<li>
					<div class="button_base b06_3d_swap">
				        <div>게임종료</div>
				        <div>게임종료</div>
				    </div>
				</li>
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
function timer(){
	
}
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