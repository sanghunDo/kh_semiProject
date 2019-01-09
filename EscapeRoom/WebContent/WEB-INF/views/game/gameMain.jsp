<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="semi.member.model.vo.*" %>
<%
	Member loggedInMember = (Member)session.getAttribute("loggedInMember");
%>
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
					<li><h3>플레이 시간</h3>
						<span id="time"></span></li>
					<li>
						<div class="button_base b06_3d_swap" id="btn-store">
							<div>상점</div>
							<div>상점</div>
						</div>
					</li>
					<li>
						<div class="button_base b06_3d_swap" id="btn-help">
							<div>도움말</div>
							<div>도움말</div>
						</div>
					</li>
					<li>
						<div class="button_base b06_3d_swap">
							<div>게임종료</div>
							<div>게임종료</div>
						</div>
					</li>
				</ul>
			</div>
			<div id="store">
				<div id="store-Top">
					<img id="item" src="<%=request.getContextPath()%>/images/coin.png"
						alt="" /> &nbsp;&nbsp;<span id="userCoin">50</span>
					&nbsp;&nbsp;&nbsp;&nbsp; <img id="item"
						src="<%=request.getContextPath()%>/images/hint_paper.png" alt="" />
					&nbsp;&nbsp;<span id="hintPaper">3</span>
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
			</div>
			<!-- 도움말 -->
			<div id="help">
				<div id="game-Help">
					<h1>&lt; 도 움 말 &gt;</h1>
					<span>방 안에 있는 단서들과 아이템들을 이용하여<br> 주어진 이 공간을 탈출하는 게임입니다.<br>
						단서는 물건 들을 클릭하면 얻을 수 있습니다.<br>
					<br> 단, 비밀번호나 열쇠 등으로 잠겨있는 곳은 직접 풀어야 합니다.<br>
					<br> 열쇠 등의 각종 도구를 얻게되면<br> 화면 하단의 인벤토리로 옮겨지며<br> 필요할
						때 획득한 아이템을 클릭하여 사용할 수 있습니다.<br>
					<br></span> <span id="haha">당신이 이 방에서 탈출할 수 있기를.<br>ESCAPE,
						IF YOU CAN.
					</span>
				</div>
				<div class="close">=</div>
			</div>
		</div>
		<div id="message"></div>
		<div id="pause"><img src="<%=request.getContextPath()%>/images/game/gameMain/pause.png" alt="" /></div>
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
function show_message(msg){
	$("#pause-menu-container").css("opacity", .4);
	$("#message").html("<h2>"+msg+"</h2>").show();
	setTimeout(function(){
		$("#pause-menu-container").css("opacity", 1);
		$("#message").hide();
	}, 1500);
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
$("#btn-store").on('click', function(){
	if(<%=loggedInMember==null%>){
		show_message("로그인시 이용가능한 서비스입니다.");
		return;
	}
	$("#store").slideDown();
});
$("#btn-help").on('click', function(){
	$("#help").slideDown();
});
$(".close").on('click', function(){
	$(this).parent().slideUp();
});
$("#myStore-Btn").on('click', function(){
	$.ajax({
		url:"<%=request.getContextPath()%>/game/buyHint",
		<%if(loggedInMember!=null){%>
		data: "userId="+<%=loggedInMember.getUserId()%>,
		<%}%>
		type:"get",
		success: function(result){
			if(result)
				show_message("구매가 완료되었습니다.");
			else
				show_message("보유 코인이 부족합니다.");
		}
	});
});
</script>
</body>
</html>