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
@WebServlet(name = "adminMemberViewServlet", urlPatterns="/admin/adminMemberView")
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
		// 회원정보 가져와서 request로 전송		
		// 0. 관리자로 로그인되었는지 확인하기
		// 관리자가 아니거나 URL로 접근하거나 로그인된 상태가 아니면 접근 금지
		Member loggedInMember = (Member)request.getSession().getAttribute("loggedInMember");
		if(loggedInMember != null && !"admin".equals(loggedInMember.getUserId())) {
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		// 1. 파라미터 핸들링
		String userId = request.getParameter("userId");
		
		// 2. 비즈니스 로직
		Member m = new AdminService().selectOne(userId);
		
		// 3. view단 처리
		// 비정상적인 요청으로 회원정보가 없을 경우
		String view = "/WEB-INF/views/admin/adminMemberView.jsp";
		String msg = "";
		String loc = "/";
		
		if(m == null) {
			view = "/WEB-INF/views/common/msg.jsp";
			loc = "/admin/adminBoard";
			msg = "해당 회원이 존재하지 않습니다.";
		}
		
		// request 객체에 속성 등록
		request.setAttribute("member", m); // 회원정보
		request.setAttribute("msg", msg); // 실패했을 시 사용
		request.setAttribute("loc", loc); // 실패했을 시 사용
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
