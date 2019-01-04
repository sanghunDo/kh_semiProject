<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Enter</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css" />
<style>
div.on{
	background-image: url('<%=request.getContextPath()%>/images/index.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}
</style>
<script>
$(function(){
	//페이지 서서히 켜지는 효과, body, html크기를 브라우저 크기에 따라 resize.
	$("body").fadeIn(2000);
	
	//제목에 마우스 오버 시 메뉴 나옴.
	$("#title").fadeIn(4000).on('mouseenter', function(){
        $(".enterRoom").fadeIn(2000);
	});
		
	//배경 깜빡거리는 효과
	setInterval(function(){
		$("#backGround").removeClass("on");
		setTimeout(function(){
			$("#backGround").addClass("on");
			setTimeout(function(){
				$("#backGround").removeClass("on");
				setTimeout(function(){
					$("#backGround").addClass("on");
				}, 200)
			}, 200)
		}, 200)
	}, 3000);
})
</script>
</head>
<body>
<div id="backGround" class="on">
	<header>
		<div id="title">Escape, if you can.</div>
	</header>
	<section>
        <div class="enterRoom">
            <div>Enter Room</div>
            <div onclick="location.href='<%=request.getContextPath()%>/main'">
                <div>Enter Room</div>
                <div>Enter Room</div>
                <div>Enter Room</div>
            </div>
        </div>
    </section>    
</div>
</body>
</html>