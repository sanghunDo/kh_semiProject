<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=ZCOOL+KuaiLe" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Alfa+Slab+One" rel="stylesheet">
<style>
body, html{
	width: 1024px; 
	min-height: 723px;
	margin: 0 auto;
	padding: 0;
	background: black;
}
body{display:none;}
div#backGround{
	position: relative;
	width: 100%;
	height: 100%;
}
div.on{
	background-image: url('<%=request.getContextPath()%>/images/index.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}
header{
	position: relative;
	width: 100%;
	height: 40%;
	top: 3%;
	text-align: center;
}
div{color: white; font-family: 'Do Hyeon', sans-serif;}

div#title{
	font-size : 135px;
	/* font-family: 'ZCOOL KuaiLe', cursive; */
	font-family: 'Alfa Slab One', cursive;
	/* font-weight: bold; */
	text-shadow: 6px 6px 2px gray;
	display: none;
	position: relative;
	width: 80%;
	margin: 0 auto;
	/* opacity: .8; */
	color: lightgray;
	animation-name: titleAni;
	animation-duration: 1s;
	animation-iteration-count: infinite;
}
div#login{position: absolute; left:950px; top: -20px; font-size: 20px; opacity: .7; cursor: pointer;}
div#login:hover{opacity:1; border-bottom: 2px solid white;}
nav#menu{display:none;}
nav#menu ul li{
	display: inline; 
	opacity: .8; 
	margin-right: 10px; 
	font-size: 22px;
	font-family: 'Do Hyeon', sans-serif;
	color: #910303;
	border-bottom: 1px solid #910303;
}
nav#menu ul li>a:link, ul li>a:visited, ul li>a:hover{color: #910303;text-decoration: none;}

nav#menu ul li:hover{
	border-bottom: 2px solid #910303; 
	opacity: 1;
	text-shadow: 2px 2px 2px gray;
}

@keyframes titleAni{
	0%{
		transform: translateX(0px);
	}
	10%{
		transform: translateY(2px);
		text-shadow: 6px 6px 2px maroon;
	}
	25%{
		transform: translateX(2px);
		opacity: .7;
	}
	50%{
		transform: translateX(-2px);
	}
	60%{
		transform: translateY(-2px);
	}
	75%{
		transform: translateX(2px);
		opacity: .7;
	}
	100%{
		transform: translateX(2px);
	}
}
section{
    position: relative;
    width: 100%;
    height: 60%;
    text-align: center;
}
.enterRoom{
    position: absolute;
    left: 412px; 
    top: 250px;
    cursor: pointer;
    display: none;
}
.enterRoom div {
    position: absolute;
    text-align: center;
    width: 200px;
    height: 50px;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    font-size: 20px;
    border-radius: 30% 0 30% 0;
}

.enterRoom div:nth-child(1) {
    color: #000000;
       background-color: gray;
    -webkit-transition: all 0.1s ease;
    padding: 10px;
   /*  border: #000000 solid 1px; */
   opacity: .7;
}

.enterRoom div:nth-child(2) {
    overflow: hidden;
}

.enterRoom div:nth-child(2) div {
    position: absolute;
    text-align: center;
    width: 100%;
    height: 50px;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    padding: 10px;
}

.enterRoom div:nth-child(2) div:nth-child(1) {
    color: rgba(200, 120, 120, 0.8);
    opacity: 0;
    background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAGCAYAAAAL+1RLAAAAF0lEQVQIW2NkwAIYgWKS6OIgQQxAoUoAE4AAUnD/0ugAAAAASUVORK5CYII=) repeat;
}

.enterRoom div:nth-child(2) div:nth-child(2) {
    color: rgba(120, 200, 120, 0.8);
    opacity: 0;
    background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAGCAYAAAAL+1RLAAAAF0lEQVQIW2NkwAIYgWKS6OIgQQxAoUoAE4AAUnD/0ugAAAAASUVORK5CYII=) repeat;
}

.enterRoom div:nth-child(2) div:nth-child(3) {
    color: rgba(120, 120, 200, 0.8);
    opacity: 0;
    background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAGCAYAAAAL+1RLAAAAF0lEQVQIW2NkwAIYgWKS6OIgQQxAoUoAE4AAUnD/0ugAAAAASUVORK5CYII=) repeat;
}

.enterRoom:hover div:nth-child(1) {
    color: #ffffff;
    background-color: #000000;
    transition: color 0s ease;
    -webkit-transition: color 0s ease;
    -moz-transition: color 0s ease;
    transition: background-color 0.3s ease 0.2s;
    -webkit-transition: background-color 0.3s ease 0.2s;
    -moz-transition: background-color 0.3s ease 0.2s;
}

.enterRoom:hover div:nth-child(2) div:nth-child(1) {
    animation: b10_tveffect_red 0.25s linear;
    -webkit-animation: b10_tveffect_red 0.25s linear;
    -moz-animation: b10_tveffect_red 0.25s linear;
}

.enterRoom:hover div:nth-child(2) div:nth-child(2) {
    animation: b10_tveffect_green 0.25s linear;
    -webkit-animation: b10_tveffect_green 0.25s linear;
    -moz-animation: b10_tveffect_green 0.25s linear;
}

.enterRoom:hover div:nth-child(2) div:nth-child(3) {
    animation: b10_tveffect_blue 0.25s linear;
    -webkit-animation: b10_tveffect_blue 0.25s linear;
    -moz-animation: b10_tveffect_blue 0.25s linear;
}

@-webkit-keyframes b10_tveffect_red {
    from,
    to {
        opacity: 0;
    }
    25% {
        opacity: 1;
        -webkit-transform: scale(1.8, 1.6) translate(-10px, 3px) skewX(30deg);
    }
    50% {
        opacity: 1;
        -webkit-transform: scale(1.5, 1.2) translate(20px, 6px) skewX(5deg);
    }
    75% {
        opacity: 1;
        -webkit-transform: scale(0.9, 1.8) translate(-16px, -1px) skewX(-20deg);
    }
}

@-webkit-keyframes b10_tveffect_green {
    from,
    to {
        opacity: 0;
    }
    25% {
        opacity: 1;
        -webkit-transform: scale(1.3, 1.5) translate(3px, 6px) skewX(25deg);
    }
    50% {
        opacity: 1;
        -webkit-transform: scale(1.6, 1.1) translate(-16px, -5px) skewX(-15deg);
    }
    75% {
        opacity: 1;
        -webkit-transform: scale(1, 1.8) translate(18px, 4px) skewX(15deg);
    }
}

@-webkit-keyframes b10_tveffect_blue {
    from,
    to {
        opacity: 0;
    }
    25% {
        opacity: 1;
        -webkit-transform: scale(1.2, 1.4) translate(-10px, -3px) skewX(-25deg);
    }
    50% {
        opacity: 1;
        -webkit-transform: scale(1.9, 1.1) translate(16px, 3px) skewX(5deg);
    }
    75% {
        opacity: 1;
        -webkit-transform: scale(1.3, 2) translate(-30px, -3px) skewX(20deg);
    }
}

@-moz-keyframes b10_tveffect_red {
    from,
    to {
        opacity: 0;
    }
    25% {
        opacity: 1;
        transform: scale(1.8, 1.6) translate(-10px, 3px) skewX(30deg);
    }
    50% {
        opacity: 1;
        transform: scale(1.5, 1.2) translate(20px, 6px) skewX(5deg);
    }
    75% {
        opacity: 1;
        transform: scale(0.9, 1.8) translate(-16px, -1px) skewX(-20deg);
    }
}

@-moz-keyframes b10_tveffect_green {
    from,
    to {
        opacity: 0;
    }
    25% {
        opacity: 1;
        transform: scale(1.3, 1.5) translate(3px, 6px) skewX(25deg);
    }
    50% {
        opacity: 1;
        transform: scale(1.6, 1.1) translate(-16px, -5px) skewX(-15deg);
    }
    75% {
        opacity: 1;
        transform: scale(1, 1.8) translate(18px, 4px) skewX(15deg);
    }
}

@-moz-keyframes b10_tveffect_blue {
    from,
    to {
        opacity: 0;
    }
    25% {
        opacity: 1;
        transform: scale(1.2, 1.4) translate(-10px, -3px) skewX(-25deg);
    }
    50% {
        opacity: 1;
        transform: scale(1.9, 1.1) translate(16px, 3px) skewX(5deg);
    }
    75% {
        opacity: 1;
        transform: scale(1.3, 2) translate(-30px, -3px) skewX(20deg);
    }
}

</style>
<script>
$(function(){
	//페이지 서서히 켜지는 효과
	$("body").fadeIn(2000);
	
	//제목에 마우스 오버 시 메뉴 나옴.
	$("#title").fadeIn(4000).on('mouseenter', function(){
		$("#menu").fadeIn(2000);
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
		<div id="login">LOGIN</div>
		<div id="title">EscapeRoom</div>
		<nav id="menu">
			<ul>
				<li ><a href="#">HOME</a></li>
				<li ><a href="<%=request.getContextPath()%>/board/noticeList">NOTICE</a></li>
				<li ><a href="#">RANKING</a></li>
				<li ><a href="#">COMMUNITY</a></li>
			</ul>
		</nav>
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