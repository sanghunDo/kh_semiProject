/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.35
 * Generated at: 2019-01-09 07:15:41 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.notice;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import semi.member.model.vo.*;

public final class noticeList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/views/common/header.jsp", Long.valueOf(1547018061061L));
    _jspx_dependants.put("/WEB-INF/views/common/footer.jsp", Long.valueOf(1546952895467L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
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

      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");
 
	Member loggedInMember = (Member)session.getAttribute("loggedInMember"); 

      out.write("\r\n");
      out.write("<!DOCTYPE>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>You Can't Escape..</title>\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Roboto+Slab\" rel=\"stylesheet\">\r\n");
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
      out.write("\t\t\t\t");
if("admin".equals(loggedInMember.getUserId())){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t<a href=\"");
      out.print(request.getContextPath());
      out.write("/admin/adminMemberList\">ADMIN</a>\r\n");
      out.write("\t\t\t\t\t&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t");
} 
      out.write("\r\n");
      out.write("                <a href=\"");
      out.print(request.getContextPath());
      out.write("/member/memberView?userId=");
      out.print(loggedInMember.getUserId());
      out.write("\">MY PAGE</a>\r\n");
      out.write("                \t&nbsp;&nbsp;\r\n");
      out.write("                <a href=\"");
      out.print(request.getContextPath());
      out.write("/member/logout\">LOGOUT</a>\r\n");
      out.write("\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div id=\"logo\">Escape, if you can.</div>\r\n");
      out.write("\t\t<div id=\"menu\">\r\n");
      out.write("\t\t\t<ul>\r\n");
      out.write("\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath());
      out.write("/home\">HOME</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath());
      out.write("/notice\">NOTICE</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath());
      out.write("/board/rank/rankingBoardList\">RANKING</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"\">SOLVE</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath());
      out.write("/board/free/freeBoardList\">FREE</a></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div id=\"game-start\">\r\n");
      out.write("\t\t\t<button class=\"enter-game\">ENTER GAME</button>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</header>\r\n");
      out.write("\t<script>\r\n");
      out.write("\t\t$(\".enter-game\").click(function(){\r\n");
      out.write("\t\t\tif(");
      out.print(loggedInMember==null);
      out.write("){\r\n");
      out.write("\t\t\t\tvar alert = confirm(\"로그인하지 않아서 랭킹에 등록되지 않습니다. 계속 진행하시겠습니까?\")\r\n");
      out.write("\t\t\t\tif(!alert) {\r\n");
      out.write("\t\t\t\t\tlocation.href='");
      out.print(request.getContextPath());
      out.write("/member/login';\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t//게임화면 팝업\r\n");
      out.write("\t\t\tvar url = \"");
      out.print(request.getContextPath());
      out.write("/game/gameStart?userId=");
      out.print(loggedInMember!=null?loggedInMember.getUserId():"guest");
      out.write("\";\r\n");
      out.write(" \t\t\tvar status = \"width=1024px, height=678px\";\r\n");
      out.write("\t\t\topen(url, \"\", status);\r\n");
      out.write("\t\t});\r\n");
      out.write("\t</script>");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("#notice-Container{\r\n");
      out.write("\twidth:100%;\r\n");
      out.write("\tmin-height:100px;\r\n");
      out.write("\tmargin-top:20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("img#notice-Image{\r\n");
      out.write("\twidth:400px;\r\n");
      out.write("\theight:280px;\r\n");
      out.write("\tmargin:20px;\r\n");
      out.write("\tcursor:pointer;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#notice-Form{\r\n");
      out.write("\tbackground:white;\r\n");
      out.write("\twidth:440px;\r\n");
      out.write("\theight:400px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#notice-Plain{\r\n");
      out.write("\tfont-size:18px;\r\n");
      out.write("\tfont-weight:bold;\r\n");
      out.write("\tdisplay:block;\r\n");
      out.write("\tmargin-left:20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#notice-Urgent{\r\n");
      out.write("\tcolor:red;\r\n");
      out.write("\tfont-size:18px;\r\n");
      out.write("\tfont-weight:bold;\r\n");
      out.write("\tdisplay:block;\r\n");
      out.write("\tmargin-left:20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#notice-Title{\r\n");
      out.write("\tdisplay:block;\r\n");
      out.write("\tmargin-left:20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#notice-Date{\r\n");
      out.write("\tdisplay:block;\r\n");
      out.write("\tfont-size:14px;\r\n");
      out.write("\tmargin-right:20px;\r\n");
      out.write("\tfloat:right;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#admin-Btn{\r\n");
      out.write("\toutline:none;\r\n");
      out.write("\tbackground:black;\r\n");
      out.write("\tcolor:white;\r\n");
      out.write("\tborder:1px solid white;\r\n");
      out.write("\tborder-radius:5px;\r\n");
      out.write("\tfloat:right;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#adminBtn-Container{\r\n");
      out.write("\twidth:100%;\r\n");
      out.write("\theight:30px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#notice-Table{\r\n");
      out.write("\tmargin:0 auto;\r\n");
      out.write("\tmargin-bottom:20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#notice-Table td{\r\n");
      out.write("\tpadding:8px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#paging-Area{\r\n");
      out.write("\twidth:100%;\r\n");
      out.write("\theight:50px;\r\n");
      out.write("\tborder:1px solid white;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div id=\"notice-Container\">\r\n");
      out.write("<div id=\"adminBtn-Container\">\r\n");
      out.write("\t<button id=\"admin-Btn\">공지사항 등록</button>\r\n");
      out.write("</div>\r\n");
      out.write("<table id=\"notice-Table\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t\t<div id=\"notice-Form\">\r\n");
      out.write("\t\t\t\t<div id=\"notice-Prev\">\r\n");
      out.write("\t\t\t\t\t<a href=\"\"><img src=\"");
      out.print(request.getContextPath() );
      out.write("/images/notice/event1.png\"\r\n");
      out.write("\t\t\t\t\t\tid=\"notice-Image\" alt=\"\" /></a>\r\n");
      out.write("\t\t\t\t\t<span id=\"notice-Plain\">&lt;공지사항&gt;</span>\r\n");
      out.write("\t\t\t\t\t<!-- <span id=\"notice-Urgent\">&lt;긴급공지&gt;</span> -->\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<span id=\"notice-Title\">공지사항 제목내용입니다!</span>\r\n");
      out.write("\t\t\t\t\t<span id=\"notice-Date\">작성일 - 00/00/00</span>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t\t<div id=\"notice-Form\">\r\n");
      out.write("\t\t\t\t<div id=\"notice-Prev\">\r\n");
      out.write("\t\t\t\t\t<a href=\"\"><img src=\"");
      out.print(request.getContextPath() );
      out.write("/images/notice/event2.png\"\r\n");
      out.write("\t\t\t\t\t\tid=\"notice-Image\" alt=\"\" /></a>\r\n");
      out.write("\t\t\t\t\t<span id=\"notice-Plain\">&lt;공지사항&gt;</span>\r\n");
      out.write("\t\t\t\t\t<!-- <span id=\"notice-Urgent\">&lt;긴급공지&gt;</span> -->\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<span id=\"notice-Title\">공지사항 제목내용입니다!</span>\r\n");
      out.write("\t\t\t\t\t<span id=\"notice-Date\">작성일 - 00/00/00</span>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t\t<div id=\"notice-Form\">\r\n");
      out.write("\t\t\t\t<div id=\"notice-Prev\">\r\n");
      out.write("\t\t\t\t\t<a href=\"\"><img src=\"");
      out.print(request.getContextPath() );
      out.write("/images/notice/event3.png\"\r\n");
      out.write("\t\t\t\t\t\tid=\"notice-Image\" alt=\"\" /></a>\r\n");
      out.write("\t\t\t\t\t<span id=\"notice-Plain\">&lt;공지사항&gt;</span>\r\n");
      out.write("\t\t\t\t\t<!-- <span id=\"notice-Urgent\">&lt;긴급공지&gt;</span> -->\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<span id=\"notice-Title\">공지사항 제목내용입니다!</span>\r\n");
      out.write("\t\t\t\t\t<span id=\"notice-Date\">작성일 - 00/00/00</span>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t\t<div id=\"notice-Form\">\r\n");
      out.write("\t\t\t\t<div id=\"notice-Prev\">\r\n");
      out.write("\t\t\t\t\t<a href=\"\"><img src=\"");
      out.print(request.getContextPath() );
      out.write("/images/notice/event4.png\"\r\n");
      out.write("\t\t\t\t\t\tid=\"notice-Image\" alt=\"\" /></a>\r\n");
      out.write("\t\t\t\t\t<span id=\"notice-Plain\">&lt;공지사항&gt;</span>\r\n");
      out.write("\t\t\t\t\t<!-- <span id=\"notice-Urgent\">&lt;긴급공지&gt;</span> -->\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<span id=\"notice-Title\">공지사항 제목내용입니다!</span>\r\n");
      out.write("\t\t\t\t\t<span id=\"notice-Date\">작성일 - 00/00/00</span>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<div id=\"paging-Area\">\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath() );
      out.write("/css/common/footer.css\" />\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Noto+Serif+KR\" rel=\"stylesheet\">\r\n");
      out.write(" </section>\r\n");
      out.write("      <footer>\r\n");
      out.write("         <p>&lt;Copyright 2019. <strong>ESCAPE, IF YOU CAN.</strong> All rights reserved.&gt;</p>\r\n");
      out.write("      </footer>\r\n");
      out.write("   </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
