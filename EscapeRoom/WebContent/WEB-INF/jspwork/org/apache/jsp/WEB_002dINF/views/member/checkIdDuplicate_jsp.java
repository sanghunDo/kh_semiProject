/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.35
 * Generated at: 2019-01-14 06:42:18 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class checkIdDuplicate_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\r');
      out.write('\n');

	boolean isUsable = (boolean)request.getAttribute("isUsable");
	String userId = (String)request.getAttribute("userId");
	System.out.printf("[%s %s]\n", isUsable, userId);
	System.out.println("userId@checkIdDuplicate.jsp=" + userId);

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>아이디 중복검사</title>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath() );
      out.write("/js/jquery-3.3.1.js\"></script>\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Noto+Serif+KR\" rel=\"stylesheet\">\r\n");
      out.write("<script>\r\n");
      out.write("function checkIdDuplicate(){\r\n");
      out.write("\tvar userId = $(\"#userId\").val(); // 유저 아이디\r\n");
      out.write("\tvar getUserId = RegExp(/^[a-zA-Z]+[a-zA-Z0-9]{4,11}$/); // 유저 아이디 유효성 검사\r\n");
      out.write("\t\r\n");
      out.write("\tif(userId == \"\"){\r\n");
      out.write("\t\talert(\"아이디를 입력해주세요.\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tif(!getUserId.test(userId)){\r\n");
      out.write("\t\talert(\"아이디는 영문자로 시작하고, 5~12자 영문자 또는 숫자를 입력해주세요.\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tcheckIdDuplicateFrm.userId.value = userId;\r\n");
      out.write("\tcheckIdDuplicateFrm.submit();\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function setUserId(userId){\r\n");
      out.write("\t// 부모창의 frm\r\n");
      out.write("\t//*opener : 자식 창이 부모창으로 값을 전달해주겠다는것\r\n");
      out.write("\tconsole.log(\"function setUserId(userId) 들어옴\");\r\n");
      out.write("\tvar frm = opener.document.memberRegisterFrm;\r\n");
      out.write("\tfrm.userId.value = userId;\r\n");
      out.write("\tfrm.idRegister.value = 1;\r\n");
      out.write("\tfrm.userPassword.focus();\r\n");
      out.write("\t\r\n");
      out.write("\t// 현재 창을 제어\r\n");
      out.write("\tself.close();\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("<style>\r\n");
      out.write("body{\r\n");
      out.write("\tbackground:black;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#checkId-Container{\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\tpadding-top: 30px;\r\n");
      out.write("\tbackground:black;\r\n");
      out.write("\tcolor:white;\r\n");
      out.write("\tfont-family:'Noto Serif KR', serif;\r\n");
      out.write("\tfont-weight:bold;\r\n");
      out.write("\tfont-size:20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("span#duplicated{\r\n");
      out.write("\tcolor: red;\r\n");
      out.write("\tfont-weight: bold;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".myBtn{\r\n");
      out.write("\twidth:100px;\r\n");
      out.write("\theight:40px;\r\n");
      out.write("\tbackground:#353535;\r\n");
      out.write("\tcolor:white;\r\n");
      out.write("\tfont-family: 'Noto Serif KR', serif;\r\n");
      out.write("\tfont-size:18px;\r\n");
      out.write("\tfont-weight:bold;\r\n");
      out.write("\tborder:1px solid #353535;\r\n");
      out.write("\tborder-radius:10px;\r\n");
      out.write("\tcursor:pointer;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div id=\"checkId-Container\">\r\n");
      out.write("\t");
if(isUsable){ 
      out.write("\r\n");
      out.write("\t\t[");
      out.print(userId );
      out.write("] 는 사용가능합니다.\r\n");
      out.write("\t\t<br /><br />\r\n");
      out.write("\t\t<button type=\"button\" class=\"myBtn\" onclick=\"setUserId('");
      out.print(userId );
      out.write("');\">닫기</button>\r\n");
      out.write("\t");
}
	else{
      out.write("\r\n");
      out.write("\t\t[<span id=\"duplicated\">");
      out.print(userId );
      out.write("</span>]는 이미 사용중입니다.\r\n");
      out.write("\t\t<form action=\"");
      out.print(request.getContextPath() );
      out.write("/member/checkIdDuplicate\"\r\n");
      out.write("\t \t\t  method=\"post\"\r\n");
      out.write("\t  \t\t name=\"checkIdDuplicateFrm\">\r\n");
      out.write("\t\t<input type=\"text\" \r\n");
      out.write("\t\t\t   name=\"userId\"\r\n");
      out.write("\t\t\t   id=\"userId\"\r\n");
      out.write("\t\t\t   placeholder=\"아이디를 입력하세요.\" />\r\n");
      out.write("\t\t<button type=\"button\" class=\"myBtn\" onclick=\"checkIdDuplicate();\">중복검사</button>\r\n");
      out.write("</form>\r\n");
      out.write("\t");
} 
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
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
