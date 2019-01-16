package semi.admin.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.admin.model.dao.AdminDao;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class AdminReportDelete
 */
@WebServlet("/admin/adminReportDelete")
public class AdminReportDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReportDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자용 신고된 게시글 삭제하기 서블릿
	    // 0. 관리자로 로그인되었는지 확인하기
		// 관리자가 아니거나 로그인상태가 아니면 사이트 접근 금지
		  Member loggedInMember = (Member)request.getSession().getAttribute("loggedInMember");
	      if(loggedInMember == null || !"admin".equals(loggedInMember.getUserId())) {
	         request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
	         request.setAttribute("loc", "/home");
	         request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	         return;
	      }
	      
	      	int postNo = Integer.parseInt(request.getParameter("postNo"));
			System.out.println("postNo출력 = " + postNo);
			
			int result = new AdminDao().deleteReportBoard(postNo);
						
			String view = "/WEB-INF/views/common/msg.jsp";
			String msg = "";
			String loc = "/admin/adminBoard";
			
			if(result > 0) {
				msg = "게시글이 성공적으로 삭제되었습니다.";
			}else {
				msg = "게시글 삭제에 실패했습니다.";
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
