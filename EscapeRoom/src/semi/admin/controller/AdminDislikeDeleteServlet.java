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
 * Servlet implementation class AdminDislikeDeleteServlet
 */
@WebServlet("/AdminDislikeDeleteServlet")
public class AdminDislikeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDislikeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자로 로그인되었는지 확인하기
		String userId = request.getParameter("userid");
		String password = request.getParameter("password");
		System.out.printf("[%s, %s]\n", userId, password);
		
		Member loggedInMember = (Member)request.getSession().getAttribute("loggedInMember");
		if(loggedInMember != null || !"admin".equals(loggedInMember.getUserId())) {
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return;
			}
		// 2. 비즈니스 로직
		// 회원 아이디 값으로 회원정보 가져오기
		Member m = new AdminService().selectOne(userId);
		System.out.println("member@AdminViewServlet = " + m);

		// 3. view단 처리
		// 요청 실패시 오류 메세지 표시용
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/";

		if (m == null) {

		} else {

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
