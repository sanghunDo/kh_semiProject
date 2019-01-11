<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 int postNo = (int)request.getAttribute("postNo");
 System.out.println("(postReport.jsp)postNo="+postNo);
%>
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
	<form action="<%=request.getContextPath()%>/board/solve/solveBoardPostReportEnd">
		<input type="hidden" name="postNo" value="<%=postNo %>" />
		<h4>1. 게시글을 신고한 이유가 무엇인가요?</h4>
		&nbsp;&nbsp;&nbsp;
		<span class="explain">(여러개를 선택할  수 있습니다.)</span><br><br>
		
		<input type="checkbox" name="reason1" value="욕설 및 편파적 언행" onclick="check();" checked/>
		<label for="reason1">욕설 및 편파적 언행 (인종차별, 성차별 등)</label><br>
		
		<input type="checkbox" name="reason2" value="음란물 게시 및 부적절한 아이디"/>
		<label for="reason2">음란물 게시 및 부적절한 아이디</label><br>
		
		<input type="checkbox" name="reason3" value="도배, 광고 및 홍보"/>
		<label for="reason3">도배, 광고 및 홍보</label><br>
		
		<input type="checkbox" name="reason4" value="기타"/>
		<label for="reason4">기타</label><br>
		<br>
		
		<h4>2. 일어났던 일과 불쾌했던 이유를 말해주세요.</h4>
		&nbsp;&nbsp;&nbsp;
		<span class="explain">(관리자가 확인 후 해당 글에 대한 처리를 도와드립니다.)</span><br><br>
		<textarea name="userComment" id="userComment" cols="50" rows="5"></textarea>
		<br>
		<button type="submit" id="reportSubmit">신고 접수</button>
	</form>
</div>
<script>
$(function(){
	var check ;
	
	$("[type=checkbox]").attr("checked", true){
	check += $("checkbox :checked").val()+"|";
	console.log(check);
	}
	
});

$("checkbox").click(function(){
	var checkBox = "";
	if($('input:checkbox[name="checkbox_name"]').is(":checked") == true){
		checkBox = $("input[checkbox]").val()+"|";
		console.log(checkBox)
	}

});

function check(){
	var checked = $("[type=checkbox]").attr("checked", true);
	

	
}
</script>
</body>
</html>