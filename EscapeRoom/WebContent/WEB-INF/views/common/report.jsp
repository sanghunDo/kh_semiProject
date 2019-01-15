<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>신고하기</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/report.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>

<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
</head>
<body>
<!-- 팝업크기 430 * 600 -->
<div id="logo">Escape, if you can.</div>

<div id="report-container">
	<h3 id="subtitle">게시물 / 댓글 신고하기</h3>
	<form action="" name="reportFrm">
		<h4>1. 게시글을 신고한 이유가 무엇인가요?</h4>
		&nbsp;&nbsp;&nbsp;
		<span class="explain">(여러개를 선택할  수 있습니다.)</span><br><br>
		
		<input type="checkbox" name="reason" value="reason1"/>
		<label for="reason1">욕설 및 편파적 언행 (인종차별, 성차별 등)</label><br>
		
		<input type="checkbox" name="reason" value="reason2"/>
		<label for="reason2">음란물 게시 및 부적절한 아이디</label><br>
		
		<input type="checkbox" name="reason" value="reason3"/>
		<label for="reason3">도배, 광고 및 홍보</label><br>
		
		<input type="checkbox" name="reason" value="reason4"/>
		<label for="reason4">기타</label><br>
		<br>
		
		<h4>2. 일어났던 일과 불쾌했던 이유를 말해주세요.</h4>
		&nbsp;&nbsp;&nbsp;
		<span class="explain">(관리자가 확인 후 해당 글에 대한 처리를 도와드립니다.)</span><br><br>
		<textarea name="userComment" id="userComment" cols="50" rows="5"></textarea>
		<br>
		<button type="button" id="reportSubmit" onclick="check();">신고 접수</button>
	</form>
</div>
<script>
function check(){
	var cnt = 0;
	if($("[name=reason]").prop("checked")){
		cnt++;
	}
	
	if(cnt==0){
		alert("최소 1개라도 선택하셔야 합니다.");
		return;
	}
	
	$("[name=reportFrm]").submit();
	
}



</script>
</body>
</html>