<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
#notice-Container{
	width:100%;
	min-height:100px;
	margin-top:20px;
}

img#notice-Image{
	width:400px;
	height:280px;
	margin:20px;
	cursor:pointer;
}

#notice-Form{
	background:white;
	width:440px;
	height:400px;
}

#notice-Plain{
	font-size:18px;
	font-weight:bold;
	display:block;
	margin-left:20px;
}

#notice-Urgent{
	color:red;
	font-size:18px;
	font-weight:bold;
	display:block;
	margin-left:20px;
}

#notice-Title{
	display:block;
	margin-left:20px;
}

#notice-Date{
	display:block;
	font-size:14px;
	margin-right:20px;
	float:right;
}

#newNotice-Btn{
	outline:none;
	background:black;
	color:white;
	border:1px solid white;
	border-radius:5px;
	float:right;
}

#newNoticeBtn-Container{
	width:100%;
	height:30px;
}

#notice-Table{
	margin:0 auto;
	margin-bottom:20px;
}

#notice-Table td{
	padding:8px;
}

#paging-Area{
	width:100%;
	height:50px;
	border:1px solid white;
}
</style>
</head>
<body>
<div id="notice-Container">
<div id="newNoticeBtn-Container">
	<button id="newNotice-Btn">공지사항 등록</button>
</div>
<table id="notice-Table">
	<tr>
		<td>
			<div id="notice-Form">
				<div id="notice-Prev">
					<a href=""><img src="<%=request.getContextPath() %>/images/notice/event1.png"
						id="notice-Image" alt="" /></a>
					<span id="notice-Plain">&lt;공지사항&gt;</span>
					<!-- <span id="notice-Urgent">&lt;긴급공지&gt;</span> -->
					
					<span id="notice-Title">공지사항 제목내용입니다!</span>
					<span id="notice-Date">작성일 - 00/00/00</span>
				</div>
			</div>
		</td>
		
		<td>
			<div id="notice-Form">
				<div id="notice-Prev">
					<a href=""><img src="<%=request.getContextPath() %>/images/notice/event2.png"
						id="notice-Image" alt="" /></a>
					<span id="notice-Plain">&lt;공지사항&gt;</span>
					<!-- <span id="notice-Urgent">&lt;긴급공지&gt;</span> -->
					
					<span id="notice-Title">공지사항 제목내용입니다!</span>
					<span id="notice-Date">작성일 - 00/00/00</span>
				</div>
			</div>
		</td>
	</tr>
	
		<tr>
		<td>
			<div id="notice-Form">
				<div id="notice-Prev">
					<a href=""><img src="<%=request.getContextPath() %>/images/notice/event3.png"
						id="notice-Image" alt="" /></a>
					<span id="notice-Plain">&lt;공지사항&gt;</span>
					<!-- <span id="notice-Urgent">&lt;긴급공지&gt;</span> -->
					
					<span id="notice-Title">공지사항 제목내용입니다!</span>
					<span id="notice-Date">작성일 - 00/00/00</span>
				</div>
			</div>
		</td>
		
		<td>
			<div id="notice-Form">
				<div id="notice-Prev">
					<a href=""><img src="<%=request.getContextPath() %>/images/notice/event4.png"
						id="notice-Image" alt="" /></a>
					<span id="notice-Plain">&lt;공지사항&gt;</span>
					<!-- <span id="notice-Urgent">&lt;긴급공지&gt;</span> -->
					
					<span id="notice-Title">공지사항 제목내용입니다!</span>
					<span id="notice-Date">작성일 - 00/00/00</span>
				</div>
			</div>
		</td>
	</tr>
</table>
<div id="paging-Area">

</div>
</div>
</body>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>