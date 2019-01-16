/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.35
 * Generated at: 2019-01-16 23:40:59 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.game;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class gameEndingCredit_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<meta charset=UTF-8\">\r\n");
      out.write("<title>Ending Credit</title>\r\n");
      out.write("<script src=\"js/jquery-3.3.1.js\"></script>\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Noto+Serif+KR\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Amatic+SC\" rel=\"stylesheet\">\r\n");
      out.write("<style>\r\n");
      out.write("html{\r\n");
      out.write("    background:black;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("body{\r\n");
      out.write("    width: 1008px;\r\n");
      out.write("    height: 704px;\r\n");
      out.write("    padding: 0px;\r\n");
      out.write("    margin: 0 auto;\r\n");
      out.write("    overflow: hidden;\r\n");
      out.write("    background: black;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/*이거부터*/\r\n");
      out.write("div#endingCredit-Container{\r\n");
      out.write("    position:relative;\r\n");
      out.write("    width:100%;\r\n");
      out.write("    color:white;\r\n");
      out.write("    font-family: 'Noto Serif KR', serif;\r\n");
      out.write("    text-align:center;\r\n");
      out.write("    animation-name:endingCreditAni;\r\n");
      out.write("    animation-iteration-count:1;\r\n");
      out.write("    animation-duration: 60s;\r\n");
      out.write("    animation-timing-function: linear;\r\n");
      out.write("    animation-fill-mode: forwards;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("div#title{\r\n");
      out.write("    font-size : 135px;\r\n");
      out.write("    font-family: 'Amatic SC', serif;\r\n");
      out.write("    text-shadow: 6px 6px 2px gray;\r\n");
      out.write("    width: 80%;\r\n");
      out.write("    margin: 0 auto;\r\n");
      out.write("    color: lightgray;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("@keyframes endingCreditAni{\r\n");
      out.write("    0%{\r\n");
      out.write("        top:800px;\r\n");
      out.write("    }\r\n");
      out.write("    100%{\r\n");
      out.write("        top:-4500px;\r\n");
      out.write("    }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#easterEgg{\r\n");
      out.write("    color:black;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<audio autoplay src=\"");
      out.print(request.getContextPath());
      out.write("/audio/moonlight_sonata_blackroom3.mp3\"></audio>\r\n");
      out.write("    <div id=\"endingCredit-Container\">\r\n");
      out.write("        <h1>- Escape, if you can. -</h1>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h4>정창학&nbsp;&nbsp;이재선&nbsp;&nbsp;강선영&nbsp;&nbsp;도상훈&nbsp;&nbsp;한주리&nbsp;&nbsp;신혜영&nbsp;&nbsp;이소희</h4>\r\n");
      out.write("        <br><br>        \r\n");
      out.write("        <h3>SourceTree 및 Git</h3>\r\n");
      out.write("        <h4>도상훈</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>커뮤니티 데이터베이스</h3>\r\n");
      out.write("        <h4>강선영</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>게임 데이터베이스</h3>\r\n");
      out.write("        <h4>도상훈&nbsp;&nbsp;정창학</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>회원정보</h3>\r\n");
      out.write("        <h4>이재선</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>자유게시판</h3>\r\n");
      out.write("        <h4>신혜영</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>공략게시판</h3>\r\n");
      out.write("        <h4>신혜영</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>랭킹게시판</h3>\r\n");
      out.write("        <h4>한주리</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>댓글</h3>\r\n");
      out.write("        <h4>신혜영&nbsp;&nbsp;한주리</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>공지사항 및 홈</h3>\r\n");
      out.write("        <h4>강선영</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>관리자 모드</h3>\r\n");
      out.write("        <h4>강선영</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>메인화면 및 헤더 UI</h3>\r\n");
      out.write("        <h4>도상훈</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>메인 게임</h3>\r\n");
      out.write("        <h4>도상훈&nbsp;&nbsp;정창학</h4>\r\n");
      out.write("\t\t<br><br>\r\n");
      out.write("        <h3>게임 알고리즘</h3>\r\n");
      out.write("        <h4>도상훈</h4>\r\n");
      out.write("\t\t<br><br>\r\n");
      out.write("        <h3>게임 시나리오</h3>\r\n");
      out.write("        <h4>정창학&nbsp;&nbsp;강선영</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>스토리 및 선택지</h3>\r\n");
      out.write("        <h4>강선영</h4>\r\n");
      out.write("\t\t<br><br>\r\n");
      out.write("        <h3>아이템 구매 결제 서비스</h3>\r\n");
      out.write("        <h4>이재선</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>그림</h3>\r\n");
      out.write("        <h4>정창학&nbsp;&nbsp;강선영</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>자막</h3>\r\n");
      out.write("        <h4>도상훈</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>효과음</h3>\r\n");
      out.write("        <h4>강선영</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>게임 참고</h3>\r\n");
      out.write("        <h4>검은방</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>도움</h3>\r\n");
      out.write("        <h4>김동현 강사님</h4>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3>플레이 해주셔서 감사합니다.</h3>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <div id=\"title\">Escape, if you can.</div>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <h3 id=\"easterEgg\">당신은 영원히 빠져나갈 수 없습니다.</h3>\r\n");
      out.write("        <h4>Copyrights 2019. Escape, if you can. All rights reserved.</h4>\r\n");
      out.write("    </div>\r\n");
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
