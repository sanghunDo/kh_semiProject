/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.35
 * Generated at: 2019-01-17 09:31:59 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.board.free;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import semi.board.free.model.vo.*;
import semi.member.model.vo.*;

public final class tempoaryForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/views/common/header.jsp", Long.valueOf(1547678771168L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("semi.board.free.model.vo");
    _jspx_imports_packages.add("semi.member.model.vo");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
 
	Member loggedInMember = (Member)session.getAttribute("loggedInMember");

      out.write("\r\n");
      out.write("<!DOCTYPE>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>You Can't Escape.</title>\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Roboto+Slab\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Noto+Serif+KR\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Amatic+SC\" rel=\"stylesheet\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath() );
      out.write("/css/common/header.css\" />\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/jquery-3.3.1.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<header>\r\n");
      out.write("\t\t<div id=\"top\">\r\n");
      out.write("\t\t\t<div id=\"myMenu\">\r\n");
      out.write("\t\t\t");
if(loggedInMember == null) {
      out.write("\r\n");
      out.write("                <a href=\"");
      out.print(request.getContextPath());
      out.write("/member/login\">LOGIN</a>\r\n");
      out.write("\t\t\t");
}else{ 
      out.write("\r\n");
      out.write("                <a href=\"");
      out.print(request.getContextPath());
      out.write("/member/memberView?userId=");
      out.print(loggedInMember.getUserId());
      out.write("\">MY PAGE</a>\r\n");
      out.write("                &nbsp;&nbsp;\r\n");
      out.write("                <a href=\"");
      out.print(request.getContextPath());
      out.write("/member/logout\">LOGOUT</a>\r\n");
      out.write("\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<a href=\"");
      out.print(request.getContextPath());
      out.write("/home\"><div id=\"logo\">Escape, if you can.</div></a>\r\n");
      out.write("\t\t<div id=\"menu\">\r\n");
      out.write("\t\t\t<ul>\r\n");
      out.write("\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath());
      out.write("/home\">HOME</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath());
      out.write("/notice/noticeList\">NOTICE</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath());
      out.write("/board/rank/rankingBoardList\">RANKING</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath());
      out.write("/board/solve/solveBoardList\">SOLVE</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath());
      out.write("/board/free/freeBoardList\">FREE</a></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div id=\"game-start\">\r\n");
      out.write("\t\t\t<button class=\"enter-game\" >ENTER GAME</button>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</header>\r\n");
      out.write("\t\r\n");
      out.write("<script>\r\n");
      out.write("$(\".enter-game\").click(function(){\r\n");
      out.write("\tvar pop;\r\n");
      out.write("\tvar url = \"");
      out.print(request.getContextPath());
      out.write("/game/gameStart?userId=");
      out.print(loggedInMember!=null?loggedInMember.getUserId():"guest");
      out.write("\";\r\n");
      out.write("\tvar status = \"width=1024px, height=678px\";\r\n");
      out.write("\tpop = sessionStorage.getItem(\"game\");\r\n");
      out.write("\t\r\n");
      out.write("\tif(pop || pop != null) {alert(\"이미 게임이 실행중입니다.\"); return;} //팝업창이 열려있는 경우 중복실행 방지.\r\n");
      out.write("\t\t\r\n");
      out.write("\tif(");
      out.print(loggedInMember==null);
      out.write("){\r\n");
      out.write("\t\tvar check = confirm(\"비로그인 시 랭킹등록이 불가합니다. 계속 진행하시겠습니까?\");\r\n");
      out.write("\t\tif(!check){return;}\r\n");
      out.write("\t}\r\n");
      out.write("\tpop = open(url, \"game\", status);\r\n");
      out.write("\tsessionStorage.setItem(\"game\", pop);\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("$(function getAdminList(){\r\n");
      out.write("\tconsole.log(\"onload function\");\r\n");
      out.write("\t");
if(loggedInMember != null){
      out.write("\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\turl : \"");
      out.print(request.getContextPath());
      out.write("/header\",\r\n");
      out.write("\t\t\ttype : \"post\",\r\n");
      out.write("\t\t\tdataType : \"json\",\r\n");
      out.write("\t\t\tsuccess : function(data){\r\n");
      out.write("\t\t\t\tconsole.log(data);\r\n");
      out.write("\t\t\t\tvar aTag = $(\"#adminBtn\");\r\n");
      out.write("\t\t\t\tfor(var i in data){\r\n");
      out.write("\t\t\t\t\tif(\"");
      out.print(loggedInMember.getUserId());
      out.write("\" == data[i].adminId){\r\n");
      out.write("\t\t\t\t\t\t$(\"#myMenu a:first\").before(\"<a href='");
      out.print(request.getContextPath());
      out.write("/adminMode/adminMain' id='adminBtn'>ADMIN</a>&nbsp;&nbsp;&nbsp;&nbsp;\");\r\n");
      out.write("\t\t\t\t\t}  \r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t}, error : function(jqxhr, textStatus, errorThrown){\r\n");
      out.write("\t\t\t\tconsole.log(\"ajax처리 실패!\");\r\n");
      out.write("\t\t\t\tconsole.log(jqxhr);\r\n");
      out.write("\t\t\t\tconsole.log(textStatus);\r\n");
      out.write("\t\t\t\tconsole.log(errorThrown);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t");
}
      out.write("\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("</script>");
      out.write("    \r\n");

	String title = (String)request.getAttribute("title");
	String content = (String)request.getAttribute("content");
	String fileName = (String)request.getAttribute("fileName");
	int dataNo = (int)request.getAttribute("dataNo");
	System.out.println("(jsp안)dataNo="+dataNo);


      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath());
      out.write("/css/board/free/boardCommunityForm.css\" />\r\n");
      out.write("<title>자유게시판</title>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/jquery-3.3.1.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("function validate(){\r\n");
      out.write("\tvar content = $(\"textarea[name=content]\");\r\n");
      out.write("\r\n");
      out.write("\tif(content.val().trim().length  ==  0 ){\r\n");
      out.write("\t\talert(\"내용을 입력하세요\");\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"form[name=updateForm]\").submit();\r\n");
      out.write("\treturn true;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function check(){\r\n");
      out.write("\tconsole.log(\"바뀌는거마즘..\");\r\n");
      out.write("\t $(\"input[name=up_file]\").change(function(){\r\n");
      out.write("    $(\"#fname\").css(\"display\",\"none\");\r\n");
      out.write("\t\t \r\n");
      out.write("\t });\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("    <h3>수정하기</h3>\r\n");
      out.write("    <!--new pic-->\r\n");
      out.write("    <hr>\r\n");
      out.write("<form name=\"temporaryInsertForm\" action=\"");
      out.print(request.getContextPath() );
      out.write("/board/free/TemporaryEnd\" enctype=\"multipart/form-data\" method=\"post\">\r\n");
      out.write("   <table class=\"sub_news\" border=\"1\" cellspacing=\"0\" summary=\"게시판의 글제목리스트\">\r\n");
      out.write("        <input type=\"hidden\" value=\"");
      out.print(dataNo);
      out.write("\" name=\"dataNo\"/>\r\n");
      out.write("        <caption>게시판리스트</caption>\r\n");
      out.write("        <colgroup>\r\n");
      out.write("            <col width=\"30px\">\r\n");
      out.write("            <col width=\"100px\">\r\n");
      out.write("            <col width=\"30px\">\r\n");
      out.write("            <col width=\"30px\">\r\n");
      out.write("            <col width=\"30px\">\r\n");
      out.write("            <col width=\"30px\">\r\n");
      out.write("        </colgroup>\r\n");
      out.write("        \r\n");
      out.write("            <tr>\r\n");
      out.write("                <th scope=\"col\">제목</th>\r\n");
      out.write("                <td class=\"title\">\r\n");
      out.write("                       <input type=\"text\" name=\"title\" style=\"width:450px;\" value=\"");
      out.print(title!=null?title:"");
      out.write("\" required>\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <th scope=\"col\">글쓴이</th>\r\n");
      out.write("                <td class=\"writer\">\r\n");
      out.write("                  ");
      out.print(loggedInMember.getUserId() );
      out.write("\r\n");
      out.write("                  <input type=\"hidden\" name=\"writer\" value=\"");
      out.print(loggedInMember.getUserId() );
      out.write("\" />\r\n");
      out.write("       \r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td class=\"content\">     \r\n");
      out.write("                        <textarea name=\"content\" id=\"content\" cols=\"30\" rows=\"10\" style=\"margin-top: 3px; width: 1004px; height: 506px; resize:none;\">");
      out.print(content!=null?content:"");
      out.write("</textarea>\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <th scope=\"col\">첨부파일</th>\r\n");
      out.write("                <td>\t\t\t\r\n");
      out.write("                        <input type=\"file\" name=\"up_file\" onclick=\"check();\">\r\n");
      out.write("                        <div id=\"fname\">");
      out.print(fileName!=null?fileName:"");
      out.write("</div>\r\n");
      out.write("                        ");
System.out.println("(수정폼안에)fileName="+fileName); 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
if(!fileName.equals("")){ 
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<input type=\"checkbox\" name=\"del_file\" id=\"del_file\" style=\"position: relative;top: -38px;left: 260px;\">\t\t\t\t\t\t\r\n");
      out.write("    \t\t\t\t\t<label for=\"del_file\" style=\"position: relative; top: -40px;  left: 263px;\">첨부파일 삭제</label>\r\n");
      out.write("\t\t\t\t\t\t");
}
      out.write("\r\n");
      out.write("                 </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("    </table>\r\n");
      out.write("  <input type=\"hidden\" value=\"false\" name=\"flag\" />  \r\n");
      out.write("</form>\r\n");
      out.write("   \r\n");
      out.write("    <div id=\"DataBox\" onclick=\"dataBox();\">임시저장보관함</div>\r\n");
      out.write("    <div id=\"temporaryData\" onclick=\"temporaryData();\">임시저장하기</div>\r\n");
      out.write("    <div class=\"button\" id=\"submit\" onclick=\"submitFrm();\">등록</div>\r\n");
      out.write("    <div class=\"button\" id=\"cancel\" onclick=\"cancel();\">취소</div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("<script>\r\n");
      out.write("function submitFrm(){\r\n");
      out.write("\tvar content = $(\"textarea[name=content]\");\r\n");
      out.write("\tif(content.val().trim().length  ==  0 ){\r\n");
      out.write("\t\talert(\"내용을 입력하세요\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\t$(\"[name=temporaryInsertForm]\").submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function cancel(){\r\n");
      out.write("\tvar title = $(\"input[name=title]\").val().trim().length;\r\n");
      out.write("\tvar content = $(\"textarea[name=content]\").val().trim().length;\r\n");
      out.write("\tvar titleVal =  $(\"input[name=title]\").val();\r\n");
      out.write("\tvar contentVal = $(\"textarea[name=content]\").val();\r\n");
      out.write("\t\r\n");
      out.write("\tvar referrer =  document.referrer;\r\n");
      out.write("\tvar userId = \"");
      out.print(loggedInMember.getUserId());
      out.write("\";\r\n");
      out.write("\tif(title>0 || content>0){\t\r\n");
      out.write("\t\tif(!confirm(\"작성중인 글이 있습니다. 임시저장하시겠습니까? '취소'를 누르시면 작성하던 게시글이 삭제됩니다.\")){\r\n");
      out.write("\t\t\tlocation.href = referrer; \r\n");
      out.write("\t\t}else{ //확인버튼을 눌렀을 시\r\n");
      out.write("\t\t\t$(\"[name=flag]\").attr(\"value\",\"true\");\r\n");
      out.write("\t\t\t$(\"[name=temporaryInsertForm]\").submit(); \r\n");
      out.write("\t\t}\r\n");
      out.write("\t} else {\r\n");
      out.write("\t\t location.href = referrer; \r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function temporaryData(){\r\n");
      out.write("\tvar title = $(\"input[name=title]\").val().trim().length;\r\n");
      out.write("\tvar content = $(\"textarea[name=content]\").val().trim().length;\r\n");
      out.write("\tif(title==0&&content==0){\r\n");
      out.write("\t\talert(\"제목과 내용을 작성해주세요.\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"[name=flag]\").attr(\"value\",\"true\");\r\n");
      out.write("\t$(\"[name=temporaryInsertForm]\").submit(); \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function dataBox(){\r\n");
      out.write("\tvar url = \"");
      out.print(request.getContextPath() );
      out.write("/board/free/freeBoardTemporaryBox?userId=");
      out.print(loggedInMember.getUserId());
      out.write("\";\r\n");
      out.write("\t   \r\n");
      out.write("\t   // 팝업창 이름\r\n");
      out.write(" \tvar title = \"DataBox\";\r\n");
      out.write("\tvar status = \"left=500px, top=200px, width=600px, height=600px\";\r\n");
      out.write("\t   \r\n");
      out.write("\topen(url, title, status);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
