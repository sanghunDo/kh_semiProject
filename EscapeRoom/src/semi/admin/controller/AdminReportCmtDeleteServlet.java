package semi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.admin.model.dao.AdminDao;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class AdminReportCmtDelete
 */
@WebServlet("/admin/adminReportCmtDelete")
public class AdminReportCmtDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReportCmtDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자용 신고된 댓글 삭제하기 서블릿
	    // 0. 관리자로 로그인되었는지 확인하기
		// 관리자가 아니거나 로그인상태가 아니면 사이트 접근 금지
		  Member loggedInMember = (Member)request.getSession().getAttribute("loggedInMember");
	      if(loggedInMember == null || !"admin".equals(loggedInMember.getUserId())) {
	         request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
	         request.setAttribute("loc", "/home");
	         request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	         return;
	      }
	      
	      // 1. 파라미터 핸들링
	      
	      int commentNo = Integer.parseInt(request.getParameter("commentNo"));
	      int result = new AdminDao().deleteReportCmt(commentNo);
	      System.out.println("result출력" + result);
	      
	      // 2. 비즈니스 로직
	      
	      // 3. view단 처리
	      String view = "/WEB-INF/views/common/msg.jsp";
	      String msg = "";
	      String loc = "/admin/adminBoard";
	      
	      if( result >0 ) {
				msg ="댓글 삭제 성공";
			}else {
				msg = "댓글 삭제 실패";
			}
	      
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher(view).forward(request, response);
	      
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
