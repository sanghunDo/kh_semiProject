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
			$("#background img").not(":first").remove();
				for(var i in data){
					var obj = data[i];
					if(obj.position==position&&obj.objLevel==1){
						var html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+obj.objName+".png' id='"+obj.objName+"' class='obj'/>";
						$("#background").append(html);
					}
				}
			obj_click();
			escape();
		}
	});
};
function escape(){
	$("#door").on('click', function(){
		var state1 = check_state("door_lock1", "use");
		var state2 = check_state("door_lock2", "use");
		
		if(state1==2&&state2==2){
			console.log("축하합니다....");
		}else{
			show_coment("door", 1);
		}
	});
};
function on(){
	if($("#inventory").offset().top<704){$("#inventory").trigger('click');}
	$("#coment").hide();
	$("#show-obj").empty().hide();
	$("#wrap, #wrap *").removeClass("paused");
};
function off(){
	$("#wrap *").not("#inventory").addClass("paused");
};
function obj_click(){
	var position = $("#background img").prop("id")
	$("#background>img").not(":first, #door").each(function(){
		$(this).on('click', function(){
			var objName = $(this).prop("id");
			var html = "";
			
			var children = find_children(objName, 1);
			if(children.length>0){
				if(children.length==1){
					var state = is_used(children);
					if(state==2) {objName = "used_"+objName;}
				}
				if(children.length==2){
					var state1 = is_used(children[0]);
					var state2 = is_used(children[1]);
					var childName = "";
					
					if(state1==2&&state2==2){objName = "used_"+objName;}
					else{
						if(state1==1&&state2==2){objName=children[0]+"_"+objName; childName=children[0];}
						if(state1==2&&state2==1){objName=children[1]+"_"+objName; childName=children[1];}
						console.log(childName);
						html += "<img src='<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+childName+".png'";
						html +=" id='"+childName+"' onclick=get_item('"+childName+"') class='obj'>";
					}
				}
			}
			
			html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/clicked/"+objName+"_clicked.png'"
				 + " onclick=obj_hasNext('"+objName+"') class='"+objName+"'>" + html;
			
			off();
			$("#show-obj").html(html).show();
			show_coment(objName, 1);
		});
	});
};

function is_used(children){
	return check_state(children, "get");
};
function obj_hasNext(objName){
	var position = $("#background img").prop("id");
	$.ajax({
		url: "<%=request.getContextPath()%>/game/getObject?objName="+objName,
		type: "get",
		dataType: "json",
		success: function(data){
			if(!data.secondName) on();
			else{
				var $target = $("#show-obj img:first");
				var name = $target.prop("class");
				
				var cName = "";
				var html = "";
				var cnt = 0;
				
				if(name==data.thirdName) {on(); return;}
				else{
					if(name==data.secondName){
						if(!data.thirdName) {on(); return;}
						cnt = 3;
						cName = data.thirdName;
					}else{
						if(!data.secondName) {on(); return;}
						cnt = 2;
						cName = data.secondName;
					}
					
					var children = find_children(cName, 2);
					if(children.length>0){
						for(var i in children){
							var html_ = "<img src='<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+children[i]+".png'";
								html_ +=" id='"+children[i]+"' onclick=get_item('"+children[i]+"') class='obj'>";
							$target.after(html_);
						}					
					}
					
					show_coment(objName, cnt);
					html = "<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+cName+".png";
					$target.removeClass().addClass(cName);
					$target.attr("src", html);
				}
			}
		}
	});
};
function find_children(objName, flag){
	var children = [];
	$.ajax({
		url:"<%=request.getContextPath()%>/game/setObject",
		type: "post",
		dataType: "json",
		async: false,
		success: function(data){
			switch(flag){
			case 1: for(var i in data){
						if(data[i].objName==objName){
							if(data[i].secondName!="") {
								for(var j in data){
									if(data[i].secondName==data[j].parentName) children.push(data[j].objName);
									if(data[i].thirdName!=""){
										if(data[i].thirdName==data[j].parentName) children.push(data[j].objName);
									}
								}
							}
						}				
			}; break;
			case 2: for(var i in data){
						if(data[i].parentName==objName) children.push(data[i].objName);
			}; break;
			}
		}
	});
	return children;
};

function check_state(objName, flag){
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

function update_state(objName, flag){
	$.ajax({
		url: "<%=request.getContextPath()%>/game/updateState",
		type: "post",
		data: {"objName":objName+flag, "userId":"<%=userId_%>"}
	});
};

function get_item(objName){
	$("#show-obj img:first").attr("src", "<%=request.getContextPath()%>/images/game/gameMain/clicked/"+objName+"_clicked.png");
	$("#"+objName).remove();
	show_coment(objName, 1);
	
	$.ajax({
		url:"<%=request.getContextPath()%>/game/getObject?objName="+objName,
		type:"get",
		dataType:"json",
		success: function(data){
			if(data.isItem=="Y "){
				update_state(objName, "get");
				refresh_inventory();
			}
		}
	});
};
function refresh_inventory(){
	var cnt = 1;
	$.ajax({
		url:"<%=request.getContextPath()%>/game/setObject",
		type: "post",
		dataType: "json",
		success: function(data){
			for(var i in data){
				if(data[i].isItem=="Y "){
					var state1 = check_state(data[i].objName, "get");
					var state2 = 0;
					if((data[i].objName).indexOf("hintnote")==-1){
						state2 = check_state(data[i].objName, "use");
					}
					if(state1==2&&state2<2){
						var html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/"+data[i].position+"/"+data[i].objName+".png'>";
						$("#obj"+cnt++).html(html);
					}
				}
			}
		}
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















