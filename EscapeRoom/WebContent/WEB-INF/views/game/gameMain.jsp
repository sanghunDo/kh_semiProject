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
   font-family:'Noto Serif KR', serif;
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

#store{
	position:relative;
	margin:0 auto;
	top:-30px;
	width:700px;
	height:600px;
	background:white;
	box-shadow: 5px 5px 50px;
	border-radius:30px;
}

#store-Top{
	padding-top:50px;
	width:200px;
	height:35px;
	margin:0 auto;
    text-align: center;	
}

#item{
	width:35px;
	height:35px;
}

#userCoin, #hintPaper{
	position:relative;
	top:-10px;
	font-size:20px;
}

#store-Help{
	font-size:25px;
	text-align:center;
}

h1{
	text-align:center;
	padding-top:40px;
}

#game-Help{
	text-align:center;
	padding-top:10px;
	font-size:20px;
}

#haha{
	font-size:30px;
	display:block;
	margin:0 auto;
}

#myStore-Btn{
	border:1px solid black;
	border-radius:20px;
	background:black;
	color:white;
	box-shadow:2px 2px 20px gray;
	width:300px;
	height:70px;
	text-align:center;
	cursor:pointer;
	margin:0 auto;
	margin-top:30px;
}

h2{
	display:inline-block;
	margin:0;
	margin-top:15px;
}

#price{
	width:40px;
	height:40px;
	position:relative;
	top:11px;
}

</style>
</head>
<body>
<img src="<%=request.getContextPath() %>/images/game/gameMain/game_start_again.jpeg" alt="" id="back-ground"/>
<div id="wrap">
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
	
	<!-- 상점 -->
<%-- <div id="store">
		<div id="store-Top">
			<img id="item" src="<%=request.getContextPath()%>/images/coin.png" alt="" />
			&nbsp;&nbsp;<span id="userCoin">50</span>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<img id="item" src="<%=request.getContextPath()%>/images/hint_paper.png" alt="" />
			&nbsp;&nbsp;<span id="hintPaper">3</span>
		</div>
		
		<p id="store-Help">힌트쪽지를 구매할 수 있습니다.</p>
		<div id="myStore-Btn">
			<h2>쪽지 구매하기</h2>&nbsp;&nbsp;&nbsp;
			<img id="price" src="<%=request.getContextPath() %>/images/coin.png" alt="" />
			<h2>50</h2>
		</div>
		
		<p id="store-Help">구매한 쪽지의 내용은 랜덤입니다.<br>
			뽑은 쪽지가 얼마나 유용할지는 알 수 없으며,<br>
			쪽지를 읽으면 보유 쪽지수가 차감됩니다.<br>
			(쪽지는 보관되지 않습니다.)</p>
		<div id="myStore-Btn">
			<h2>쪽지 읽기</h2>&nbsp;&nbsp;&nbsp;
			<img id="price" src="<%=request.getContextPath() %>/images/hint_paper.png" alt="" />
			<h2>1</h2>
		</div>
	</div> --%>
	
	<!-- 도움말 -->
	<div id="store">
		<div id="game-Help">
			<h1>&lt; 도 움 말 &gt;</h1>
			<span>방 안에 있는 단서들과 아이템들을 이용하여<br>
				주어진 이 공간을 탈출하는 게임입니다.<br>
				단서는 물건 들을 클릭하면 얻을 수 있습니다.<br><br>
				단, 비밀번호나 열쇠 등으로 잠겨있는 곳은 직접 풀어야 합니다.<br><br>
				열쇠 등의 각종 도구를 얻게되면<br>
				화면 하단의 인벤토리로 옮겨지며<br>
				필요할 때 획득한 아이템을 클릭하여 사용할 수 있습니다.<br><br></span>
			<span id="haha">당신이 이 방에서 탈출할 수 있기를.<br>ESCAPE, IF YOU CAN.</span>
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
var hour = 0;
var minute = 0;
var sec = 0;
var timer = setInterval(function(){
	++sec;
	if(sec>59) ++minute;
	if(minute>59) ++hour;
	$("#time").text(hour+"시간 "+minute+"분 "+sec+"초");
}, 1000);

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