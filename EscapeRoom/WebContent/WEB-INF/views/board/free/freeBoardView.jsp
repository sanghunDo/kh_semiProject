<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,semi.board.free.model.vo.*"  %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
	FreeBoard fb = (FreeBoard)request.getAttribute("fb");
	List<BoardComment> commentList = (List<BoardComment>)request.getAttribute("commentList");
	List<BoardComment> bestCommentList = (List<BoardComment>)request.getAttribute("bestCommentList");

%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/free/boardCommunityView.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>


<title>자유게시판</title>


<div class="container">
        <h3 style="color: white">자유게시판</h3>
    <!--new pic-->
    <hr style="margin-bottom: 36px;">
   
   <table class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목리스트">
        <caption>게시판리스트</caption>
        <colgroup>
            <col width="30px">
            <col width="100px">
            <col width="30px">
            <col width="30px">
            <col width="30px">
            <col width="30px">
        </colgroup>
        
            <tr>
                <th scope="col">제목</th>
                <td class="title">
                       <%=fb.getPostTitle() %>
                </td>
            </tr>

            <tr>
                <th scope="col">글쓴이</th>
                <td class="wirter">
                       <%=fb.getPostWriter() %>
                </td>
            </tr>

            <tr>
                <th scope="col">내용</th>
                <td class="content" style="height: 500px;">
                
                       <%=fb.getPostContent() %>
                </td>
            </tr>
    </table>

    <div id="declaration">
        
    <i>신고하기</i>
    </div>

    <div class="opinion">
        <div id="good">
            <b><span id="like"><%=fb.getPostLike()%></span></b>
            <img src='<%=request.getContextPath()%>/images/freeBoard/like.png' onclick="likey('<%=fb.getPostLike()%>')">
            <span id="likeComment">추천</span>
        </div>

        <div id="bad">
        	<b><span id="dislike"><%=fb.getPostDislike()%></span></b>
            <img src='<%=request.getContextPath()%>/images/freeBoard/dislike.png' onclick="disLikey('<%=fb.getPostDislike()%>')">
            <span id="dislikeComment">비추천</span>
        </div>
    </div>


    <div class="bestComment-container">
    <hr>
    <%for(BoardComment bc:bestCommentList)
                	 if(bc.getCommentLevel()==1) {
                	%>
        <dl style="margin-left: 24px;">
            <d>BEST</d>
            <dt>
                <%=bc.getCommentWriter() %>
                <i><%=bc.getCommentDate() %></i>
            </dt>
            
            <dl style="display: inline-flex;position: relative;left: 177px;top: -57px;">
                <div class="button">수정하기</div>
                <div class="button">삭제하기</div>
            </dl>

            <dl class="bestCommentOpinion" style="position: relative;top: -120px;left: -33px;">
                <span style="padding:10px">추천<%=bc.getCommentLike() %></span>
                <span style="padding:10px">비추천<%=bc.getCommentDislike() %></span>
                <span style="padding:10px">신고하기</span>
            </dl>

            <dd style="position: relative;top: -56px;">
                	<%=bc.getCommentContent() %>
            </dd>
                    
            <span id="Bestlevel2CommentList">답글 30개▼</span>
            <span>|</span>
            <span id="Bestlevel2CommentWrite">답글쓰기</span>
            
        </dl>
    	<hr>
    	 <%} %>
    </div>

    <div id="comment-container" style="color:white;">
        <p>
            <span style="color: red; font-size:29px;" ><%=fb.getBoard_comment_cnt()%></span>개의 댓글
        </p>
            <div class="comment-editor">
                	댓글쓰기
                <hr>
                <!-- 댓글 삽입 서블릿을 위한 폼 -->
                <form action="<%=request.getContextPath() %>/board/free/FreeBoardCommentInsert" name="commentSubmitFrm">
                <input type="hidden" name="ref" value="<%=fb.getPostNo() %>" />
                <input type="hidden" name="userId" value="userId"/>
                <input type="hidden" name="commentLevel" value="1" />
                <input type="hidden" name="commentRef" value="0" />
             	<!-- <input type="checkBox" name="secret"/><label for="secret">비밀글</label> -->
                <textarea name="boardCommentContent" cols="60" rows="3" style="margin: 11px;margin-bottom: -78px;width: 800px;height: 113px;resize:none;"></textarea>
                </form>
                <div class="commentSubmit" onclick="insertComment();" style="cursor: pointer;">등록</div>
               
            </div><!-- end of . comment-editor -->
            
            <!-- 댓글 목록 테이블 -->
            
            <div class="commentList">
                <hr>
                <%for(int i=0; i<commentList.size(); i++){
                	BoardComment bc = commentList.get(i);
                	
                	 if(bc.getCommentLevel()==1) {
                	%>
                 <dl>
                    <dt style="margin-left: 21px;">
                        <%=bc.getCommentWriter()%>
                        <i><%=bc.getCommentDate() %></i>
                    </dt>
                    
                	<dl style="display: inline-flex; position: relative; left: 177px; top: -46px;">
                        <input type="hidden" value=<%=bc.getCommentNo() %> id="commentNo" />
                        <input type="hidden" value=<%=bc.getCommentContent() %> id="commentContent" />
                        
                        <div class="commentUpdate" no="<%=i%>" style="cursor:pointer;">수정하기</div>
                        <div class="button"  onclick="updateCommentEnd();" id="commentUpdateEnd" style="cursor:pointer;">수정완료</div>
                        <div class="button" id="commentDeleteBtn" onclick="deleteComment();">삭제하기</div>
        			</dl>
        			
        			<!-- 댓글 삭제를 위한 폼 -->
                    <form action="<%=request.getContextPath()%>/board/free/freeBoardCommentDelete" name="commentDeleteFrm">
                    <input type="hidden" value="<%=bc.getCommentNo() %>" name="commentNo"/>
                    <input type="hidden" value="<%=fb.getPostNo() %>" name="postNo" id="postNo"/>
                    </form>
                    
        			
                    <dl class="bestCommentOpinion">
                            <dl class="CommentOpinion" style="position: relative; top: -111px;">
             						 추천	 
                                    <span style="padding:10px" id="comment1Like" no="<%=i%>" onclick="comment1Like('<%=bc.getCommentLike()%>');"><%=bc.getCommentLike()%></span>
                                    <span style="padding:10px">비추천<%=bc.getCommentDislike()%></span>
                                    <span style="padding:10px">신고하기</span>
                                    
                            </dl>
                    </dl>
        
                    <dd style="padding-bottom: 44px;margin-left: 10px; color: white; position: relative; top: -43px;left: 16px;">
                    <textarea name="comment-Update" no="<%=i%>" class="comment-Update" cols="60" rows="3" style="margin: 11px;margin-bottom: -78px;width: 1000px;height: 113px;resize:none;"><%=bc.getCommentContent() %></textarea>
                    <dd class="comment-Content" style="padding-bottom: 44px;margin-left: 10px; color: white; position: relative; top: -43px;left: 16px;">
                            <%=bc.getCommentContent() %>
                    </dd>
                    
                    <span id="level2CommentList" style="margin-left: 21px;">답글 30개▼</span>
            </div> <!-- commentList 끝 -->       
                    
                    <!-- 답댓 -->
                  
                    
                    <span id="line" style= "position: relative;right: -114px;top: -183px;">|</span>
                    <span id="level2CommentWrite">답글쓰기</span>
                    
                    <div class="level2CommentWriteDiv" style="margin-top:-136px;">
                    	<textarea name="" class="level2CommentWrite" cols="60" rows="3" style="width: 800px;height: 113px;resize:none;"></textarea>
                    	<div class="commentSubmit" id="level2Commentsubmit" style="cursor: pointer; margin-top:-70px">등록</div>
                    </div>
                    
                      <div class="level2CommentListDiv" style="margin-top: 42px; margin-left:100px">
                      <sub style="margin-left: 64px;font-size: 15px;">
                             	답댓글쓴이
                        <i>19.01.07</i>
                      </sub>
                      <br/>
                     <sub style="margin-left: 80px;font-size: 15px;">댓내용</sub>

                        <div class="commentUpdate" style="cursor:pointer;">수정하기</div>
                        <div class="button"  onclick="updateCommentEnd();" id="commentUpdateEnd" style="cursor:pointer;">수정완료</div>
                        <div class="button" id="commentDeleteBtn" onclick="deleteComment();">삭제하기</div>
        			
                    </div><!-- level2CommentListDiv 끝 -->
                </dl>
                <hr>
                <%}
                } %>
           
        </div> <!-- end of . comment-container -->
        <div class="button" id="update" onclick="updateBoard();">수정</div>
    	<div class="button" id="delete" onclick="deleteBoard();">삭제</div>
   		<div class="button" id="goList">목록</div>
</div>

<form action="<%=request.getContextPath()%>/board/free/freeBoardDelete" name="boardDelFrm" method="post">
<input type="hidden" name="postNo" value="<%=fb.getPostNo()%>" id="postNo"/>
<input type="hidden" name="rName" value="<%=fb.getPostRenamedFile()%>" />
</form>

<script>
	function updateBoard(){
		location.href="<%=request.getContextPath()%>/board/free/freeBoardUpdate?postNo=<%=fb.getPostNo()%>";	
	}
	
	function deleteBoard(){
		if(!confirm("정말 게시글을 삭제하시겠습니까?")){
			return;
		}
		$("[name=boardDelFrm]").submit();
	}
	function insertComment(){
		$("[name=commentSubmitFrm]").submit();
	}
	
    $(".commentUpdate").on("click", function(){
    	
    	var no = $(this).attr("no");
     	console.log("no="+no);
    	console.log($("textarea[no="+no+"]")); 
    	
    	$(".comment-Content[no="+no+"]").hide();  //원래댓글
    	$(".comment-Update[no="+no+"]").css("display","inline"); //수정하기위한 text area
    	$("#commentUpdateEnd").css("display","inline"); //수정완료 버튼
	
       
        $(".commentUpdate").css("display","none"); //수정하기 버튼
        $("#commentDeleteBtn").css("display","none"); //삭제하기 버튼
        $("#level2CommentList").css("display","none"); //답글보기 버튼
        $("#level2CommentWrite").css("display","none"); //답글쓰기 버튼
        $("#line").css("display","none"); // | 
    	/* $(this).find("#comment-Content").hide();  //원래댓글
    	$(this).find(".comment-Update").css("display","inline"); //수정하기위한 text area
    	$(this).find("#commentUpdateEnd").css("display","inline"); //수정완료 버튼
	
       
        $(this).find(".commentUpdate").css("display","none"); //수정하기 버튼
        $(this).find("#commentDeleteBtn").css("display","none"); //삭제하기 버튼
        $(this).find("#level2CommentList").css("display","none"); //답글보기 버튼
        $(this).find("#level2CommentWrite").css("display","none"); //답글쓰기 버튼
        $(this).find("#line").css("display","none"); // |  */


        var commentUpdate = $(".comment-Update").val();
        var commentNo = $("#commentNo").val();
        var postNo = $("#postNo").val();
    });    
    
    function updateCommentEnd(){    
        var commentNo = $("#commentNo").val();
        var commentUpdate = $(".comment-Update").val();
        location.href = "<%=request.getContextPath()%>/board/free/freeBoardCommentUpdate?postNo=<%=fb.getPostNo()%>&commentNo="+commentNo+"&commentUpdate="+commentUpdate;
    }
    
    function deleteComment(){
        if(!confirm("댓글을 정말로 삭제하시겠습니까?")){
            return false;
        }
        $("[name=commentDeleteFrm]").submit();
        
    }
 
 

    function comment1Like(item){
    	var commentNo =  $("#commentNo").val(); 
    	var no = $(this).attr("no");
     	console.log("no="+no);
    	//console.log($("textarea[no="+no+"]")); 
    	
    
    	//console.log("comment1Like",item);
    	 if(!confirm("해당 댓글을 추천하시겠습니까?")){
    		return;
    	} 
    	 
    	 $.ajax({
     		url:"<%=request.getContextPath()%>/board/free/freeBoardComment1Like.do",
     		data:{commentNo:commentNo, commentLikey:item},
     		success:function(data){
     			$("#comment1Like").html(data);
     		    
     			console.log(data);
     		}
     		
     	});
    	 
    }
    
    function likey(item){
    	var postNo =  $("#postNo").val(); 
    	console.log("postNo",postNo);
    	if(!confirm("해당 글을 추천하시겠습니까?")){
    		return;
    	} 
    	  
  		$.ajax({
     		url:"<%=request.getContextPath()%>/board/free/freeBoardLike.do",
     		data:{postNo:postNo, likey:item},
     		success:function(data){
     			$("#like").html(data);
     		}
     		
     	});  
    	 
    }
    
    function disLikey(item){
    	var postNo =  $("#postNo").val(); 
    	
    	
    	if(!confirm("해당 글을 비추천하시겠습니까?")){
    		return;
    	} 
    	 
    
    	
    		$.ajax({
	     		url:"<%=request.getContextPath()%>/board/free/freeBoardDisike.do",
	     		data:{postNo:postNo, dislikey:item},
	     		success:function(data){
	     			$("#dislike").html(data);
	     			
	     		}
	     		
	     	});
    	
    		console.log(flag);
    }
    	
    	
    <%-- 	$.ajax({
    		url:"<%=request.getContextPath()%>/board/free/freeBoardComment1Like.do",
    		data:{commentNo:commentNo},
    		success:function(data){
    			
    			console.log(data);
    		}
    		
    	});
	 --%>
   
    
    
    
    <%-- 
        $.ajax({
            url:"<%=request.getContextPath()%>/board/free/freeBoardCommentUpdate?postNo=<%=fb.getPostNo()%>",
            type:"get",
            data:{commentUpdate:commentUpdate,postNo:postNo, commentNo:commentNo},
            success: function(data){
                var html="";
                console.log("data=",data);
                /* html+="<dd id="comment-Content" style="padding-bottom: 44px;margin-left: 10px; color: white; position: relative; top: -43px;left: 16px;">";
                html+=data
                html+="</dd> */
                
        
                //$("dd[#commentContent]").html(html);
            }
        
        })
    });  --%>
    
   
    
<%--     $("#level2CommentList").on("click", function(){
        $.ajax({
            var commentNo = $("#commentNo").val();
            console.log("commentNo", commentNo);
            url:"<%=request.getContextPath()%>/board/free/CommentLevel2Insert.do",
            data:{commentNo:commentNo},
            success:function(data){
                console.log(data);
            }
        })
    }); --%>
    
	
</script>
</html>