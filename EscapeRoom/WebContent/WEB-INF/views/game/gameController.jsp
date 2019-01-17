<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId_ = request.getParameter("userId");
%>
<audio id="itemitemitem" src="<%=request.getContextPath()%>/audio/item.wav"></audio>
<audio id="opendoor" src="<%=request.getContextPath()%>/audio/opendoor.wav"></audio>
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
						var html; 
						var objName = obj.objName;
						if(!(objName=="calendar"||objName=="door"||objName.indexOf("books")!=-1||objName.indexOf("under")!=-1
							||objName=="window" || objName=="letter")){
							if(objName=="door_lock2"){
								var state = check_state("battery", "use");
								if(state==2) {
									state = check_state("wire","use");
									if(state==1) objName = "used_"+objName;
									else objName = "used_used_"+objName;
								}
							}else{
								var state = check_state(objName, "use");
								if(state==2) objName = "used_"+objName;
							}
						} 
						html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+objName+".png' id='"+objName+"' class='obj'/>";
						$("#background").append(html);
					}
				}
		}
	});
	setTimeout(function(){
		obj_click();
	}, 1500)
};
function escape(){
	$("#show-obj").empty();
	var html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/front/door_lock2_keypad.png' id='door_keypad'>";
    	html += "<div id='kp'>";
    	html +=	"<td><h1 name='1' class='num'   id='num1'>1</h1></td>";
    	html += "<h1 name='2' class='num'   id='num2'>2</h1>";
    	html += "<h1 name='3' class='num'   id='num3'>3</h1>";	
    	html += "<h1 name='4' class='num'   id='num4'>4</h1>";
    	html += "<h1 name='5' class='num'   id='num5'>5</h1>";
    	html += "<h1 name='6' class='num'   id='num6'>6</h1>";
    	html += "<h1 name='7' class='num'   id='num7'>7</h1>";
    	html += "<h1 name='8' class='num'   id='num8'>8</h1>";
    	html += "<h1 name='9' class='num'   id='num9'>9</h1>";
    	html += "<h1 name='*' class='num'   id='num11'>*</h1>";
    	html += "<h1 name='0' class='num'   id='num0'>0</h1>";
    	html += "<h1 name='#' class='num'   id='num12'>#</h1>";
		html += "<div id='password'></div></div>";
	$("#show-obj").html(html);
	
    $(".num").on('click',function(event){
        var a = $(this).html();//누른 버튼의 숫자         
        $(this).removeClass("clicked").addClass("clicked");
        setTimeout(function(){
            $(".num").removeClass("clicked");
        }, 1000);

        $("#password").append(a);
        var b = $("#password").html();
 
        //*눌렀을 때 입력된 비밀번호 확인
        if(a=="*"){
            if(b=="2598*"){
            	on();
        		$("#background").append("<img src='<%=request.getContextPath()%>/images/game/gameMain/doorright.png' id='doorright'>");
        		$("[id*=door_lock]").hide();
                $("#door").css({
                    "animation-name": "opendoor1",
                    "animation-duration": ".5s",
                    "animation-iteration-count": "1",
                    "animation-fill-mode": "forwards"
                });
                $("#doorright").css({
                    "animation-name": "opendoorright",
                    "animation-duration": ".5s",
                    "animation-iteration-count": "1",
                    "animation-fill-mode": "forwards"
                });
    			$("#main_bgm")[0].pause();
    			$("#opendoor")[0].play();
        		$("body").fadeOut(4000);
        		setTimeout(function(){
        			location.href="<%=request.getContextPath()%>/game/goToEndingChoice?userId=<%=userId_%>&record="+$("[type=hidden]").val();
        		}, 5000);
            } else{
            	on();
            }
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
	$("#wrap *").not("#inventory, #inventory *, #background, .obj").addClass("paused");
};
function obj_click(){
	var position = $("#background img").prop("id");
	if($("#inventory").offset().top<704){$("#inventory").trigger('click');}
	$("#background>img").not(":first").each(function(){
		
		if($("#show-obj").children().length!=0 || $("#pause-menu").children().length!=0
				|| $("#store").children().length!=0 || $("#help").children().length!=0) return;
		
		$(this).on('click', function(){
			if($("#show-obj").children().length!=0) return;
			
			var objName = $(this).prop("id");
			if(objName=="door") {escape(); return;}
			
			var state_ = 0;
			if(objName!="calendar"&&objName!="under_bed_diary"&&objName.indexOf("books")==-1&&objName!="window"
				&& objName!="letter" && objName.indexOf("used")==-1){
				state_ = check_state(objName, "use");
			}
			
			if(state_==2){
				if(objName!="used_safe"){
					html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/clicked/used_"+objName+".png'"
				 	+ " onclick=obj_hasNext('"+objName+"') class='"+objName+"'>";
				}
			}
			else{
				var itemList = is_usable(objName);
				if(itemList.length!=0){check_has_item(objName, itemList); return;}
				var html = "";
				
				if(objName=="used_safe")
					var children = find_children(objName, 2);
				else
					var children = find_children(objName, 1);
				
				if(children.length>0){
					if(children.length==1){
						var state = check_state(children[0], "get");
						if(state==2) {objName = "used_"+objName;}
						console.log("11");
					}
					if(children.length==2){
						var state1 = check_state(children[0], "get");
						var state2 = check_state(children[1], "get");
						var childName = "";
						console.log(children, state1, state2);
						if(!(state1==1&&state2==1)){
							if(state1==2&&state2==2){
								if(objName!="used_safe") objName = "used_"+objName;
							}
							else{
								if(state1==1&&state2==2){objName=children[0]+"_"+objName; childName=children[0];}
								if(state1==2&&state2==1){objName=children[1]+"_"+objName; childName=children[1];}
								html += "<img src='<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+childName+".png'";
								html +=" id='"+childName+"' onclick=get_item('"+childName+"') class='obj'>";
							}
						}
					}
				}
				html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/clicked/"+objName+".png'"
					 + " onclick=obj_hasNext('"+objName+"') class='"+objName+"'>" + html;
			}
			
			off();
			$("#show-obj").html(html).show();
			show_coment(objName, 1);
		});
	});
};
function is_usable(objName){
	var itemList = [];
	$.ajax({
		url:"<%=request.getContextPath()%>/game/setObject",
		type:"post",
		dataType:"json",
		async: false,
		success: function(data){
			for(var i in data){
				if(data[i].objName==objName){
					for(var j in data){
						if(data[i].objNo==data[j].refNo) itemList.push(data[j].refNo);
					}
				}
			}
		}
	});
	return itemList;
};
function check_has_item(objName, itemList){
	var position = $("#background img").prop("id");
	var objNo = get_data(objName, "objNo");
	var html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/clicked/"+objName+".png'"; 
		html += "class='"+objNo+"' onclick=obj_hasNext('"+objName+"')>";
	var flag = false;
	$("#show-obj").html(html).show();
	off();
	var item;
	$("#obj-list div").each(function(){
		if($(this).children().prop("id")==objNo){flag=true;item = $(this);}
		$(this).click(function(){
			item=$(this);
			if(item.prop("class")=="selected"){
				$("."+objNo).css("cursor", "pointer").attr("onclick", "use_item('"+objName+"', '"+objNo+"', '"+item.children().prop("class")+"')");
			}
			else{
				$("."+objNo).css("cursor", "default").attr("onclick", "obj_hasNext('"+objName+"')");
			}
		});
	});
	if(flag){if($("#inventory").offset().top>=704){$("#inventory").trigger('click');}}
	else {show_coment(objName, 1);}
};
function use_item(objName, objNo, item){
	var position = $("#background img:first").prop("id");
	
	if(objNo==$("."+item).prop("id")){
		if($("."+item).prop("class")=="wire"){
			if(check_state("battery","use")==1){
				on();
				show_coment("","","건전지를 먼저 찾아야겠다..");
				return;
			}
		}
		
		if($("#inventory").offset().top<704){$("#inventory").trigger('click');}
		
		$("#show-obj img:first").attr("src", "<%=request.getContextPath()%>/images/game/gameMain/"+position+"/used_"+objName+".png")

		if(objName=="used_door_lock2"){
			$("#show-obj img:first").attr("onclick", "escape()");
		}else{
			$("#show-obj img:first").attr("onclick", "obj_hasNext('"+objName+"')");
		}
		
		
		$("#"+objName).attr("src", "<%=request.getContextPath()%>/images/game/gameMain/"+position+"/used_"+objName+".png").attr("id", "used_"+objName);
		show_coment("used_"+objName, 1);
		
		if(objName.indexOf("door_lock2")==-1){update_state(objName, "use");}
		update_state(item, "use");
				
		var children = find_children("used_"+objName, 2);
		if(children.length!=0){
			for(var i in children){
				var html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/"+position+"/"+children[i]+".png";
					html += "' id='"+children[i]+"' onclick=get_item('"+children[i]+"') class='obj'>";
				$("#show-obj").append(html);
			}
		}
		$("."+item).remove();
		refresh_inventory();
	}
	else{
		if($("#inventory").offset().top<704){$("#inventory").trigger('click');}
		show_coment("wrong", 1);
		setTimeout(function(){
			$("#coment").hide();
			$("#inventory").trigger('click');
		}, 2000);
		$("#show-obj").empty();
		on();
	}
	obj_click();
};

function get_data(objName, flag){
	var result;
	$.ajax({
		url: "<%=request.getContextPath()%>/game/getObject?objName="+objName,
		type: "get",
		dataType: "json",
		async: false,
		success: function(data){
			switch(flag){
			case "objNo": result = data.objNo; break;
			}
		}
	});
	return result;
};
function obj_hasNext(objName){
	var position = $("#background img").prop("id");
	if(objName=="safe"){open_safe(); return;}
	if(objName=="used_used_door_lock2"){escape(); return;}
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
function open_safe(){
	$("#show-obj").empty();
	show_coment("", "", '"암호가 걸려있어.."');
	var html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/front/safe_keypad.png' id='largeKeypad'>";
    	html += "<div id='kp'>";
    	html +=	"<td><h1 name='1' class='num'   id='num1'>1</h1></td>";
    	html += "<h1 name='2' class='num'   id='num2'>2</h1>";
    	html += "<h1 name='3' class='num'   id='num3'>3</h1>";	
    	html += "<h1 name='4' class='num'   id='num4'>4</h1>";
    	html += "<h1 name='5' class='num'   id='num5'>5</h1>";
    	html += "<h1 name='6' class='num'   id='num6'>6</h1>";
    	html += "<h1 name='7' class='num'   id='num7'>7</h1>";
    	html += "<h1 name='8' class='num'   id='num8'>8</h1>";
    	html += "<h1 name='9' class='num'   id='num9'>9</h1>";
    	html += "<h1 name='*' class='num'   id='num11'>*</h1>";
    	html += "<h1 name='0' class='num'   id='num0'>0</h1>";
    	html += "<h1 name='#' class='num'   id='num12'>#</h1>";
		html += "<div id='password'></div></div>";
		<%-- html += "<img src='<%=request.getContextPath()%>/images/game/gameMain/son.png' id='son'>"; --%>

	$("#show-obj").html(html);
	
    $(".num").on('click',function(event){
        var a = $(this).html();//누른 버튼의 숫자
        var x = event.clientX-315;//마우스 x 좌표
        var y = event.clientY-163;//마우스 y 좌표                    
        $(this).removeClass("clicked").addClass("clicked");
        setTimeout(function(){
            $(".num").removeClass("clicked");
        }, 1000);

        $("#password").append(a);
        var b = $("#password").html();
        

        //@@@@@@ 손가락 모션 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        //손가락 등장하기 전 처음 위치
/*         $("#son").css({"top":y-30+"px", "left":x-30+"px"});
        //손가락 등장, 위치이동하면서 누르는 모션, 사라지기
        $("#son").animate({"z-index":"3", opacity:"1",top:"+=30px",left:"+=30px"},500).animate({opacity:"0","z-index":"-3"},500); */
        //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


        //*눌렀을 때 입력된 비밀번호 확인
        if(a=="*"){
            if(b=="429*"){
            	var img = "<%=request.getContextPath()%>/images/game/gameMain/front/used_safe.png";
            	$("#show-obj img:first").attr("src", img).removeAttr("id");
            	$("#show-obj *").not(":first").remove();
            	$("#safe").attr("src", img).attr("id", "used_safe");
            	show_coment("","","금고가 열렸다..!");
            	update_state("safe", "use");
            	var children = find_children("used_safe", 2);
            	for(var i in children){
            		var html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/front/"+children[i]+".png'";
            			html +=" id='"+children[i]+"' class='obj' onclick=get_item('"+children[i]+"')>";
            		$("#show-obj").append(html);
            	}
            	$("#show-obj img:first").attr("onclick", "obj_hasNext('used_safe')");
            } else{
            	on();
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
			console.log(data);
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
	$("#itemitemitem")[0].play();
	$("#show-obj img:first").attr("src", "<%=request.getContextPath()%>/images/game/gameMain/clicked/"+objName+".png");
	show_coment(objName, 1);
	
	$.ajax({
		url:"<%=request.getContextPath()%>/game/getObject?objName="+objName,
		type:"get",
		dataType:"json",
		success: function(data){
			if(data.isItem=="Y "){
				update_state(objName, "get");
				refresh_inventory();
				$("#show-obj *").not(":first").remove();
			}
		}
	});
};
function refresh_inventory(){
	$("#obj-list div").empty();
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
					if((data[i].objName).indexOf("hintnote1")==-1&&(data[i].objName).indexOf("hintnote2")==-1
						&&(data[i].objName).indexOf("used_water")==-1){
						state2 = check_state(data[i].objName, "use");
					}
					
					if(state1==2&&state2!=2){
						var html = "<img src='<%=request.getContextPath()%>/images/game/gameMain/"+data[i].position+"/"+data[i].objName+".png'";
							html += "id='"+data[i].refNo+"' class='"+data[i].objName+"'>";
						$("#obj"+cnt++).html(html);
					}
				}
			}
		}
	});
};
function show_coment(objName, rnum, flag){
	var coment = "";
	var target = $("#coment h2");
	target.removeAttr("style");
	
	if(flag){
		$("#coment").show();
		target.text(flag);
		target.parent().css("width",target.outerWidth());
		var length = flag.length;
		target.attr("style", "animation:typing "+(length/40)+"s steps("+length+", end)");		
	}else{
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
	}
};
</script>















