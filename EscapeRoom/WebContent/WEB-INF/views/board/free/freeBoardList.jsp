<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/boardCommunityTable.css" />
<title>자유게시판</title>
</head>
<body>
<div class="container">
    <h3>자유게시판</h3>
    <!--new pic-->
    <hr>
    <div id="write">글쓰기</div>
    <div class="sort">
        <span>추천순</span>
        <span>최신순</span>
    </div>


   <table class="sub_news" id="best3List" border="1" cellspacing="0" summary="베스트3">
        <caption>게시판리스트</caption>
        <colgroup>
            <col width="30px">
            <col width="100px">
            <col width="30px">
            <col width="30px">
            <col width="30px">
            <col width="30px">
        </colgroup>
            <thead>
            <tr>
                <th scope="col">글번호</th>
                <th scope="col">제목</th>
                <th scope="col">글쓴이</th>
                <th scope="col">날짜</th>
                <th scope="col">추천수</th>
                <th scope="col">조회수</th>
            </tr>
         </thead>

         <tbody>
             
                <tr class="best" bgcolor="yellow">
                        <td class="num">
                            BEST1
                        </td>
                        
                        <td class="title">
                            테스트입니다 
                        </td>
                        <td class="wirter">
                            관리자
                        </td>
                        <td class="date">
                            12-19
                        </td>
                        <td class="like">
                            3
                        </td>
                        <td class="views">
                            50
                        </td>
                </tr>

                <tr class="best" bgcolor="yellow">
                        <td class="num">
                            BEST2
                        </td>
                        
                        <td class="title">
                            테스트입니다 
                        </td>
                        <td class="wirter">
                            관리자
                        </td>
                        <td class="date">
                            12-19
                        </td>
                        <td class="like">
                            3
                        </td>
                        <td class="views">
                            50
                        </td>
                </tr>

                <tr class="best" bgcolor="yellow">
                        <td class="num">
                            BEST3
                        </td>
                        
                        <td class="title">
                            테스트입니다 
                        </td>
                        <td class="wirter">
                            관리자
                        </td>
                        <td class="date">
                            12-19
                        </td>
                        <td class="like">
                            3
                        </td>
                        <td class="views">
                            50
                        </td>
                </tr>
            </table>


            <!---------------------------------------------------------------------------------------------------------------->
            <table class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목리스트">
                    <colgroup>
                        <col width="30px">
                        <col width="100px">
                        <col width="30px">
                        <col width="30px">
                        <col width="30px">
                        <col width="30px">
                    </colgroup>
            <tr>
                <td class="num">
                    1
                </td>
                
                <td class="title">
                    테스트입니다 
                </td>
                <td class="wirter">
                    관리자
                </td>
                <td class="date">
                    12-19
                </td>
                <td class="like">
                    3
                </td>
                <td class="views">
                    50
                </td>
            </tr>
         </tbody>

        </table>
   
    <div class="search-container">
        <select name="searchOpt" id="searchOpt">
            <option value="title">제목</option>
            <option value="content">내용</option>
            <option value="id">아이디</option>
        </select>
        <input type="text" name="searchVal" id="searchVal">
        <div id="search" style="width:50px">검색</div>
    </div>

</div>

<div id="pageBar">
	
</div>
</body>
</html>