/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.35
 * Generated at: 2019-01-07 12:06:00 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.board.free;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import semi.board.free.model.vo.*;

public final class freeBoardList_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("semi.board.free.model.vo");
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");

	List<FreeBoard> list = (List<FreeBoard>)request.getAttribute("list");
	List<FreeBoard> bestList = (List<FreeBoard>)request.getAttribute("bestList");
	int cPage = (int)request.getAttribute("cPage");
	int numPerPage = (int)request.getAttribute("numPerPage");
	String pageBar = (String)request.getAttribute("pageBar");

      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath());
      out.write("/css/boardCommunityTable.css\" />\r\n");
      out.write("<title>자유게시판</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("    <h3>자유게시판</h3>\r\n");
      out.write("    <!--new pic-->\r\n");
      out.write("    <hr>\r\n");
      out.write("    <div id=\"write\">글쓰기</div>\r\n");
      out.write("    <div class=\"sort\">\r\n");
      out.write("        <span>추천순</span>\r\n");
      out.write("        <span>최신순</span>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("   <table class=\"sub_news\" id=\"best3List\" border=\"1\" cellspacing=\"0\" summary=\"베스트3\">\r\n");
      out.write("        <caption>게시판리스트</caption>\r\n");
      out.write("        <colgroup>\r\n");
      out.write("            <col width=\"30px\">\r\n");
      out.write("            <col width=\"100px\">\r\n");
      out.write("            <col width=\"30px\">\r\n");
      out.write("            <col width=\"30px\">\r\n");
      out.write("            <col width=\"30px\">\r\n");
      out.write("            <col width=\"30px\">\r\n");
      out.write("        </colgroup>\r\n");
      out.write("            <thead>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <th scope=\"col\">글번호</th>\r\n");
      out.write("                <th scope=\"col\">제목</th>\r\n");
      out.write("                <th scope=\"col\">글쓴이</th>\r\n");
      out.write("                <th scope=\"col\">날짜</th>\r\n");
      out.write("                <th scope=\"col\">추천수</th>\r\n");
      out.write("                <th scope=\"col\">조회수</th>\r\n");
      out.write("            </tr>\r\n");
      out.write("         </thead>\r\n");
      out.write("\r\n");
      out.write("         <tbody>\r\n");
      out.write("             ");
if(bestList == null || bestList.isEmpty()) { 
      out.write("\r\n");
      out.write("             \t<tr>\r\n");
      out.write("               \t\t<td colspan=\"6\" align=\"center\">검색결과가 없습니다.</td>\r\n");
      out.write("           \t\t </tr>\r\n");
      out.write("             ");
} else {
            	 for(FreeBoard fb:bestList) {
              
      out.write("\r\n");
      out.write("                <tr class=\"best\" bgcolor=\"yellow\">\r\n");
      out.write("                        <td class=\"num\">\r\n");
      out.write("                         \tBEST\r\n");
      out.write("                        </td>\r\n");
      out.write("                        \r\n");
      out.write("                        <td class=\"title\">\r\n");
      out.write("                            ");
      out.print(fb.getPostTitle() );
      out.write("\r\n");
      out.write("                        </td>\r\n");
      out.write("                        <td class=\"wirter\">\r\n");
      out.write("                            ");
      out.print(fb.getPostWriter());
      out.write("\r\n");
      out.write("                        </td>\r\n");
      out.write("                        <td class=\"date\">\r\n");
      out.write("                            ");
      out.print(fb.getPostDate() );
      out.write("\r\n");
      out.write("                        </td>\r\n");
      out.write("                        <td class=\"like\">\r\n");
      out.write("                           ");
      out.print(fb.getPostLike() );
      out.write("\r\n");
      out.write("                        </td>\r\n");
      out.write("                        <td class=\"views\">\r\n");
      out.write("                           ");
      out.print(fb.getReadCount() );
      out.write("\r\n");
      out.write("                        </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("\t\t\t");

            	 }
             }
			
      out.write("\r\n");
      out.write("            </table>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <!---------------------------------------------------------------------------------------------------------------->\r\n");
      out.write("            <table class=\"sub_news\" border=\"1\" cellspacing=\"0\" summary=\"게시판의 글제목리스트\">\r\n");
      out.write("                    <colgroup>\r\n");
      out.write("                        <col width=\"30px\">\r\n");
      out.write("                        <col width=\"100px\">\r\n");
      out.write("                        <col width=\"30px\">\r\n");
      out.write("                        <col width=\"30px\">\r\n");
      out.write("                        <col width=\"30px\">\r\n");
      out.write("                        <col width=\"30px\">\r\n");
      out.write("                    </colgroup>\r\n");
      out.write("            ");
if(list == null || list.isEmpty()) { 
      out.write("\r\n");
      out.write("            <tr>\r\n");
      out.write("             \t<td colspan=\"6\" align=\"center\">검색결과가 없습니다. </td>\r\n");
      out.write("            </tr>\t\r\n");
      out.write("            ");
} else {
            	for(FreeBoard fb:list) {
            
      out.write("\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td class=\"num\">\r\n");
      out.write("                   ");
      out.print(fb.getPostNo() );
      out.write("\r\n");
      out.write("                </td>\r\n");
      out.write("                \r\n");
      out.write("                <td class=\"title\">\r\n");
      out.write("                   ");
      out.print(fb.getPostTitle() );
      out.write("\r\n");
      out.write("                </td>\r\n");
      out.write("                <td class=\"wirter\">\r\n");
      out.write("                \t");
      out.print(fb.getPostWriter() );
      out.write("\r\n");
      out.write("                </td>\r\n");
      out.write("                <td class=\"date\">\r\n");
      out.write("                    ");
      out.print(fb.getPostDate() );
      out.write("\r\n");
      out.write("                </td>\r\n");
      out.write("                <td class=\"like\">\r\n");
      out.write("                    ");
      out.print(fb.getPostLike() );
      out.write("\r\n");
      out.write("                </td>\r\n");
      out.write("                <td class=\"views\">\r\n");
      out.write("                   ");
      out.print(fb.getReadCount() );
      out.write("\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            ");
}
            	}
      out.write("\r\n");
      out.write("         </tbody>\r\n");
      out.write("\r\n");
      out.write("        </table>\r\n");
      out.write("   \r\n");
      out.write("    <div class=\"search-container\">\r\n");
      out.write("        <select name=\"searchOpt\" id=\"searchOpt\">\r\n");
      out.write("            <option value=\"title\">제목</option>\r\n");
      out.write("            <option value=\"content\">내용</option>\r\n");
      out.write("            <option value=\"id\">아이디</option>\r\n");
      out.write("        </select>\r\n");
      out.write("        <input type=\"text\" name=\"searchVal\" id=\"searchVal\">\r\n");
      out.write("        <div id=\"search\" style=\"width:50px\">검색</div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("<div id=\"pageBar\">\r\n");
      out.print(pageBar );
      out.write("\r\n");
      out.write("</div>\r\n");
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
