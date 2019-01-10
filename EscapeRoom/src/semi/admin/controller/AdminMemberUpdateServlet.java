package semi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberUpdateServlet
 */
@WebServlet("/AdminMemberUpdateServlet")
public class AdminMemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자용 회원정보 수정하는 서블릿
		// 회원정보 가져와서 request로 전송
		// 0. 관리자로 로그인되었는지 확인하기
		Member loggedInMember = (Member)request.getSession().getAttribute("loggedInMember");
		if(loggedInMember != null && !"admin".equals(loggedInMember.getUserId())) {
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return;
			}
		
		// 1. 파라미터 핸들링
		
		// 2. 비즈니스 로직
		
		// 3. view단 처리
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
