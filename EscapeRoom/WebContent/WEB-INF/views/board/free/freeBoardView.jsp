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
            <span>20</span>개의 댓글
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
                <div id="commentSubmit" onclick="insertComment();" style="cursor: pointer;">등록</div>
               
            </div><!-- end of . comment-editor -->
            
            <!-- 댓글 목록 테이블 -->
            
            <div class="commentList">
                <hr>
                <%for(BoardComment bc:commentList)
                	 if(bc.getCommentLevel()==1) {
                	%>
                 <dl>
                    <dt style="margin-left: 21px;">
                        <%=bc.getCommentWriter()%>
                        <i><%=bc.getCommentDate() %></i>
                    </dt>
                    
                    <dl style="display: inline-flex;position: relative;left: 177px;top: -46px;">
                		<div class="button">수정하기</div>
               			<div class="button">삭제하기</div>
            		</dl>
        
                    <dl class="bestCommentOpinion">
                            <dl class="CommentOpinion" style="position: relative; top: -111px;">
                                    <span style="padding:10px">추천<%=bc.getCommentLike()%></span>
                                    <span style="padding:10px">비추천<%=bc.getCommentDislike()%></span>
                                    <span style="padding:10px">신고하기</span>
                            </dl>
                    </dl>
        
                    <dd style="padding-bottom: 44px;margin-left: 10px; color: white; position: relative; top: -43px;left: 16px;">
                        	<%=bc.getCommentContent() %>
                    </dd>
                    
                    <span id="level2CommentList" style="margin-left: 21px;">답글 30개▼</span>
                    <div id="level2CommentList"></div>
                    <span style= "position: relative;right: -114px;top: -23px;">|</span>
                    <span id="level2CommentWrite">답글쓰기</span>
                    <div id="level2CommentWrite"></div>
                    
                </dl>
                <hr>
                <%} %>
            </div>
        </div> <!-- end of . comment-container -->
        <div class="button" id="update" onclick="updateBoard();">수정</div>
    	<div class="button" id="delete" onclick="deleteBoard();">삭제</div>
   		<div class="button" id="goList">목록</div>
</div>

<form action="<%=request.getContextPath()%>/board/free/freeBoardDelete" name="boardDelFrm" method="post">
<input type="hidden" name="postNo" value="<%=fb.getPostNo()%>" />
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
	
</script>
</html>