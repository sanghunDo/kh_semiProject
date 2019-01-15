<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/free/boardCommunityForm.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>

<title>Insert title here</title>

</head>
<body>
<div class="container">
    <h3>글쓰기</h3>
    <!--new pic-->
    <hr>
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
        <form action="<%=request.getContextPath() %>/board/free/freeBoardInsertEnd" name="writeFrm" enctype="multipart/form-data" method="post">
            <tr>
                <th scope="col">제목</th>
                <td class="title">
                       <input type="text" name="title">
                </td>
            </tr>
            <tr>
                <th scope="col">글쓴이</th>
                <td class="wirter" name="wirter">
                      <%=loggedInMember.getUserId() %>
                      <input type="hidden" name="writer" value="<%=loggedInMember.getUserId() %>" />
                </td>
            </tr>
            <tr>
                <td class="content" name="content">
                        <textarea name="content" id="" cols="30" rows="10" style="margin-top: 3px; width: 1004px; height: 506px; resize:none;"></textarea>
                </td>
            </tr>
            
            <tr>
                <th scope="col">첨부파일</th>
                <td>			
                        <input type="file" name="up_file">
                </td>
            </tr>
         </form>  
            
        <!--     <tr>
                <th scope="col">첨부파일1</th>
                <td>			
                        <input type="file" name="up_file">
                        <input type="checkbox">첨부파일삭제
                </td>
            </tr>
            <tr>
                    <th scope="col">첨부파일2</th>
                    <td>			
                            <input type="file" name="up_file">
                            <input type="checkbox">첨부파일삭제
                    </td>
            </tr>
            <tr>
                    <th scope="col">첨부파일3</th>
                    <td>			
                            <input type="file" name="up_file">
                            <input type="checkbox">첨부파일삭제
                    </td>
            </tr> -->
    </table>
    
    <div class="button" id="submit" onclick="submitFrm();">등록</div>
    <div class="button" id="cancel" onclick="cancel();">취소</div>

</div>
<script>
function submitFrm(){
	var content = $("textarea[name=content]");
	if(content.val().trim().length  ==  0 ){
		alert("내용을 입력하세요");
		return;
	}
	$("[name=writeFrm]").submit();
}

function cancel(){
	var title = $("input[name=title]").val().trim().length;
	var content = $("textarea[name=content]").val().trim().length;
	var titleVal =  $("input[name=title]").val();
	var contentVal = $("textarea[name=content]").val();
	console.log(title);
	console.log(content);
	var referrer =  document.referrer;
	var userId = "<%=loggedInMember.getUserId()%>";
	if(title>0 || content>0){	
		if(!confirm("작성중인 글이 있습니다. 임시저장하시겠습니까? '취소'를 누르시면 작성하던 게시글이 삭제됩니다.")){
			location.href = referrer; 
		}else{ //확인버튼을 눌렀을 시
			location.href = "<%=request.getContextPath()%>/board/freeBoard/temporaryDataInsert?userId="+userId+"&title="+titleVal+"&content="+content; 
		}
	} else {
		
		 location.href = referrer; 
	}
	
}
</script>
</body>
</html>