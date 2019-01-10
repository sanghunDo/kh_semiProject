<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(function(){
	console.log("zzzz");
	$.ajax({
		url:"<%=request.getContextPath()%>/game/setObject",
		type: "post",
		dataType: "xml",
		success: function(data){
			console.log(data);
			var root = $(data).find(":root");
			var objArr = root.find("obj");
			
			objArr.each(function(){
				if($(this).find("objLevel").text()=="1"){
					var html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/"+$(this).find("objName").text()+"' class='backObj'/>";
					$("#wrap").prepend(html);
				}
			});
		}
	});
})
</script>