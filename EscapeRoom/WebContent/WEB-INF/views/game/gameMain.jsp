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
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/game/gameObject.css" />
</head>
<body>
<img src="<%=request.getContextPath() %>/images/game/gameMain/game_start_again.jpeg" alt="" id="back-ground"/>
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
		<div id="hint">
			<img src="<%=request.getContextPath() %>/images/hint_paper.png" id="hint-paper" />
			<div id="close-hint">X</div>
			<div></div>
		</div>
		<div id="coment">
			<div><h2></h2></div>
		</div>
</div>
<%@ include file="/WEB-INF/views/game/gameController.jsp" %>
<script>
$("#back-ground").fadeOut(3000);
setTimeout(function(){
	$("#back-ground").attr("src", "<%=request.getContextPath()%>/images/game/gameMain/back/background.png").show();
	$("#wrap").show();
}, 3100);
var record = setInterval(timer, 1000);
function timer(){
	var sec = $("[type=hidden]").val();
	$("[type=hidden]").val(++sec);
};
function show_message(msg, flag){
	$("#pause-menu-container").addClass("paused");
	$("#message").html(msg).show();
	
	if(flag){
		setTimeout(function(){
			$("#pause-menu-container").removeClass("paused");
			$("#message").hide();
		}, 1500);
	}
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
		else{show_message("<h2>로그인시 이용가능한 서비스입니다.</h2>", true);}
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
	$("#btn-buyHint").on('click', function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/game/buyHint",
			type:"post",
			success: function(result){
				if(result === "true"){
					show_message("<h2>구매가 완료되었습니다.</h2>", true);
					coin_hint_refresh();
				}
				else
					show_message("<h2>보유 코인이 부족합니다.</h2>", true);
			},
			error: function(){
				show_message("<h2>예기치 못한 오류가 발생했습니다.</h2>");
			}
		});
	});
};
function use_hint_paper(){
	$("#btn-useHint").on('click', function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/game/useHint",
			type:"post",
			success: function(data){
				if(data === "true"){
					show_message("<h2>쪽지를 뽑는중입니다.</h2>", false);
					get_hint();
					$("#message h2").css({"animation":"bling .7s", "animation-iteration-count":"3"});
					setTimeout(function(){
						$("#message").hide();
						$("#hint").show();
					}, 2500);
					coin_hint_refresh();
				}else{
					show_message("<h2>쪽지를 구매해주세요.</h2>", true);
				}
			},
			error: function(){
				show_message("<h2>예기치 못한 오류가 발생했습니다.</h2>");
			}
		});
	});
};
function close_hint_paper(){
	$("#close-hint").on('click', function(){
		$("#hint").hide();
		$("#hint div:last").text("");
		$("#pause-menu-container").removeClass("paused");
	});
};
function get_hint(){
	$.ajax({
		url: "<%=request.getContextPath()%>/game/getHint",
		type:"post",
		success: function(data){
			$("#close-hint+div").text(data);
		}
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
		show_message("<h2>게임을 종료하시겠습니까?</h2><button value='1'>◎ 확인</button><button>X 취소</button>", false);
		$("#message").find("button").each(function(){
			$(this).click(function(){
				if($(this).val()==1){
					opener.parent.sessionStorage.removeItem("game");
					self.close();
				}
				else {
					$("#pause-menu-container").removeClass("paused");
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
	use_hint_paper();
	show_record();
	active_esc();
	close_hint_paper();
};

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
$("#obj-list div").each(function(){
	$(this).on('click', function(){
		$(this).toggleClass("selected");
		$(this).siblings().removeClass("selected");
	});
});
$("#pause").on("click", {flag:1}, function(e){
	var $target = $(this);
	var cnt = e.data.flag++;
	$("img").not("#pause img, #hint img").toggleClass("paused");
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
	confirm("");
	opener.parent.sessionStorage.removeItem("game");
});
</script>
</body>
</html>