<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>ESCAPE, IF YOU CAN.</title>
<script src="<%=request.getContextPath()%>/js/jqeury-3.3.1.js"></script>
<script>
window.onload=function(){
	window.focus();
	window.moveTo(0,0);
	window.resizeTo(1024,768);
}
</script>
<style>
body, html{
   width: 1022px;
   height: 674px;
   padding: 0px;
   margin: 0 auto;
   background:black;
   overflow: hidden;
}

div#warning{
   text-align:center;
   position: relative;
   width:60%;
   height:40%;
   top: 25%;
   border:2px solid red;
   border-style:dashed;
   color:red;
   font-size:15px;
   font-weight:bold;
   padding-bottom:20px;
   margin:0 auto;
   animation-name:warningAni;
   animation-duration:7s;
   animation-iteration-count:1;
   opacity:0;
}

@keyframes warningAni{
   0%{
      opacity:0;
   }
   50%{
      opacity:1;
   }
   100%{
      opacity:0;
   }
}

</style>
</head>
<body>
<div id="warning">
	<h1>! WARNING !</h1><br />
	<p>본 게임은 다소 잔인하거나 불쾌한 장면이 포함되어 있을 수 있습니다.<br><br>
	   노약자, 어린이, 임산부이신 분들께는 게임 플레이를 권장하지 않습니다.<br><br>
	   또한, 장시간 플레이 후에는 휴식을 취해주시기 바랍니다.<br><br>
	   - 게임의 등장인물이나 배경은 모두 실제 인물이나 단체와 무관합니다. -</p>
</div>



</body>
</html>