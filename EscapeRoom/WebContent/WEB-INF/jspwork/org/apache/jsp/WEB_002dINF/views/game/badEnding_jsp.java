/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.35
 * Generated at: 2019-01-14 11:47:38 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.game;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class badEnding_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>ESCAPE, IF YOU CAN.</title>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/jquery-3.3.1.js\"></script>\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Noto+Serif+KR\" rel=\"stylesheet\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath() );
      out.write("/css/game/gameEnding.css\" />\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<img src=\"\" alt=\"\" id=\"background\"/>\r\n");
      out.write("<div id=\"ending\">\r\n");
      out.write("\t<div id=\"msgBox\" class=\"me\">\r\n");
      out.write("\t\t<div><h2></h2></div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("<script>\r\n");
      out.write("$(window).on('keyup', function(e){\r\n");
      out.write("\tif(e.keyCode==87&&isCtrl==true){\r\n");
      out.write("\t\topener.parent.sessionStorage.removeItem(\"game\");\r\n");
      out.write("\t}\r\n");
      out.write("}).on('beforeunload', function(){\r\n");
      out.write("\topener.parent.sessionStorage.removeItem(\"game\");\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("$(\"#ending\").on('click', {cnt:0} ,function(e){\r\n");
      out.write("\tvar cnt = e.data.cnt++;\r\n");
      out.write("\tvar target = $(\"#ending\").find(\"h2\");\r\n");
      out.write("\tif(cnt==4){\r\n");
      out.write("\t\t$(\"#msgBox\").removeClass(\"me\");\r\n");
      out.write("\t}\r\n");
      out.write("\tif(cnt==17){\r\n");
      out.write("\t\t$(\"body, #background\").css({\"animation\": \"bang .1s\", \"animation-iteration-count\": \"3\"});\r\n");
      out.write("\t\t$(this).parent().fadeOut(3000); //마지막 대사 이후 클릭시 메인게임으로 이동.\r\n");
      out.write("\t\tsetTimeout(function(){\r\n");
      out.write("\t\t\tlocation.href=\"");
      out.print(request.getContextPath());
      out.write("/game/endingCredit\";\r\n");
      out.write("\t\t}, 3000);\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//대사 테이블에서 한 문장씩 가져옴.\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("\t\turl:\"");
      out.print(request.getContextPath());
      out.write("/game/badEnding\",\r\n");
      out.write("\t\tdata: \"index=\"+cnt,\r\n");
      out.write("\t\ttype: \"get\",\r\n");
      out.write("\t\tdataType: \"json\",\r\n");
      out.write("\t\tsuccess: function(data){\r\n");
      out.write("\t\t\ttarget.removeAttr(\"style\");\r\n");
      out.write("\t\t\t//대사에 해당되는 이미지가 있던 없던 불러와서 이미지를 추가함. 이미지가 없으면 \"\", 있으면 해당 파일이름.\r\n");
      out.write("\t\t\tif(data.fileName!=\"\"){\r\n");
      out.write("\t\t\t\t$(\"#background\").attr(\"src\", \"");
      out.print(request.getContextPath());
      out.write("/images/game/badEnding/\"+data.fileName).fadeIn(1500);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\ttarget.text(data.content);\r\n");
      out.write("\t\t\ttarget.parent().css(\"width\",target.outerWidth());\r\n");
      out.write("\t\t\tvar length = data.content.length;\r\n");
      out.write("\t\t\ttarget.attr(\"style\", \"animation:typing \"+(length/40)+\"s steps(\"+length+\", end)\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("/* 클리어 기록이 있을 시 엔딩 스킵 가능 */\r\n");
      out.write("$(window).on('keyup', function(e){\r\n");
      out.write("\tif(e.keyCode==32 || e.keyCode==13)\r\n");
      out.write("\t\t$(\"#prologue\").trigger('click');\r\n");
      out.write("\tif(e.keyCode==27){\r\n");
      out.write("\t\tif(confirm(\"엔딩을 스킵하시겠습니까?\")){\r\n");
      out.write("\t\t\tlocation.href=\"#\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
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
