package semi.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.admin.model.service.AdminService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberListServlet
 */
@WebServlet("/admin/adminMemberList")
public class AdminMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자로 로그인되었는지 확인하기
		Member loggedInMember = (Member)request.getSession().getAttribute("loggedInMember");
		if(loggedInMember != null || !"admin".equals(loggedInMember.getMemberId())) {
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		// 파라미터 핸들링
		// 페이징
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		
		int numPerPage;
		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		} catch(NumberFormatException e) {
			numPerPage = 5;
		}
		System.out.printf("[cPage=%s, numPerPage=%s]\n", cPage, numPerPage);
		
		// 비즈니스 로직
		// 2. 1. 컨텐츠 영역
		List<Member> list = new AdminService().selectMemberList(cPage, numPerPage);
		
		// 2.2.페이지바 영역
		// 전체 컨텐츠 수(전체 회원 수)를 구하기
		int totalContent = new AdminService().selectMemberCount();
		System.out.printf("[totalContent=%s]\n", totalContent);
		
		// view단 처리
		request.getRequestDispatcher("/WEB-INF/views/admin/memberFinder.jsp").forward(request, response);
	}

}
