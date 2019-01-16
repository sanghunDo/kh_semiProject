<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "semi.board.free.model.vo.*"  %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>    
<%
	String title = (String)request.getAttribute("title");
	String content = (String)request.getAttribute("content");
	String fileName = (String)request.getAttribute("fileName");


%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/free/boardCommunityForm.css" />
<title>자유게시판</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>

<script>
function validate(){
	var content = $("textarea[name=content]");

	if(content.val().trim().length  ==  0 ){
		alert("내용을 입력하세요");
		return false;
	}
	
	$("form[name=updateForm]").submit();
	return true;
}

function check(){
	console.log("바뀌는거마즘..");
	 $("input[name=up_file]").change(function(){
    $("#fname").css("display","none");
		 
	 });
  

}

</script>
<div class="container">
    <h3>수정하기</h3>
    <!--new pic-->
    <hr>
<form name="updateForm" action="<%=request.getContextPath() %>/board/free/freeBoardUpdateEnd" enctype="multipart/form-data" method="post">
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
                       <input type="text" name="title" style="width:450px;" value="<%=title%>" required>
                </td>
            </tr>
            <tr>
                <th scope="col">글쓴이</th>
                <td class="wirter">
                       <%=loggedInMember.getUserId() %>
                </td>
            </tr>
            <tr>
                <td class="content">     
                        <textarea name="content" id="content" cols="30" rows="10" style="margin-top: 3px; width: 1004px; height: 506px; resize:none;">
                        <%=content%>
                        </textarea>
                </td>
            </tr>
            <tr>
                <th scope="col">첨부파일</th>
                <td>			
                        <input type="file" name="up_file" onclick="check();">
                        <div id="fname"><%=fileName!=null?fileName:""%></div>
                        
						<%if(fileName != null){ %>			
					<input type="checkbox" name="del_file" id="del_file" style="
    					position: relative;
    					top: -38px;
    				left: 260px;">						
    				<label for="del_file" style="position: relative; top: -40px;  left: 263px;">첨부파일 삭제</label>
						<%}%>
                 </td>
            </tr>
           <!--  <tr>
                    <th scope="col">첨부파일2</th>
                    <td>			
                            <input type="file" name="up_file2">
                         	<input type="checkbox" name="del_file" id="del_file2" />
							<label for="del_file2">첨부파일 삭제</label>
                    </td>
            </tr>
            <tr>
                    <th scope="col">첨부파일3</th>
                    <td>			
                            <input type="file" name="up_file3">
                            <input type="checkbox" name="del_file" id="del_file3" />
							<label for="del_file3">첨부파일 삭제</label>
                    </td>
            </tr>
            -->
    </table>
</form>
   
    <div class="button" id="submit" onclick="return validate();">등록</div>
    <div class="button" id="cancel" onclick="goList();">취소</div>

</div>
<script>
function goList(){

	 var referrer =  document.referrer;
	 location.href = referrer; 
}
</script>
</html>