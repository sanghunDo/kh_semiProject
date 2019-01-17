<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ESCAPE, IF YOU CAN.</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/game/gameEnding.css" />
</head>
<body>
<audio autoplay src="<%=request.getContextPath()%>/audio/footprint.wav"></audio>
<audio id="gun" src="<%=request.getContextPath()%>/audio/gun.mp3"></audio>

<img src="" alt="" id="background"/>
<div id="ending">
	<div id="msgBox" class="me">
		<div><h2></h2></div>
	</div>
</div>
<script>
$(window).on('keyup', function(e){
	if(e.keyCode==87&&isCtrl==true){
		opener.parent.sessionStorage.removeItem("game");
	}
}).on('beforeunload', function(){
	opener.parent.sessionStorage.removeItem("game");
});

$(function(){
	$("body").hide();
	
	setTimeout(function(){
		$("body").fadeIn(2000);		
	}, 2000);
});

$("#ending").on('click', {cnt:0} ,function(e){
	var cnt = e.data.cnt++;
	var target = $("#ending").find("h2");
	if(cnt==3) $("#msgBox").removeClass("me");
	if(cnt==4) $("#msgBox").addClass("me");
	if(cnt==5) $("#msgBox").removeClass("me");
	if(cnt==8) $("#msgBox").addClass("me");
	if(cnt==9) $("#msgBox").removeClass("me");
	if(cnt==10) $("#msgBox").addClass("me");
	
	if(cnt==11){
		$("#gun")[0].play();
		setTimeout(function(){
			$("body, #background").css({"animation": "bang .1s", "animation-iteration-count": "5"});			
		}, 700);
		$(this).parent().fadeOut(4000);
		setTimeout(function(){
			location.href="<%=request.getContextPath()%>/game/endingCredit";
		}, 5000);
	}
	
	//대사 테이블에서 한 문장씩 가져옴.
	$.ajax({
		url:"<%=request.getContextPath()%>/game/badEnding",
		data: "index="+cnt,
		type: "get",
		dataType: "json",
		success: function(data){
			target.removeAttr("style");
			//대사에 해당되는 이미지가 있던 없던 불러와서 이미지를 추가함. 이미지가 없으면 "", 있으면 해당 파일이름.
			if(data.fileName){
				$("#background").attr("src", "<%=request.getContextPath()%>/images/game/badEnding/"+data.fileName).fadeIn(1500);
			}

			target.text(data.content);
			target.parent().css("width",target.outerWidth());
			var length = data.content.length;
			target.attr("style", "animation:typing "+(length/40)+"s steps("+length+", end)");
		}
	});
});

/* 클리어 기록이 있을 시 엔딩 스킵 가능 */
$(window).on('keyup', function(e){
	if(e.keyCode==32 || e.keyCode==13)
		$("#ending").trigger('click');
	if(e.keyCode==27){
		if(confirm("엔딩을 스킵하시겠습니까?")){
			location.href="#";
		}
	}
});
</script>
</body>
</html>