<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,semi.board.solve.model.vo.*"  %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
   SolveBoard sb = (SolveBoard)request.getAttribute("sb");
   List<BoardComment> commentList = (List<BoardComment>)request.getAttribute("commentList");
   List<BoardComment> bestCommentList = (List<BoardComment>)request.getAttribute("bestCommentList");
   
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/solve/boardCommunityView.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>


<title>공략게시판</title>


<div class="container">
        <h3 style="color: white">공략게시판</h3>
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
                       <%=sb.getPostTitle() %>
                </td>
            </tr>

            <tr>
                <th scope="col">글쓴이</th>
                <td class="writer">
                       <%=sb.getPostWriter() %>
                </td>
            </tr>

            <tr>
                <th scope="col">내용</th>
                <td class="content" style="height: 500px;">
                       <%if(sb.getPostRenamedFile()!=null){ %>
                       		<img src='<%=request.getContextPath()%>/upload/solveBoard/<%=sb.getPostRenamedFile() %>' class="contentPhoto" alt="지원하지 않는 사진 입니다."  />
                       		<br />
                       		<br />
                       		<br />
                       		<%=sb.getPostContent() %>
                       <%} else {%>
                       <%=sb.getPostContent() %>
                       <%} %>
                </td>
            </tr>
    </table>

    <div id="declaration">
        
    <i onclick="Postreport('<%=sb.getPostNo()%>','<%=sb.getPostTitle()%>','<%=sb.getPostWriter()%>');">신고하기</i>
    </div>

  <div class="opinion">
        <div id="good">
            <b><span id="like"><%=sb.getPostLike()%></span></b>
            <img src='<%=request.getContextPath()%>/images/freeBoard/like.png' onclick="likey('<%=loggedInMember.getUserId()%>')">
            <span id="likeComment">추천</span>
        </div>

        <div id="bad">
           <b><span id="dislike"><%=sb.getPostDislike()%></span></b>
            <img src='<%=request.getContextPath()%>/images/freeBoard/dislike.png' onclick="disLikey('<%=loggedInMember.getUserId()%>')">
            <span id="dislikeComment">비추천</span>
        </div>
    </div>



    <div class="bestComment-container">
    <hr>
   <%for(int i=0; i<bestCommentList.size(); i++){
                   BoardComment bc = bestCommentList.get(i);
                   
                    if(bc.getCommentLevel()==1) {
                   %> 
        <dl style="margin-left: 24px; height: 172px;" >
            <d style="color:red;">BEST</d>
            <dt>
                <%=bc.getCommentWriter() %>
                <i><%=bc.getCommentDate() %></i>
            </dt>
             <%if(loggedInMember!= null && ("admin".equals(loggedInMember.getUserId()) ||  bc.getCommentWriter().equals(loggedInMember.getUserId()))) {%>
            <dl class="bestEdit">
                <div class="button" style="position:relative; top:10px;" >수정하기</div>
                <div class="button"  style="position:relative; top:10px;" >삭제하기</div>
            </dl>
            <%} %>

            <dl class="bestCommentOpinion" style="position:relative; top:-44px; left:-33px;">
            	<input type="hidden" class="BestCommentNo" value ="<%=bc.getCommentNo() %>"  commentNum="<%=i%>" />
            	추천
                <span style="padding:10px" class="bestCommentLike" onclick="BestCommentLike(this,'<%=loggedInMember.getUserId()%>','<%=bc.getCommentWriter() %>')" commentNum="<%=i%>"><%=bc.getCommentLike() %></span>
                                비추천
                <span style="padding:10px" class="bestCommentDisike" onclick="BestCommentDislike(this,'<%=loggedInMember.getUserId()%>','<%=bc.getCommentWriter()%>')" commentNum="<%=i%>"><%=bc.getCommentDislike() %></span>
                <span style="padding:10px" onclick="report('<%=bc.getCommentNo()%>', '<%=bc.getCommentWriter()%>', '<%=bc.getCommentContent()%>');">신고하기</span>
            </dl>

            <dd class="bestContent">
                   <%=bc.getCommentContent() %>
            </dd>
        </dl>
       <hr>
             <%}%> 
          <% } %>  
    </div>

    <div id="comment-container" style="color:white;">
        <p>
            <span style="color: red; font-size:29px;" ><%=sb.getBoard_comment_cnt()%></span>개의 댓글
        </p>
            <div class="comment-editor">
                   댓글쓰기
                <hr>
                <!-- 댓글 삽입 서블릿을 위한 폼 -->
                <form action="<%=request.getContextPath() %>/board/solve/solveBoardCommentInsert" name="commentSubmitFrm">
                <input type="hidden" name="ref" value="<%=sb.getPostNo() %>" />
                <input type="hidden" name="userId" value="<%=loggedInMember.getUserId()%>"/>
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
                 <dl class="comment-Area">
                    <dt class="commentWriter">
                        <%=bc.getCommentWriter()%>
                        <i><%=bc.getCommentDate() %></i>
                    </dt>
                    
                   <dl style="display: inline-flex; position: relative; left: 177px; top: -46px;">
                        <input type="hidden" value=<%=bc.getCommentNo() %> class="commentNo" commentNum="<%=i%>" />
                        <input type="hidden" value=<%=bc.getCommentContent() %> id="commentContent"  no="<%=i %>"/>
                        <%if(loggedInMember!= null && ("admin".equals(loggedInMember.getUserId()) ||  bc.getCommentWriter().equals(loggedInMember.getUserId()))) {%>
                        <div class="commentUpdate" no="<%=i%>">수정하기</div>
                        <div class="commentUpdateEnd" no="<%=i %>">수정완료</div>
                        <div class="commentDeleteBtn" no="<%=i %>" onclick="deleteComment();">삭제하기</div>
                        <%} %>
                 </dl>
                 
                 <!-- 댓글 삭제를 위한 폼 -->
                    <form action="<%=request.getContextPath()%>/board/solve/solveBoardCommentDelete" name="commentDeleteFrm">
                    <input type="hidden" value="<%=bc.getCommentNo() %>" name="commentNo" class="commentNo" commentNo="<%=i%>"/>
                    <input type="hidden" value="<%=sb.getPostNo() %>" name="postNo" id="postNo"/>
                    </form>
                    
                 
                    <dl class="bestCommentOpinion">
                            <dl class="CommentOpinion">
                                	추천    
                                	<input type="hidden" class="commentLikeAmount" value="<%=bc.getCommentLike()%>" commentNum="<%=i%>"/>
                                    <span style="padding:10px" class="comment1Like" commentNum="<%=i%>"><%=bc.getCommentLike()%></span>
                       				비추천
                       				<input type="hidden" class="commentDisAmount" value="<%=bc.getCommentDislike()%>" commentNum="<%=i%>"/>
                                    <span style="padding:10px" class="comment1Dislike" commentNum="<%=i%>"><%=bc.getCommentDislike()%></span>
                                    <span style="padding:10px" onclick="report('<%=bc.getCommentNo()%>','<%=bc.getCommentWriter()%>', '<%=bc.getCommentContent()%>');">신고하기</span>        
                            </dl>
                    </dl>
        
                    <dd class="comment_">
                    <textarea name="comment-Update" no="<%=i%>" class="comment-Update" cols="60" rows="3"><%=bc.getCommentContent() %></textarea>
                    <dd class="comment-Content">
                            <%=bc.getCommentContent() %>
                    </dd>
                    
                   
                    <span class="level2CommentWrite" level2No="<%=i%>">답글보기</span>       
           </div> 
        
             <div class="level2CommentWriteDiv" level2No="<%=i%>">
                   <textarea class="level2CommentWrite-textArea" cols="60" rows="3"  level2No="<%=i%>"></textarea>
                    <input type="hidden" name="commentRef"  class="commentRef" level2No="<%=i%>" value="<%=bc.getCommentNo()%>"/>
                    <div class="level2Commentsubmit" level2No="<%=i%>">등록</div>
              </div> 
              
      

               <div class="level2" level2No="<%=i%>">
                  
               <input type="hidden" name="ref" value="<%=bc.getCommentNo() %>" /> 
                  
               </div><!--level2 div 끝  -->
              <hr />  
         <%}%> 
          <% } %>   
               
          
               
               
               
               </div><!-- level2CommentListDiv 끝 -->
             </dl>
        </div> <!-- end of . comment-container -->
   <%if(loggedInMember!= null && ("admin".equals(loggedInMember.getUserId()) ||  sb.getPostWriter().equals(loggedInMember.getUserId()))) {%>
        <div class="button" id="update" onclick="updateBoard();">수정</div>
        <div class="button" id="delete" onclick="deleteBoard();">삭제</div>     
    <%} %>
        <div class="button" id="goList" onclick="goList();">목록</div>
</div>

<form action="<%=request.getContextPath()%>/board/solve/solveBoardDelete" name="boardDelFrm" method="post">
<input type="hidden" name="postNo" value="<%=sb.getPostNo()%>" id="postNo"/>
<input type="hidden" name="rName" value="<%=sb.getPostRenamedFile()%>" />
</form>

<script>
/* 목록  */
 function goList(){
	 var referrer =  document.referrer;
	 location.href = referrer; 
}
/* 글 수정 */
   function updateBoard(){
      location.href="<%=request.getContextPath()%>/board/solve/solveBoardUpdate?postNo=<%=sb.getPostNo()%>";   
   }
/* 글 삭제 */  
   function deleteBoard(){
      if(!confirm("정말 게시글을 삭제하시겠습니까?")){
         return;
      }
      $("[name=boardDelFrm]").submit();
   }
   function insertComment(){
	  var len = $("[name=boardCommentContent]").val().trim();
	      if(len.length==0){
	          alert("댓글은 1자 이상 입력해주셔야합니다.");
	          return;
	       }
		  
	   
	  
      $("[name=commentSubmitFrm]").submit();
   }
   /* 수정하기 버튼을 눌렀을 시 */
    $(".commentUpdate").on("click", function(){
       
       var no = $(this).attr("no");
       console.log("no="+no);
       console.log($("textarea[no="+no+"]")); 
       
       $(".comment-Content[no="+no+"]").hide();  //원래댓글
       $(".comment-Update[no="+no+"]").css("display","inline"); //수정하기위한 text area
       $(".commentUpdateEnd[no="+no+"]").css("display","inline"); //수정완료 버튼
   
      
        $(".commentUpdate[no="+no+"]").css("display","none"); //수정하기 버튼
        $(".commentDeleteBtn[no="+no+"]").css("display","none"); //삭제하기 버튼
        $("#level2CommentList").css("display","none"); //답글보기 버튼
        $("#level2CommentWrite").css("display","none"); //답글쓰기 버튼
    });    
    

    $(".level2CommentWrite").on("click", function(){
       
       var no = $(this).attr("level2No");
       var level2Comment = $(".level2CommentWrite-textArea[level2No="+no+"]").val();
       var ref = $("input[name=ref]").val(); //해당 글번호
       var commentRef = $(".level2 input").val() //대댓글의 해당 댓글번호 
       console.log("여기는 답글쓰기를 눌렀을 시 commentRef="+commentRef);
       var commentWriter = $("input[name=userId]").val(); //유저아이디
       var commentLevel = 2; //대댓글
       $(".level2CommentWriteDiv[level2No="+no+"]").css("display","inline");
      
      
       
    
         $.ajax({
          url:"<%=request.getContextPath()%>/board/solve/solveBoardComment2.do",
           data:{level2Comment:level2Comment, ref:ref, commentRef:commentRef, commentWriter:commentWriter,  commentLevel:commentLevel},
           success:function(data){
           
              console.log(data);
              
              var div = $("<div class='level2_area' level2No='"+no+"'><div>");
              for(var i=0; i<data.length; i++){
                 var user = data[i]; 
                 var html = "<hr />"
                	 html+=
                         "<span class='reply_icon'><img src='<%=request.getContextPath()%>/images/freeBoard/commentReply.png'></span>";
                          html+="<div class='info'>"+ user.commentWriter + "</div>";
                          html+="<div class='level2Comment'>"+ user.commentContent + "</div>";
                          html+="<div class='level2Date'>"+ user.commentDate + "</div>";
                          html+="<div class='level2Report' onclick=report("+user.commentNo+",'"+user.commentWriter+"','"+user.commentContent+"');>신고하기</div>";                               
        				  html+="<div class='level2Like' no='"+i+"' ";
        				  html+="onclick=level2Like(this,"+user.commentNo +","+"'"+user.commentWriter+"');>추천 "+user.commentLike+"</div>";
         				  /* html+="<div class='level2Like' no="+i+">추천"+user.commentLike+"</div>"; */
                          html+="<div class='level2Dislike'";
                          html+="onclick=level2Dislike(this,"+user.commentNo+",'"+user.commentWriter+"'); no="+i+">비추천 "+user.commentDislike+"</div>";
                  
                          div.append(html);
               
            
              }
              $(".level2[level2No="+no+"]").html(div);
             
              
           }
       }); 
    });
    
    $(".level2Commentsubmit").on("click", function(){
       var no = $(this).attr("level2No");
       var level2Comment = $(".level2CommentWrite-textArea[level2No="+no+"]").val();
       var ref = $("input[name=ref]").val(); //해당 글번호refForSubmit
       var commentWriter = $("input[name=userId]").val(); //유저아이디
       var commentLevel = 2; //대댓글
       var commentRef = $(".commentRef[level2No="+no+"]").val();
       var len = level2Comment.trim();
       if(len.length==0){
          alert("댓글은 1자 이상 입력해주셔야합니다.");
          return;
       }
       
  
   	 $.ajax({
      url:"<%=request.getContextPath()%>/board/solve/CommentLevel2Insert.do",
         data:{level2Comment:level2Comment, ref:ref, commentRef:commentRef, commentWriter:commentWriter,  commentLevel:commentLevel},
         success:function(data){
         
            console.log(data);
            /* userId/2019-01-09 14:00:22/대댓글테스트2 */
               var data_split = data.split("/");
               var userId = data_split[0];
               var commentDate = data_split[1];
               var commentContent=data_split[2];
               var commentLike=data_split[3];
               var commentDislike=data_split[4];
               var commentNo = data_split[5];

               
               var div = $("<div class='level2_area'><div>");
            
            
               
               var html = "<hr />";
                html+=
               "<span class='reply_icon'><img src='<%=request.getContextPath()%>/images/freeBoard/commentReply.png'></span>";
                html+="<div class='info'>"+ userId + "</div>";
                html+="<div class='level2Comment'>"+ commentContent + "</div>";
                html+="<div class='level2Date'>"+ commentDate + "</div>";
                html+="<div class='level2Report'>신고하기</div>";
                html+="<div class='level2Like'>추천 "+ commentLike + "</div>";
                html+="<div class='level2Dislike'>비추천 "+ commentDislike + "</div>";
               
            	div.append(html);
               
            
            $(".level2[level2No="+no+"]").append(div);
           
        
            }

         
      });  
   
    });
    
    /* 수정완료버튼을 눌렀을 시 */
    $(".commentUpdateEnd").on("click", function(){
    	  var no = $(this).attr("no");
    	  var commentUpdate = $(".comment-Update[no="+no+"]").val();
    	  var commentNo = $(".commentNo[commentNum="+no+"]").val();
    	  
    	  var len = commentUpdate.trim();
          if(len.length==0){
              alert("댓글은 1자 이상 입력해주셔야합니다.");
              return;
           }
    	  
    	  
    	  
    	  var ref = $("[name=ref]").val();
    	  
		  location.href = "<%=request.getContextPath()%>/board/solve/solveBoardCommentUpdate?commentUpdate="+commentUpdate+
				  "&commentNo="+commentNo+"&ref="+ref;

    });

    
    function deleteComment(){
        if(!confirm("댓글을 정말로 삭제하시겠습니까?")){
            return false;
        }
        $("[name=commentDeleteFrm]").submit();
        
    }
    /* 베스트 댓글 추천 */
    function BestCommentLike(obj,item, writer){
   	 var no = $(obj).attr("commentNum");
   	 var userId = item;
   	 var commentNo = $(".BestCommentNo[commentNum="+no+"]").val();
   	 var commentWriter = writer;
   	
   	 if(userId == commentWriter){
   		 alert("자신의 댓글에 추천하실 수 없습니다.");
   		 return;
   	 }
   	 
   	   $.ajax({
              url:"<%=request.getContextPath()%>/board/solve/solveBoardComment1Like.do",
              data:{commentNo:commentNo , userId:userId},
              success:function(data){
                 $(".bestCommentLike[commentNum="+no+"]").html(data);
           
              }
           }); 
    }
 /* 댓글추천  */
  function commentLike(obj,item, writer){
	 var no = $(obj).attr("commentNum");
	 var userId = item;
	 var commentNo = $(".commentNo[commentNum="+no+"]").val();
	 var commentWriter = writer;
		
	 if(userId == commentWriter){
		 alert("자신의 댓글에 추천하실 수 없습니다.");
		 return;
	 }

	    
	   $.ajax({
	           url:"<%=request.getContextPath()%>/board/solve/solveBoardComment1Like.do",
	           data:{commentNo:commentNo , userId:userId},
	           success:function(data){
	              $(".comment1Like[commentNum="+no+"]").html(data);
	           }
	        }); 
 }
  /* 베스트 댓글 비추천 */
  function BestCommentDislike(obj,item, writer){
 	 var no = $(obj).attr("commentNum");
 	 var userId = item;
 	 var commentNo = $(".BestCommentNo[commentNum="+no+"]").val();
 	 var commentWriter = writer;
 		
 	 if(userId == commentWriter){
 		 alert("자신의 댓글에 비추천하실 수 없습니다.");
 		 return;
 	 }
 		   $.ajax({
 		           url:"<%=request.getContextPath()%>/board/solve/solveBoardComment1Dislike.do",
 		           data:{commentNo:commentNo , userId:userId},
 		           success:function(data){
 		        	  $(".bestCommentDisike[commentNum="+no+"]").html(data);
 		           }
 		   }); 
 		   
  }
  
  /* 댓글비추천  */
	 function commentDislike(obj,item, writer){
		 var no = $(obj).attr("commentNum");
		 var userId = item;
		 var commentNo = $(".commentNo[commentNum="+no+"]").val();
		 var commentWriter = writer;
		
		 if(userId == commentWriter){
			 alert("자신의 댓글에 비추천하실 수 없습니다.");
			 return;
		 }

		 
		   $.ajax({
		           url:"<%=request.getContextPath()%>/board/solve/solveBoardComment1Dislike.do",
		           data:{commentNo:commentNo , userId:userId},
		           success:function(data){
		        	  $(".comment1Dislike[commentNum="+no+"]").html(data);
		           }
		        }); 
	 }
	 
	  /*댓글 신고하기*/
    function report(item, item2, item3){
    	var commentNo = item;
    	var commentWrtier = item2;
    	var commentContent = item3;
    	console.log("신고하기 버튼"+item+"/"+item2+"/"+item3);
        var url = "<%=request.getContextPath() %>/board/solve/solveBoardCommentReport?commentNo="+commentNo+"&commentWriter="+commentWrtier+"&commentContent="+commentContent;
    	   
    	   // 팝업창 이름
        var title = "Report";
    	var status = "left=500px, top=200px, width=600px, height=600px";
    	   
    	open(url, title, status);
    }

	  /* 게시글 신고 */
	  function Postreport(item, item2, item3){
		  var postNo = item;
		  var postTitle = item2;
		  var postWriter = item3;
		  
		  console.log("postNo="+postNo);
		  console.log("postTitle="+postTitle);
		  console.log("postWriter="+postWriter);

		  var url = "<%=request.getContextPath() %>/board/solve/solveBoardPostReport?postNo="+postNo+"&postTitle="+postTitle+"&postWriter="+postWriter;
	      var title = "Report";
	      var status = "left=500px, top=200px, width=600px, height=600px";
	    	   
	      open(url, title, status);
	  }
 	/* 대댓글 추천 */
  function level2Like(item, item2){
 	
 		var commentNo = item;
 		var commentLikeAmount = item2;
 		
 
 		var ajax_last_num = 0;
 		var current_ajax_num = ajax_last_num;
 		var check = true;
 		$(".level2Like").on({
    	
 			click:function(){
 				var no = $(this).attr("no");
				var clickCnt = $(this).attr("clickNum");
				console.log("clickCnt= "+clickCnt);
				
 				if(clickCnt==1 && check==true){
 					alert("추천은 한번만 클릭할 수 있습니다.");
 					check = false;
 					console.log("check= "+check);
 					return;
 				}
 				
 	 		   $.ajax({
 	  	           url:"<%=request.getContextPath()%>/board/solve/solveBoardComment1Like.do",
 	  	           data:{commentNo : commentNo, commentLikeAmount : commentLikeAmount},
 	  	           beforeSend:function(){
 	  	        	 ajax_last_num = ajax_last_num  + 1;
 	  	        	 
 	  	           },
 	  	           success:function(data){
 	  	        	   if(current_ajax_num == ajax_last_num-1) {
 	  	        			console.log(data);
 	 	  	        	    $(".level2Like[no="+no+"]").html("추천 "+data);  
 	  	        	   }
 	  	        		$(".level2Like[no="+no+"]").attr("clickNum", 1);
 	  	           }
 	  	           
 	  	    	}); //에이젝스
 			}
 		
    	 });
 	}
  /* 대댓글 추천 */
  function level2Like(obj, item, writer){
		var commentNo = item;
		var userId = "<%=loggedInMember.getUserId()%>";
		var commentWriter = writer;
		var no = $(obj).attr("no");
	
		if(userId == commentWriter){
			alert("자신의 댓글에는 추천하실 수 없습니다.");
			return;
		}

	 		   $.ajax({
	  	           url:"<%=request.getContextPath()%>/board/solve/solveBoardComment1Like.do",
	  	           data:{commentNo : commentNo, userId : userId},
	  	  
	  	           success:function(data){
	  	        	
	  	        			console.log(data);
	 	  	        	    $(".level2Like[no="+no+"]").html("추천 "+data);  
	  	        	 
	  	           }
	  	           
	  	    	}); //에이젝스  
			
  	 
	}
	/* 대댓글 비추천 */
	function level2Dislike(obj, commentNo, writer){
		var no = $(obj).attr("no");
		var commentNo = commentNo;
		var userId = "<%=loggedInMember.getUserId()%>";
		var commentWriter = writer;
		
	 	
		if(userId == commentWriter){
			alert("자신의 댓글에는 비추천하실 수 없습니다.");
			return;
		}
		
	 		   $.ajax({
	  	           url:"<%=request.getContextPath()%>/board/solve/solveBoardComment1Dislike.do",
	  	           data:{commentNo : commentNo, userId : userId},
	  	           success:function(data){
	  	        	
	  	        			console.log(data);
	  	        			 $(".level2Dislike[no="+no+"]").html("비추천 "+data); 
	  	        	   
	  	        	   
	  	           }
	  	           
	  	    	});    	
	}
	/* 글 추천 */
    function likey(item){
       var postNo =  $("#postNo").val(); 
       var writer = $(".writer").text().trim();
       if(!confirm("해당 글을 추천하시겠습니까?")){
          return;
       } 
       
       if(writer=="<%=loggedInMember.getUserId()%>"){
		   alert("자신의 글은 추천하실 수 없습니다.");
		   return;
	   }
         
        $.ajax({
           url:"<%=request.getContextPath()%>/board/solve/solveBoardLike.do",
           data:{postNo:postNo, userId:item},
           success:function(data){
              $("#like").html(data);
           }
        });  
        
    }
/* 글 비추천  */  
    function disLikey(item){
       var postNo =  $("#postNo").val(); 
       var writer = $(".writer").text().trim();

       
       if(!confirm("해당 글을 비추천하시겠습니까?")){
          return;
       } 
        
       if(writer=="<%=loggedInMember.getUserId()%>"){
		   alert("자신의 글은 비추천하실 수 없습니다.");
		   return;
	   }
       
          $.ajax({
              url:"<%=request.getContextPath()%>/board/solve/solveDisike.do",
              data:{postNo:postNo, userId:item},
              success:function(data){
                 $("#dislike").html(data);
                 
              }
              
           });
       
        
    }
       
   
</script>
</html>