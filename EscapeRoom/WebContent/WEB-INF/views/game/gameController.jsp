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
			var root = $(data).find(":root");
			var objArr = root.find("level1").find("obj");
			var msg = "";
			objArr.each(function(){
				if($(this).find("refNo").text()=="0"){
					var html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/back/"+$(this).find("objName").text()+".png' id='"+$(this).find("objName").text()+"' class='obj'/>";
					$("#wrap").prepend(html);
				}
			});
			obj_click();
		}
	});
})
function obj_click(){
	$("#wrap>img").each(function(){
		$(this).on('click', function(){
			$("#wrap").append("<img src='<%=request.getContextPath()%>/images/game/gameMain/back/"+$(this).prop("id")+"_clicked.png' id='clicked' onclick='obj_reClick();'/>");
			$("#wrap *, #back-ground").not("#clicked, #coment, #coment *").addClass("paused");
			show_coment($(this).prop("id"));
		});
	});
};
function obj_reClick(){
	$("body *").removeClass("paused");
	$("#wrap").find("img").remove("#clicked");
	$("#coment").hide();
};
function show_coment(objName){
	var coment = "";
	var target = $("#coment h2");
	target.removeAttr("style");
	$.ajax({
		url:"<%=request.getContextPath()%>/game/getObject",
		type:"post",
		dataType:"xml",
		success: function(data){
			var root = $(data).find(":root");
			var objArr = root.find("obj");
			objArr.each(function(){
				if($(this).find("objName").text()==objName){
					coment = $(this).find("coment").text();
				}
			});
			$("#coment").show();
			target.text(coment);
			target.parent().css("width",target.outerWidth());
			var length = coment.length;
			target.attr("style", "animation:typing "+(length/40)+"s steps("+length+", end)");
		}
	});
};
</script>















