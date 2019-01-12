<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
var position = $("#background img").prop("id");
$(function(){
	setObject();
})
function setObject(){
	var position = $("#background img").prop("id");
	$.ajax({
		url:"<%=request.getContextPath()%>/game/setObject",
		type: "get",
		dataType: "json",
		success: function(data){
			console.log(data);
			for(var i in data){
				var obj = data[i];
				if(obj.position==position&&obj.objLevel==1){
					var html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+obj.objName+".png' id='"+obj.objName+"' class='obj'/>";
					$("#background").append(html);
				}
			}
			obj_click();
		}
	});
};
function obj_click(){
	$("#background>img").not(":first").each(function(){
		var objName = $(this).prop("id");
		$(this).on('click', function(){
			show_coment(objName, 1);
			$("#wrap").addClass("paused");
			$("#wrap").after("<img src='<%=request.getContextPath()%>/images/game/gameMain/clicked/"+objName+"_clicked.png' id='clicked' onclick='obj_reClick("+objName+");'/>");
		});
	});
};
function obj_reClick(obj){
	var objName = $(obj).prop("id");
	$.ajax({
		url:"<%=request.getContextPath()%>/game/setObject",
		type: "post",
		dataType: "json",
		success: function(data){
			for(var i in data){
				if(data[i].objName==objName){
					if(data[i].secondName!=""){
						$("#clicked").attr("src", "<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+data[i].secondName+".png");
						$("#clicked").attr("onclick", "obj_re_reClick("+objName+")");
						$("#clicked").attr("id", data[i].secondName+"_clicked");
						show_coment(objName, 2);
					}
					else{
						$("#coment").hide();
						$("#clicked").remove();
						$("#wrap").removeClass("paused");
					}
				}
			}
		}
	});
};
function obj_re_reClick(obj){
	var objName = $(obj).prop("id");
	$.ajax({
		url:"<%=request.getContextPath()%>/game/setObject",
		type: "post",
		dataType: "json",
		success: function(data){
			for(var i in data){
				if(data[i].objName.indexOf(objName)!=-1){
					if(data[i].thirdName!=""){
						show_coment(objName, 3);
						$("[id*=clicked]").attr("src", "<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+data[i].thirdName+".png");
						$("[id*=clicked]").attr("onclick", "obj_isLast('"+data[i].thirdName+"')");
						$("[id*=clicked]").attr("id", data[i].thirdName+"_clicked");
					}
					else{
						$("[id*=clicked]").remove();
						$("#wrap").removeClass("paused");
						$("#coment").hide();
					}
				}
			}
		}
	});
};
function obj_isLast(objName){
	if(objName.indexOf("diary_opened")!=-1){
		var html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/left/hintnote1.png'id='hintnote1' class='obj'/>";
		$("[id*=clicked]").after(html);
		get_item("hintnote1");
	}
	
	$.ajax({
		url:"<%=request.getContextPath()%>/game/setObject",
		type: "post",
		dataType:"json",
		success: function(data){
			for(var i in data){
			}
		}
	});
};
function get_item(objName){
	$("[id*=clicked]").next().on('click', function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/game/getObject",
			type: "post",
			dataType: "json",
			success: function(data){
				for(var i in data){
					if(objName==data[i].objName){
						if(data[i].isItem=="Y"){
							var html = $("[id*=clicked]").next().html();
							$("#obj1").html(html);
							$("[id*=clicked]").next().remove();
						}
					}
				}
			}
		});
	});
};
function show_coment(objName, rnum){
	var coment = "";
	var target = $("#coment h2");
	target.removeAttr("style");
	$.ajax({
		url:"<%=request.getContextPath()%>/game/getComent",
		type:"post",
		data:{"objName":objName,"rnum":rnum},
		dataType:"json",
		success: function(data){
			$("#coment").show();
			target.text(data);
			target.parent().css("width",target.outerWidth());
			var length = data.length;
			target.attr("style", "animation:typing "+(length/40)+"s steps("+length+", end)");
		}
	});
};
</script>















