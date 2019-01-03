<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,semi.board.free.model.vo.*"  %>
<%
	FreeBoard fb = (FreeBoard)request.getAttribute("fb");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/free/boardCommunityView.css" />
<title>자유게시판</title>
</head>
<body>
<div class="container">
     <h3>자유게시판</h3>
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
        <img src='<%=request.getContextPath()%>/images/freeBoard/declaration(white).JPG' style="width:20px; height:20px; margin-top:17.5px;">
    <i>신고하기</i>
    </div>

    <div class="opinion">
        <div id="good">
            <span id="like"><b>150</b></span>
            <img src='<%=request.getContextPath()%>/images/freeBoard/like.png'>
            <span id="likeComment">추천</span>
        </div>

        <div id="bad">
            <span id="dislike"><b>4</b></span>
            <img src='<%=request.getContextPath()%>/images/freeBoard/dislike.png'>
            <span id="dislikeComment">비추천</span>
        </div>
    </div>


    <div class="bestComment-container">
    <hr>
        <dl>
            <d>BEST</d>
            <dt>
             	   아이디
                <i>19.01.02 07:42</i>
            </dt>

            <dl class="bestCommentOpinion">
                
                <span style="padding:10px"><img src='<%=request.getContextPath()%>/images/freeBoard/commentLike.JPG' style="width:20px; height:20px">130</span>
                <span style="padding:10px"><img src='<%=request.getContextPath()%>/images/freeBoard/commentDislike.JPG' style="width:20px; height:20px">10</span>
                <span style="padding:10px"><img src='<%=request.getContextPath()%>/images/freeBoard/declaration.JPG' style="width:20px; height:20px"></span>
            </dl>

            <dd style="padding-bottom: 44px;margin-left: 10px;">
                    진짜 웃긴다 ㅋㅋㅋㅋㅋㅋ
            </dd>
            
            <span id="level2CommentList">답글 30개▼</span>
            <span>|</span>
            <span id="level2CommentWrite">답글쓰기</span>
            
        </dl>
    <hr>
    </div>

    <div id="comment-container">
        <p>
            <span>20</span>개의 댓글
        </p>
            <div class="comment-editor">
                댓글쓰기
                <hr>
                <textarea name="boardCommentContent" cols="60" rows="3" style="margin: 11px;margin-bottom: -78px;width: 800px;height: 113px;resize:none;"></textarea>
                <div id="commentSubmit">등록</div>
               
            </div><!-- end of . comment-editor -->
            
            <!-- 댓글 목록 테이블 -->
            
            <div class="commentList">
                <hr>
                 <dl>
                    <dt>
                        아이디
                        <i>19.01.02 07:42</i>
                    </dt>
        
                    <dl class="bestCommentOpinion">
                        
                        <span style="padding:10px"><img src='<%=request.getContextPath()%>/images/freeBoard/commentLike(white).JPG' style="width:20px; height:20px">130</span>
                		<span style="padding:10px"><img src='<%=request.getContextPath()%>/images/freeBoard/commentDislike(white).JPG' style="width:20px; height:20px">10</span>
                		<span style="padding:10px"><img src='<%=request.getContextPath()%>/images/freeBoard/declaration(white).JPG' style="width:20px; height:20px"></span>
                    </dl>
        
                    <dd style="padding-bottom: 44px;margin-left: 10px;">
                        진짜 웃긴다 ㅋㅋㅋㅋㅋㅋ
                    </dd>
                    
                    <span id="level2CommentList">답글 30개▼</span>
                    <span>|</span>
                    <span id="level2CommentWrite">답글쓰기</span>
                    
                </dl>
                <hr>
            </div>
        </div> <!-- end of . comment-container -->
        <div class="button" id="update" onclick="updateBoard();">수정</div>
    	<div class="button" id="delete" onclick="deleteBoard();">삭제</div>
   		<div class="button" id="goList">목록</div>
</div>
<script>
	function updateBoard(){
		
		location.href="<%=request.getContextPath()%>/board/free/freeBoardUpdate?postNo=<%=fb.getPostNo()%>;
		
		
	}
</script>

</body>
</html>