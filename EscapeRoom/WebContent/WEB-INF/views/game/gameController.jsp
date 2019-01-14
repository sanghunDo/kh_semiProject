<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId_ = request.getParameter("userId");
%>
<script>
var position = $("#background img").prop("id");
$(function(){
	setTimeout(function(){
		setObject(position);
	}, 3000);
	refresh_inventory();
})
function setObject(position){
	$.ajax({
		url:"<%=request.getContextPath()%>/game/setObject",
		type: "get",
		dataType: "json",
		success: function(data){
			$("#background *").not(":first").remove();
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
	var position = $("#background img").prop("id")
	$("#background>img").not(":first").each(function(){
		$(this).on('click', function(){
			var objName = $(this).prop("id");
			var secondName = "";
			var check_item = check_usable_item(objName);
			$.ajax({
				url:"<%=request.getContextPath()%>/game/getObject",
				type: "post",
				dataType: "json",
				async: false,
				success: function(data){
					for(var i in data){
						if(data[i].objName==objName) secondName = data[i].secondName;
					}
				}
			});
			
			if(check_item!=""){
				var state = checkState(check_item, "get");
				if(state==2){
					$("#inventory").trigger('click');
					$("#wrap *").not("#inventory, #inventory *").addClass("paused");
					use_item();
				}else{
					show_coment(objName, 1);
					$("#wrap").addClass("paused");
					get_item(secondName);
				}
				$("#show-obj").prepend("<img src='<%=request.getContextPath()%>/images/game/gameMain/clicked/"+objName+"_clicked.png' id='clicked' />")
							  .show().prop("class", objName);
				$("#clicked").attr("onclick", "obj_reClick('"+objName+"')");
			}
			else{
				if(secondName!=""){
					var childList = find_child(secondName);
					if(childList.length<=1){
						var state = checkState(objName, "use");
						if(state==2){
							objName = "used_"+objName;
						}
					}else{
						var state1 = checkState(childList[0], "get");
						var state2 = checkState(childList[1], "get");
						var html = "";
						if(state1==2&&state2==1){
							objName = childList[1]+"_"+objName
							html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+childList[1]+".png' id='"+childList[1]+"' class='obj'/>";
						}else if(state1==1&&state2==2){
							objName = childList[0]+"_"+objName
							html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+childList[0]+".png' id='"+childList[0]+"' class='obj'/>";
						}else if(state1==2&&state2==2){
							objName = "used_"+objName;
						}
						$("#show-obj").html(html);
					}
				}
				show_coment(objName, 1);
				$("#wrap").addClass("paused");
				$("#show-obj").prepend("<img src='<%=request.getContextPath()%>/images/game/gameMain/clicked/"+objName+"_clicked.png' id='clicked' />").show();
				$("#clicked").attr("onclick", "obj_reClick('"+objName+"')");
				get_item(secondName);
			}
		});
	});
};
function use_item(){
	$("#obj-list div").click(function(){
		if($(this).prop("class")=="selected"){
			var itemNo = $(this).children().prop("id");
			$("#clicked").css("cursor", "pointer").removeAttr("onclick").click(function(){
				var objNo = find_parent($("#show-obj").prop("class"), "objNo");
				if(itemNo==objNo) console.log("zzz");
			});
		}
	});
}

function check_usable_item(objName){
	var result = "";
	
	$.ajax({
		url: "<%=request.getContextPath()%>/game/getObject",
		type: "post",
		dataType: "json",
		async: false,
		success: function(data){
			for(var i in data){
				if(data[i].objName==objName){
					for(var j in data){
						if(data[i].objNo==data[j].refNo) result = data[j].objName;
					}
				}
			}
		}
	});
	return result;
};


function checkState(objName, flag){
	var state;
	$.ajax({
		url: "<%=request.getContextPath()%>/game/checkState",
		async: false,
		type: "post",
		data: {"objName":objName+flag, "userId":"<%=userId_%>"},
		dataType: "json",
		success: function(data){
			state = data;
		}
	});
	
	return state;
};
function play(){
	if($("#inventory").offset().top<704){$("#inventory").trigger('click');}
	$("#coment").hide();
	$("[id*=clicked]").next().remove();
	$("[id*=clicked]").remove();
	$("#show-obj").hide();
	$("#wrap, #wrap *").removeClass("paused");
};
function obj_reClick(objName){
	var position = $("#background img").prop("id");
	$.ajax({
		url:"<%=request.getContextPath()%>/game/setObject",
		type: "post",
		dataType: "json",
		success: function(data){
			var $target = $("[id*=clicked]");
			for(var i in data){
				if(data[i].objName==objName){
					if(data[i].secondName!=""){
						$("#clicked").attr("src", "<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+data[i].secondName+".png");
						$("#clicked").attr("onclick", "obj_re_reClick('"+objName+"')");
						$("#clicked").attr("id", data[i].secondName+"_clicked");
						show_coment(objName, 2);
						var child = find_child(data[i].secondName);
						if(child.length!=0){
							for(var a in child){
								var html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+child[a]+".png' id='"+child[a]+"' class='obj'/>";
								$target.after(html);
							}							
							get_item(data[i].secondName);
						}
					}
					else{play()}
				}
			}
		}
	});
};
function obj_re_reClick(objName){
	var position = $("#background img").prop("id");
	$.ajax({
		url:"<%=request.getContextPath()%>/game/setObject",
		type: "post",
		dataType: "json",
		success: function(data){
			var $target = $("[id*=clicked]");
			for(var i in data){
				if(data[i].objName==objName){
					if(data[i].thirdName!=""){
						show_coment(objName, 3);
						$target.attr("src", "<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+data[i].thirdName+".png");
						$target.attr("onclick", "play()");
						$target.attr("id", data[i].thirdName+"_clicked");
						
						var child = find_child(data[i].thirdName);
						if(child.length!=0){
							for(var a in child){
								var html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+child[a]+".png' id='"+child[a]+"' class='obj'/>";
								$target.after(html);
								get_item(child[i]);
							}
						}
					}
					else{play()}
				}
			}
		}
	});
};
<%-- function obj_isLast(objName){	
	$.ajax({
		url:"<%=request.getContextPath()%>/game/setObject",
		type: "post",
		dataType:"json",
		success: function(data){
			for(var i in data){
				if(objName.indexOf(data[i].thirdName)!=-1){
					play();
				}				
			}
		}
	});
}; --%>
function find_child(objName){
	var childList = [];
	$.ajax({
		url:"<%=request.getContextPath()%>/game/getObject",
		type: "post",
		dataType: "json",
		async: false,
		success: function(data){
			for(var i in data){
				if(data[i].parentName==objName){
					childList.push(data[i].objName);
				}
			}
		}
	});
	
	return childList;
};
function find_parent(keyword, flag){
	var parent;
	$.ajax({
		url:"<%=request.getContextPath()%>/game/getObject",
		type:"post",
		async: false,
		dataType:"json",
		success: function(data){
			for(var i in data){
				if(flag=="objName"){
					if(data[i].thirdName==keyword){parent = data[i].objName;}
				}else if(flag=="objNo"){
					if(data[i].objName==keyword){parent = data[i].objNo;}
				}
			}
		}
	});
	return parent;
};

function update_state(objName, flag){
	$.ajax({
		url: "<%=request.getContextPath()%>/game/updateState",
		type: "post",
		data: {"objName":objName+flag, "userId":"<%=userId_%>"}
	});
};
var cnt = 1;
function get_item(parentName){
	$("#show-obj img").not(":first").each(function(){
		var $target = $(this);
		$(this).on('click', function(e){
			var objName = $target.prop("id");
			$("[id*=clicked]").attr("src", "<%=request.getContextPath()%>/images/game/gameMain/clicked/"+objName+"_clicked.png");
			show_coment(objName, 1);
			$.ajax({
				url:"<%=request.getContextPath()%>/game/getObject",
				type: "post",
				dataType: "json",
				success: function(data){
					for(var i in data){
						if(objName==data[i].objName){
							if(data[i].isItem=="Y "){
								$target.remove();
								update_state(objName, "get");
								refresh_inventory();
								
								var childList = find_child(parentName); 
								if(childList.length==1){
									var parent = find_parent(parentName, "objName");
									update_state(parent, "use");
								}else{
									var state1 = checkState(childList[0], "get");
									var state2 = checkState(childList[1], "get");
									if(state1==2&&state2==2){
										var parent = find_parent(parentName, "objName");
										update_state(parent, "use");
									}
								}
							}
						}
					}
				}
			});
		});
	});
};
function refresh_inventory(){
	var position = $("#background img").prop("id")
	var cnt = 1;
	$.ajax({
		url:"<%=request.getContextPath()%>/game/getObject",
		type:"post",
		dataType:"json",
		success:function(data){
			for(var i in data){
				if(data[i].isItem=="Y "){
					var state1 = checkState(data[i].objName, "get");
					var state2 = checkState(data[i].objName, "use");
					if(state1==2&&state2==1){
						var html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+data[i].objName+".png' id='"+data[i].refNo+"'/>"
						$("#obj"+cnt++).html(html);
					}
				}
			}
		}
	});
}
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















