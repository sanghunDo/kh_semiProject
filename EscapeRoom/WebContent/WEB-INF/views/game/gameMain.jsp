<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/game/gameMain.css" />
</head>
<body>
<img src="<%=request.getContextPath() %>/images/game/gameMain/game_start_again.jpeg" alt="" id="back-ground"/>
<div id="wrap">
	<input type="hidden" value=0 />
	<div id="pause-menu-container">
		<div id="pause-menu">
			<ul>
				<li><h3>플레이 시간</h3><span id="time"></span></li>
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
var record = setInterval(timer, 1000);
function timer(){
	var sec = $("[type=hidden]").val();
	$("[type=hidden]").val(++sec);
};
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
		clearInterval(record);
		var time = $("[type=hidden]").val();
		var h = Math.floor(time/3600);
		var m = Math.floor((time%3600)/60);
		var s = (time%3600)%60;
		$("#time").text(h+"시간 "+m+"분 "+s+"초");
	}
	else{
		$(this).children().attr("src", "<%=request.getContextPath()%>/images/game/gameMain/pause.png");
		$("#pause-menu-container").hide();
		record = setInterval(timer, 1000);
	}
});

</script>
</body>
</html>