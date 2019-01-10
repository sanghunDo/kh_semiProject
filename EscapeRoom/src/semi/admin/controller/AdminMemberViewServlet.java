package semi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.admin.model.service.AdminService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberViewServlet
 */
@WebServlet("/admin/adminMemberView")
public class AdminMemberViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 상세보기 서블릿
		// 0. 관리자로 로그인되었는지 확인하기		
		Member memberLoggedIn = (Member)request.getSession().getAttribute("memberLoggedIn");
		if(memberLoggedIn != null || !"admin".equals(memberLoggedIn.getUserId())) {
			// 관리자가 아닐 시
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
				   .forward(request, response);
			return;
		}
		
		// 인코딩
		request.setCharacterEncoding("utf-8");
		
		// 1. 파라미터 핸들링
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		
		// 2. 비즈니스 로직
		Member m = new AdminService().selectOne("userId");
		System.out.println("adminMemberView@AdminMemberViewServlet" + m);
		
		// 3. view단 처리
		// 회원정보가 없을 경우
		String view = "/WEB-INF/views/admin/adminMemberView.jsp";
		String msg = "";
		String loc = "/";
		
		if(m == null) {
			view = "/WEB-INF/views/common/msg.jsp";
			msg = "해당 회원이 존재하지 않습니다.";
		}
		
		// request 객체에 속성 등록
		request.setAttribute("member", m);
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
