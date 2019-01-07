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
 * Servlet implementation class MemberRegisterEndServlet
 */
@WebServlet("/member/memberRegisterEnd")
public class MemberRegisterEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberRegisterEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 파라미터 핸들링
		String userId = (String)request.getParameter("userId");
		System.out.println("userId@MemberRegisterEndServlet = " + userId);
		
		String userPassword = (String)request.getParameter("userPassword");
		System.out.println("userPassword@MemberRegisterEndServlet = " + userPassword);
		
		String userEmail = (String)request.getParameter("userEmail");
		System.out.println("userEmail@MemberRegisterEndServlet = " + userEmail);
		
		String userProfileOriginalFile = (String)request.getParameter("userProfileOriginalFile");
		System.out.println("userProfileOriginalFile@MemberRegisterEndServlet = " + userProfileOriginalFile);
		
		String userProfileRenamedFile = (String)request.getParameter("userProfileRenamedFile");
		System.out.println("userProfileRenamedFile@MemberRegisterEndServlet = " + userProfileRenamedFile);
		
		Member m = new Member(userId, userPassword, userEmail, userProfileOriginalFile, userProfileRenamedFile, null);
	
		int result = new MemberService().insertMember(m);
		
		String msg = "";
		String loc = "/main";
		String view = "/WEB-INF/views/common/msg.jsp";
		
		if(result > 0) {
			msg = "회원가입이 완료되었습니다.";
		}
		else {
			msg = "회원가입을 실패했습니다.";
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
