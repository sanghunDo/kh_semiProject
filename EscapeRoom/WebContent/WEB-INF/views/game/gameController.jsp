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
	$("#background>img").not(":first").each(function(){
		$(this).on('click', function(){
			var objName = $(this).prop("id");
			var html = "";
			
			var children = find_children(objName);
			if(children.length>0){
				console.log(check_state(children[0], "get"));	
			}
			else{
				html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/clicked/"+objName+"_clicked.png'";
				html+= " onclick=obj_hasNext('"+objName+"') class='"+objName+"'>";
			}
			
			off();
			$("#show-obj").html(html).show();
			show_coment(objName, 1);
		});
	});
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
				
				if(name==data.thirdName) {on(); return;}
				else{
					if(name==data.secondName){
						if(!data.thirdName) {on(); return;}
						show_coment(objName, 3);
						html = "<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+data.thirdName+".png";
						cName = data.thirdName;
					}else{
						if(!data.secondName) {on(); return;}
						show_coment(objName, 2);
						html = "<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+data.secondName+".png";
						cName = data.secondName;
					}
					
					var children = find_children(cName);
					if(children.length>0){
						for(var i in children){
							var html_ = "<img src='<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+children[i]+".png'";
								html_ +=" id='"+children[i]+"' onclick=get_item('"+children[i]+"') class='obj'>";
							$target.after(html_);
						}					
					}
					$target.removeClass().addClass(cName);
					$target.attr("src", html);
				}
				
			}
		}
	});
};
function find_children(objName){
	var children = [];
	$.ajax({
		url:"<%=request.getContextPath()%>/game/setObject",
		type: "post",
		dataType: "json",
		async: false,
		success: function(data){
			for(var i in data){
				if(data[i].parentName==objName){
					children.push(data[i].objName);
				}
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
					var state2 = check_state(data[i].objName, "use");
					if(state1==2&&state2<=1){
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















