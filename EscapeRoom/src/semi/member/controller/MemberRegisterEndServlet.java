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
		String userid = (String)request.getParameter("userid");
		System.out.println("유저아이디왔니?" + userid);
		
		String userpassword = (String)request.getParameter("userpassword");
		System.out.println("유저비밀번호왔니?" + userpassword);
		
		String useremail = (String)request.getParameter("useremail");
		System.out.println("유저이메일왔니?" + useremail);
		
		String userprofileoriginalfile = (String)request.getParameter("userprofileoriginalfile");
		System.out.println("원본프로필 왔니?" + userprofileoriginalfile);
		
		String userprofilerenamedfile = (String)request.getParameter("userprofilerenamedfile");
		System.out.println("이름바꾼프로필 왔니?" + userprofilerenamedfile);
		
		Member m = new Member(userid, userpassword, useremail, userprofileoriginalfile, userprofilerenamedfile, null);
	
		int result = new MemberService().insertMember(m);
		
		String msg = "";
		String loc = "/";
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
