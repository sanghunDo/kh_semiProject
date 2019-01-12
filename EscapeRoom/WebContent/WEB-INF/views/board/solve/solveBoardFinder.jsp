<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,semi.board.solve.model.vo.*"  %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/solve/boardCommunityTable.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<%
	List<SolveBoard> list = (List<SolveBoard>)request.getAttribute("list");
	List<SolveBoard> bestList = (List<SolveBoard>)request.getAttribute("bestList");
	int cPage = (int)request.getAttribute("cPage");
	int numPerPage = (int)request.getAttribute("numPerPage");
	String pageBar = (String)request.getAttribute("pageBar");
	String searchVal = (String)request.getAttribute("searchVal");
	String searchType = (String)request.getAttribute("searchType");


%>
<title>공략게시판</title>
<script>
function noEnter(){
	location.href = "<%=request.getContextPath()%>/board/free/NoEnter";
}
</script>
</head>
<body>
<div class="container">
    <h3>공략게시판</h3>
    <!--new pic-->
    <hr>
    <%if(loggedInMember != null){ %>
    <div id="write" style="color:white"><a href="<%=request.getContextPath()%>/board/solve/solveBoardInsert?userId=<%=loggedInMember.getUserId()%>">글쓰기</a></div>
    <%} %>
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
            	 for(SolveBoard sb:bestList) {
              %>
          <tr class="best" bgcolor="rgb(255,187,187)">
                <td class="num"  style="color:red;">
                    BEST
                </td>
                        
                <%if(loggedInMember!=null) {%>
                <td class="title">
                   <a href="<%=request.getContextPath()%>/board/solve/solveBoardView?postNo=<%=sb.getPostNo()%>"> 
                   <%=sb.getPostTitle() %> [<%=sb.getBoard_comment_cnt() %>]
                </td>
                <%} else { %>
                   <td class="title" onclick="noEnter();">
                   <%=sb.getPostTitle() %> [<%=sb.getBoard_comment_cnt() %>]
                   </td>
                	
                <%} %>
                        <td class="wirter">
                            <%=sb.getPostWriter()%>
                        </td>
                        <td class="date">
                            <%=sb.getPostDate() %>
                        </td>
                        <td class="like">
                           <%=sb.getPostLike() %>
                        </td>
                        <td class="views">
                           <%=sb.getPostReadCount() %>
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
            	for(SolveBoard sb:list) {
            %>
            <tr>
                <td class="num">
                   <%=sb.getPostNo() %>
                </td>
                
                <%if(loggedInMember!=null) {%>
                <td class="title">
                   <a href="<%=request.getContextPath()%>/board/solve/solveBoardView?postNo=<%=sb.getPostNo()%>"> 
                   <%=sb.getPostTitle() %> [<%=sb.getBoard_comment_cnt() %>]
                </td>
                <%} else { %>
                   <td class="title" onclick="noEnter();">
                   <%=sb.getPostTitle() %> [<%=sb.getBoard_comment_cnt() %>]
                   </td>
                	
                <%} %>
                <td class="wirter">
                	<%=sb.getPostWriter() %>
                </td>
                <td class="date">
                    <%=sb.getPostDate() %>
                </td>
                <td class="like">
                    <%=sb.getPostLike() %>
                </td>
                <td class="views">
                   <%=sb.getPostReadCount() %>
                </td>
            </tr>
            <%}
            	}%>
         </tbody>

        </table>
   
    <div class="search-container">
        <select name="searchOpt" id="searchOpt">
            <option no="1" id="title" value="title" >제목</option>
            <option no="2" id="content" value="content">내용</option>
            <option no="3" id="id" value="id">아이디</option>
        </select>
        <input type="text" name="searchVal" id="searchVal" value="<%=searchVal%>">
        <div id="search" style="width:50px;position: relative;top: -42px;color: white;">검색</div>
    </div>

</div>
<div id="pageBar">
<%=pageBar %>
</div>
<script>
/* function search(){
	var no = 
	var option = $("option").val();
	console.log("option="+option);
	 */
	 $("#search").on("click", function(){
			var option = $("#searchOpt option:selected").val();
			var searchVal = $("#searchVal").val();
			var check = <%=searchType%>;
			console.log("check="+check);
		
			
			location.href = "<%=request.getContextPath()%>/board/solve/solveBoardSearch?searchType="+option+"&searchVal="+searchVal;
  });
	 
	 $(function(){
		   var category = "<%=searchType%>";
		   switch (category){
		   case "title" : $("#title").attr("selected", true);  break;
		   case "content" : $("#content").attr("selected", true); break;
		   case "id" : $("#id").attr("selected", true); break;
		   }

	});
	 

</script>
</body>
</html>