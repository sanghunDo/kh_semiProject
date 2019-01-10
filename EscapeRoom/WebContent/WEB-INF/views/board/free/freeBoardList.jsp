<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,semi.board.free.model.vo.*"  %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	List<FreeBoard> list = (List<FreeBoard>)request.getAttribute("list");
	List<FreeBoard> bestList = (List<FreeBoard>)request.getAttribute("bestList");
	int cPage = (int)request.getAttribute("cPage");
	int numPerPage = (int)request.getAttribute("numPerPage");
	String pageBar = (String)request.getAttribute("pageBar");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/free/boardCommunityTable.css" />
<title>자유게시판</title>
</head>
<body>
<div class="container">
    <h3>자유게시판</h3>
    <!--new pic-->
    <hr>
    <div id="write" style="color:white"><a href="<%=request.getContextPath()%>/board/free/freeBoardInsert">글쓰기</a></div>
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
             <%if(bestList == null || bestList.isEmpty()) { %>
             	<tr>
               		<td colspan="6" align="center">검색결과가 없습니다.</td>
           		 </tr>
             <%} else {
            	 for(FreeBoard fb:bestList) {
              %>
          <tr class="best" bgcolor="rgb(255,187,187)">
                        <td class="num"  style="color:red;">
                         	BEST
                        </td>
                        
                        <td class="title">
                        	 <a href="<%=request.getContextPath()%>/board/free/freeBoardView?postNo=<%=fb.getPostNo()%>">
                            <%=fb.getPostTitle() %> [<%=fb.getBoard_comment_cnt() %>]
                        </td>
                        <td class="wirter">
                            <%=fb.getPostWriter()%>
                        </td>
                        <td class="date">
                            <%=fb.getPostDate() %>
                        </td>
                        <td class="like">
                           <%=fb.getPostLike() %>
                        </td>
                        <td class="views">
                           <%=fb.getPostReadCount() %>
                        </td>
                </tr>
			<%
            	 }
             }
			%>
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
            <%if(list == null || list.isEmpty()) { %>
            <tr>
             	<td colspan="6" align="center">검색결과가 없습니다. </td>
            </tr>	
            <%} else {
            	for(FreeBoard fb:list) {
            %>
            <tr style="color:white;">
                <td class="num">
                   <%=fb.getPostNo() %>
                </td>
                
                <td class="title" style="color:white;">
                   <a href="<%=request.getContextPath()%>/board/free/freeBoardView?postNo=<%=fb.getPostNo()%>">
                   <%=fb.getPostTitle() %> [<%=fb.getBoard_comment_cnt() %>]
                </td>
                <td class="wirter">
                	<%=fb.getPostWriter() %>
                </td>
                <td class="date">
                    <%=fb.getPostDate() %>
                </td>
                <td class="like">
                    <%=fb.getPostLike() %>
                </td>
                <td class="views">
                   <%=fb.getPostReadCount() %>
                </td>
            </tr>
            <%}
            	}%>
         </tbody>

        </table>
   
    <div class="search-container">
        <select name="searchOpt" id="searchOpt">
            <option value="title">제목</option>
            <option value="content">내용</option>
            <option value="id">아이디</option>
        </select>
        <input type="text" name="searchVal" id="searchVal">
        <div id="search" style="width:50px;position: relative;top: -42px;color: white;">검색</div>
    </div>

</div>
<div id="pageBar">
<%=pageBar %>
</div>
</body>
</html>