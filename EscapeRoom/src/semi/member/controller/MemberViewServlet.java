package semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberViewServlet
 */
@WebServlet(name = "MemberViewServlet",  urlPatterns = "/member/memberView")
public class MemberViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 파라미터 핸들링
		String userId = request.getParameter("userId");
		
		// 2. 비즈니스로직
		// 유저 아이디 값을 가지고 회원정보 한 명의 것을 가져온다.
		Member m = new MemberService().selectOne(userId);
		System.out.println("member@MemberViewServlet = " + m);
		
		// 3. view단 처리
		// 비정상적인 요청으로 해당회원정보가 없을 경우를 대비
		String view = "/WEB-INF/views/member/memberView.jsp";
		String msg = "";
		String loc = "/";

		if (m == null) {
			view = "/WEB-INF/views/common/msg.jsp";
			loc = "/home";
			msg = "해당 회원이 존재하지 않습니다.";
		}

		// request객체에 속성 등록
		request.setAttribute("member", m); // 회원정보
		request.setAttribute("msg", msg); // 실패했을 경우만 사용
		request.setAttribute("loc", loc); // 실패했을 경우만 사용

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
