<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String userId = (String)request.getAttribute("userId"); int record = (int)request.getAttribute("record"); %>
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
<input type="hidden" value=<%=record+1 %> />
<img src="" alt="" id="background"/>
<div id="ending">
	<div id="msgBox" class="none">
		<div>
			<h2>문밖은 고요한 정적과 찬 공기만 가득하다.</h2>
			<h2>문앞에 총 한 자루가 놓여있다.</h2>
			<h2>총을 획득하시겠습니까?</h2>
			<table id="buttonTab">
				<tr>
					<td><button class="choice" id="yes">예</button></td>
					<td><button class="choice" id="no">아니오</button></td>
				</tr>
				<tr>
					<td colspan="2"><h4>( 총의 획득까지 클리어시간으로 기록됩니다. )</h4></td>
				</tr>			
			</table>
		</div>
	</div>
</div>
<script>
var rInterval;
$(function(){
	var sec = $("[type=hidden]").val();
	rInterval = setInterval(function(){
		$("[type=hidden]").val(++sec);	
	}, 1000);
});
$(window).on('keyup', function(e){
	if(e.keyCode==87&&isCtrl==true){
		opener.parent.sessionStorage.removeItem("game");
	}
}).on('beforeunload', function(){
	opener.parent.sessionStorage.removeItem("game");
});

/* $(function(){
	$("#msgBox").find("h2").css("display", "none");
	$("#buttonTab").css("display", "none");
}); */

/* $("#ending").on('click', {cnt:0} ,function(e){
	var cnt = e.data.cnt++;
	var target = $("#ending").find("h2");
	target.text(data.content);
	target.parent().css("width",target.outerWidth());
	var length = data.content.length;
	target.attr("style", "animation:typing "+(length/40)+"s steps("+length+", end)");
}); */

$("#yes").on("click", function(){
	clearInterval(rInterval);
	var record = $("[type=hidden]").val();
	location.href = "<%=request.getContextPath()%>/game/goToBadEnding?userId=<%=userId%>&record="+record;
});

$("#no").on("click", function(){
	clearInterval(rInterval);
	var record = $("[type=hidden]").val();
	location.href = "<%=request.getContextPath()%>/game/goToTrueEnding?userId=<%=userId%>&record="+record;
});


</script>
</body>
</html>