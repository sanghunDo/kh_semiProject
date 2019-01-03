<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/free/boardCommunityForm.css" />
<title>자유게시판</title>
</head>
<body>
<div class="container">
    <h3>수정하기</h3>
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
        
            <tr>
                <th scope="col">제목</th>
                <td class="title">
                       <input type="text">
                </td>
            </tr>
            <tr>
                <th scope="col">글쓴이</th>
                <td class="wirter">
                       관리자
                </td>
            </tr>
            <tr>
                <td class="content">
                        <textarea name="" id="" cols="30" rows="10" style="margin-top: 3px; width: 1004px; height: 506px; resize:none;"></textarea>
                </td>
            </tr>
            <tr>
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
            </tr>
    </table>
    <div class="button" id="goList">목록</div>
    <div class="button" id="submit">등록</div>
    <div class="button" id="cancel">취소</div>

</div>
</body>
</html>