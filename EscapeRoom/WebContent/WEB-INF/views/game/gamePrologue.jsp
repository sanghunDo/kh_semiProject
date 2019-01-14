<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String userId = (String)request.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>ESCAPE, IF YOU CAN.</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/game/gamePrologue.css" />
<script>
window.onload=function(){
	window.focus();
	window.moveTo(0,0);
	window.resizeTo(1024,768);
};
</script>
</head>
<body>
<img src="" alt="" id="background"/>
<div id="warning">
	<h1>! WARNING !</h1><br />
	<p>본 게임은 다소 잔인하거나 불쾌한 장면이 포함되어 있을 수 있습니다.<br><br>
	   노약자, 어린이, 임산부이신 분들께는 게임 플레이를 권장하지 않습니다.<br><br>
	   또한, 장시간 플레이 후에는 휴식을 취해주시기 바랍니다.<br><br>
	   - 게임의 등장인물이나 배경은 모두 실제 인물이나 단체와 무관합니다. -</p>
</div>
<div id="prologue">
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

	setTimeout(function(){
		$("#warning").css("display", "none");
		$("#prologue").fadeIn(1000);
	}, 5000);
	
	$("#prologue").on('click', {cnt:0} ,function(e){
		var cnt = e.data.cnt++;
		var target = $("#prologue").find("h2");
		if(cnt==4){
			$("#msgBox").removeClass("me");
		}
		if(cnt==17){
			$("body, #background").css({"animation": "bang .1s", "animation-iteration-count": "3"});
			$(this).parent().fadeOut(3000); //마지막 대사 이후 클릭시 메인게임으로 이동.
			setTimeout(function(){
				location.href="<%=request.getContextPath()%>/game/gameMain?userId=<%=userId%>";
			}, 3000);
		}
		//대사 테이블에서 한 문장씩 가져옴.
		$.ajax({
			url:"<%=request.getContextPath()%>/game/prologue",
			data: "index="+cnt,
			type: "get",
			dataType: "json",
			success: function(data){
				target.removeAttr("style");
				//대사에 해당되는 이미지가 있던 없던 불러와서 이미지를 추가함. 이미지가 없으면 "", 있으면 해당 파일이름.
				if(data.fileName!=""){
					$("#background").attr("src", "<%=request.getContextPath()%>/images/game/prologue/"+data.fileName).fadeIn(1500);
				}
				
				target.text(data.content);
				target.parent().css("width",target.outerWidth());
				var length = data.content.length;
				target.attr("style", "animation:typing "+(length/40)+"s steps("+length+", end)");
			}
		});
	});
	$(window).on('keyup', function(e){
		if(e.keyCode==32 || e.keyCode==13)
			$("#prologue").trigger('click');
		if(e.keyCode==27){
			if(confirm("프롤로그를 스킵하시겠습니까?")){
				location.href="<%=request.getContextPath()%>/game/gameMain?userId=<%=userId%>";
			}
		}
	});
</script>
</body>
</html>