package semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberFindIdEndServlet
 */
@WebServlet("/member/memberFindIdEnd")
public class MemberFindIdEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindIdEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 파라미터 핸들링
		String userEmail = request.getParameter("userEmail");
		String userId = request.getParameter("userId");
		System.out.println("userEmail@MemberFindIdEndServlet = " + userEmail);
	
		Member m = new Member();
		m.setUserEmail(userEmail);
		m.setUserId(userId);
		System.out.printf("[m@MemberFindIdEndServlet = %s]\n", m);
		
		// 2. 업무로직요청
		int result = new MemberService().emailCheck(m);
		
		System.out.println("[이메일 조회 결과 : " + result + "]@MemberFindIdEndServlet");
		
		String view = "";
		String msg = "";
		String loc = "/home";
		
		// 1. 이메일이 존재하는 경우
		if(result == MemberService.EMAIL_OK) {
			m = new MemberService().findIdByEmail(userEmail);
			view = "/WEB-INF/views/member/memberFindId.jsp";
			loc = "/member/memberFindIdEnd";
		}
		else {
			view = "/WEB-INF/views/common/msg.jsp";
			msg = "해당 이메일이 존재하지 않습니다.";
			loc = "/member/findId";			
		}
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
