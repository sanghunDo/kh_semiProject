<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "semi.board.free.model.vo.*"  %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>    
<%
	FreeBoard fb = (FreeBoard)request.getAttribute("freeBoard");
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
   <input type="hidden" name="postNo" value="<%=fb.getPostNo() %>" />
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
                       <input type="text" name="title" style="width:450px;" value="<%=fb.getPostTitle()%>" required>
                </td>
            </tr>
            <tr>
                <th scope="col">글쓴이</th>
                <td class="wirter">
					<input type="hidden" name="writer" value="<%=loggedInMember.getUserId() %>" />

                    <%=fb.getPostWriter() %>
                </td>
            </tr>
            <tr>
                <td class="content">     
                       <textarea name="content" id="content" cols="30" rows="10" style="margin-top: 3px; width: 1004px; height: 506px; resize:none;"><%=fb.getPostContent() %></textarea>
                </td>
            </tr>
            <tr>
                <th scope="col">첨부파일</th>
                <td>			
                        <input type="file" name="up_file" onclick="check();">
                        <div id="fname"><%=fb.getPostOriginalFile()!=null?fb.getPostOriginalFile():""%></div>
                        
						<input type="hidden" name="old_renamed_file" value="<%=fb.getPostRenamedFile()%>" />
						<input type="hidden" name="old_original_file" value="<%=fb.getPostOriginalFile()%>" />
						<%if(fb.getPostOriginalFile() != null){ %>			
<input type="checkbox" name="del_file" id="del_file" style="
    position: relative;
    top: -38px;
    left: 260px;
">						<label for="del_file" style="position: relative; top: -40px;  left: 263px;">첨부파일 삭제</label>
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
   <input type="hidden" value="false" name="flag" />  

</form>
    <div id="DataBox" onclick="dataBox();">임시저장보관함</div>
    <div id="temporaryData" onclick="temporaryData();">임시저장하기</div>
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
	$("[name=updateForm]").submit();
}

function cancel(){
	var title = $("input[name=title]").val().trim().length;
	var content = $("textarea[name=content]").val().trim().length;
	var titleVal =  $("input[name=title]").val();
	var contentVal = $("textarea[name=content]").val();
	
	var referrer =  document.referrer;
	var userId = "<%=loggedInMember.getUserId()%>";
	if(title>0 || content>0){	
		if(!confirm("작성중인 글이 있습니다. 임시저장하시겠습니까? '취소'를 누르시면 작성하던 게시글이 삭제됩니다.")){
			location.href = referrer; 
		}else{ //확인버튼을 눌렀을 시
			$("[name=flag]").attr("value","true");
			$("[name=updateForm]").submit(); 
		}
	} else {
		 location.href = referrer; 
	}
	
}

function temporaryData(){
	var title = $("input[name=title]").val().trim().length;
	var content = $("textarea[name=content]").val().trim().length;
	if(title==0&&content==0){
		alert("제목과 내용을 작성해주세요.");
		return;
	}
	
	$("[name=flag]").attr("value","true");
	$("[name=updateForm]").submit(); 
}

function dataBox(){
	var url = "<%=request.getContextPath() %>/board/free/freeBoardTemporaryBox?userId=<%=loggedInMember.getUserId()%>";
	   
	   // 팝업창 이름
 	var title = "DataBox";
	var status = "left=500px, top=200px, width=600px, height=600px";
	   
	open(url, title, status);
}

</script>
</html>