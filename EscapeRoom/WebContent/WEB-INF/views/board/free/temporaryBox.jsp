<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,semi.board.free.model.vo.*"  %>
<%
   List<TemporaryData> boxList = (List<TemporaryData>)request.getAttribute("boxList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<title>임시보관함</title>
</head>
 <style>
        body{
            background-color: black;
        }
        .sub_news, .sub_news th, .sub_news td{
             border: 0
        }

        .sub_news a{
            color: #383838;
            text-decoration: none
        }
        .sub_news{
            width: 100%;
            border-bottom: 1px #999;
            color: white;
            font-size: 12px;
            table-layout: fixed;
        }
        .sub_news caption{
            display: none;
        }
        .sub_news th{
            padding: 5px 0 6px;
            border-top: solid 1px #999;
            border-bottom: solid 1px #b2b2b2;
            background-color: #f1f1f4;
            color: #333;
            font-weight:bold;
            line-height: 20px;
            vertical-align: top;
        }

        .sub_news td{
            padding: 8px 0 9px;
            border-bottom : solid 1px #d2d2d2;
            text-align: center;
            line-height:18px;
        }
        .sub_news .date,.sub_news .views{
            padding: 0;
            font-family: Tahoma;
            font-size: 11px;
            line-height: normal;
        }
        .sub_news .title{
            text-align: left;
            padding-left: 15px;
            font-size: 13px;
        }
        .sub_news .title .pic, .sub_news .title .new{
            margin: 0 0 2px;
            vertical-align: middle;
        }

        .container{
           /* border: 1px solid red;*/
           width: 550px;

        }
        .sub_news tbody tr:hover .title{
            text-decoration: underline;
            color: #333;
        }
        .sub_news tbody tr:hover{
        background-color : #f1f1f4; 
        cursor: pointer;  
        }
       #search,#searchVal{
            border: 1px solid #999;
            width: 50px;
            text-align: center;
            color: #666;
            font-size: 12px;
            padding: 5px 0 6px;
            border-radius: 3px;
            margin-top: 12px;
            position: relative;
        }

         #search:hover{
            background-color :#d2d2d2;
            cursor: pointer; 
         }

         #write:hover{
            background-color :#d2d2d2;
            cursor: pointer; 
         }

         #write{
            float: right;
            border: 1px solid #999;
            width: 50px;
            text-align: center;
            color: #666;
            font-size: 12px;
            padding: 5px 0 6px;
            border-radius: 3px;
            margin-bottom:  12px;
            margin-top: 7px;  
         }

         #searchVal{
            border: 1px solid #999;
            width: 200px;
            text-align: center;
            color: #666;
            font-size: 12px;
            padding: 5px 0 6px;
            border-radius: 3px;
           
         }

         #searchOpt{
            border: 1px solid #999;
            width: 60px;
            text-align: center;
            color: #666;
            font-size: 12px;
            padding: 5px 0 6px;
            border-radius: 3px;
            margin-top: 12px;  
         }
         tr .best{
            background-color :#d2d2d2;

         }
        #search{
            width: 50px;
            position: absolute;
            left: 286px;
            top: 299px;
        }

        
    </style>
</head>

<body style="width:550px;">
<div class="container">
    <h4 style="color:white">임시보관함</h4>
    <hr>
    
   <table class="sub_news" id="best3List" border="1" cellspacing="0" summary="베스트3">
        <caption>게시판리스트</caption>
        <colgroup>
 
            <col width="100px">
            <col width="30px">
          
        </colgroup>
            <thead>
            <tr>
               
                <th scope="col">제목</th>
                <th scope="col">날짜</th>
              
            </tr>
         </thead>

             
<%for(int i=0; i<boxList.size(); i++) {
	TemporaryData td = boxList.get(i);


%>

         <tbody>
            <table class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목리스트">
                    <colgroup>
                       
                        <col width="100px">
                        <col width="30px">
                  
                    </colgroup>
                    
            <%if(boxList == null || boxList.isEmpty()) { %>
             	<tr>
               		<td colspan="6" align="center">임시저장된 데이터가 없습니다.</td>
           		 </tr>
            <%} else {%>
            <tr>
                <td class="title">
                <%if(td.getDataTitle()==null){ %>
                	
                	<span onclick="check(<%=td.getDataNo() %>,'<%=td.getDataTitle() %>','<%=td.getDataContent() %>','<%=td.getDataOriginalFile() %>');">제목없음</span>
                	<input type="hidden" value="제목없음"  no="<%=i%>"/>
                <%} else {%>
                	<span onclick="check(<%=td.getDataNo() %>,'<%=td.getDataTitle() %>','<%=td.getDataContent() %>','<%=td.getDataOriginalFile() %>');"><%=td.getDataTitle() %></span>
    				<input type="hidden" value="<%=td.getDataTitle() %>" no="<%=i%>"/>
                <%} %>
                </td>

                <td class="date">
                <%=td.getDataDate() %>
               	<input type="hidden" value="<%=td.getDataDate() %>"  no="<%=i%>"/>
                </td>
            
            </tr>
      
         </tbody>

        </table>
  </div> 
<script>
function check(item1, item2, item3, item4){
	var dataNo = item1;
	var dataTitle = item2;
	var dataContent = item3;
	var fileName = item4;
    opener.location.href= "<%=request.getContextPath()%>/board/free/freeBoardTemporaryForm?dataNo="+dataNo+"&dataTitle="+dataTitle+"&dataContent="+dataContent+"&file="+fileName;
    window.close();

}
</script>

<%} }%>
</html>