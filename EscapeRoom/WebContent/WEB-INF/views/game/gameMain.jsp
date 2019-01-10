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
<%@ include file='/WEB-INF/views/game/gameBackground.jsp' %>
<div id="wrap">
	<input type="hidden" value=0 />
		<div id="pause-menu-container">
			<div id="pause-menu"></div>
			<div id="store"></div>
			<div id="help"></div>
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
	$("#pause-menu-container").addClass("paused");
	$("#message").html("<h2>"+msg+"</h2>").show();
	setTimeout(function(){
		$("#pause-menu-container").removeClass("paused");
		$("#message").hide();
	}, 1500);
};
function show_record(){
	var time = $("[type=hidden]").val();
	var h = Math.floor(time/3600);
	var m = Math.floor((time%3600)/60);
	var s = (time%3600)%60;
	$("#time").text(h+"시간 "+m+"분 "+s+"초");	
};
function show_store(){
	$("#btn-store").on('click', function(){
		if(<%=loggedInMember!=null%>){
			show_pause_menu("store");
			$("#store").slideDown();
		}
		else{show_message("로그인시 이용가능한 서비스입니다.");}
	});
};
function show_help(){
	$("#btn-help").on('click', function(){
		show_pause_menu("help");
		$("#help").slideDown();
	});
};
function active_close(){
	$(".close").on('click', function(){
		$(this).parent().slideUp();
	});
};
function coin_hint_refresh(){
	$.ajax({
		url: "<%=request.getContextPath()%>/game/coinHintRefresh",
		type: "get",
		dataType: "json",
		success: function(data){
			$("#userCoin").text(data.coin);
			$("#hintPaper").text(data.hintPaper);
		}
	});
};
function buy_hint_paper(){
	$("#myStore-Btn").on('click', function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/game/buyHint",
			type:"get",
			success: function(result){
				if(result === "true"){
					show_message("구매가 완료되었습니다.");
					coin_hint_refresh();
				}
				else
					show_message("보유 코인이 부족합니다.");
			}
		});
	});
};
function show_pause_menu(menuName){
	$.ajax({
		url:"<%=request.getContextPath()%>/game/pauseMenu",
		data: "menuName="+menuName,
		type: "post",
		dataType: "html",
		success: function(data){
			$("#"+menuName).html(data);
			add_event_listener();
		}
	});
};
function active_esc(){
	$("#btn-esc").on('click', function(){
		$("#pause-menu-container").css("opacity", .4);
		$("#message").html("<h2>게임을 종료하시겠습니까?</h2><button value='1'>◎ 확인</button><button>X 취소</button>").show();
		$("#message").find("button").each(function(){
			$(this).click(function(){
				if($(this).val()==1){
					opener.parent.sessionStorage.removeItem("game");
					self.close();
				}
				else {
					$("#pause-menu-container").css("opacity", 1);
					$(this).parent().hide();
				}
			});
		});
	});
};
function add_event_listener(){
	show_store();
	show_help();
	active_close();
	buy_hint_paper();
	show_record();
	active_esc();
};
$("#back-ground").fadeOut(3000);
setTimeout(function(){
	$("#back-ground").attr("src", "<%=request.getContextPath()%>/images/game/gameMain/test.png").show();
	$("#wrap").show();
}, 3001);

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
	var $target = $(this);
	var cnt = e.data.flag++;
	$("#back-ground").toggleClass("paused");
	if(cnt%2!=0){
		$target.children().attr("src", "<%=request.getContextPath()%>/images/game/gameMain/play.png");
		$("#pause-menu-container").show();
		show_pause_menu("pause-menu");
		clearInterval(record);
	}
	else{
		$target.children().attr("src", "<%=request.getContextPath()%>/images/game/gameMain/pause.png");
		$("#pause-menu-container").hide();
		$("#pause-menu").html("");
		record = setInterval(timer, 1000);
	}
});

$(window).on('keyup', function(e){
	if(e.keyCode==27){
		$("#pause").trigger("click");
	}
	if(e.keyCode==87&&isCtrl==true){
		opener.parent.sessionStorage.removeItem("game");
	}
}).on('beforeunload', function(){
	opener.parent.sessionStorage.removeItem("game");
});
</script>
</body>
</html>