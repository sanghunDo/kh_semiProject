package semi.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.admin.model.dao.AdminDao;
import semi.admin.model.service.AdminService;
import semi.admin.model.vo.ReportBoard;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class AdminReportViewServlet
 */
@WebServlet("/admin/adminReportView")
public class AdminReportViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReportViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 신고된 게시글 상세보기 서블릿
		// 신고된 게시글 정보 가져와서 request로 전송
		// 0. 관리자로 로그인되었는지 확인하기
		// 관리자가 아니거나 URL로 접근하거나 로그인된 상태가 아니면 접근 금지
		Member loggedInMember = (Member)request.getSession().getAttribute("loggedInMember");
		if(loggedInMember != null && !"admin".equals(loggedInMember.getUserId())) {
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
			request.setAttribute("loc", "/home");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		// 1. 파라미터 핸들링
		int postNo =  Integer.parseInt(request.getParameter("postNo"));
		
		// 2. 비즈니스 로직
		ReportBoard rb = new AdminService().selectReportOne(postNo);
		
		// 게시글 번호로 불러오기
		
		// 3. view단 처리
		String view = "/WEB-INF/views/admin/adminReportView.jsp";
		String msg = "";
		String loc = "/admin/adminReportView?postNo" + postNo;
		
		// 비정상적인 요청으로 해당 게시글이 없을 경우
		if (rb == null) {
			view = "/WEB-INF/views/common/msg.jsp";
			msg = "해당 게시글이 존재하지 않습니다.";
			loc = "/home";
		}

		request.setAttribute("view", view);
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.setAttribute("postNo", postNo);
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
