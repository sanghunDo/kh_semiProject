package semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.model.dao.MemberDao;
import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdatePasswordEndServlet
 */
@WebServlet("/member/updatePasswordEnd")
public class MemberUpdatePasswordEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 파라미터 핸들링

//		String userId = (String)request.getParameter("userId");
		String userId = (String) request.getAttribute("userId");
		System.out.println("유저아이디(userId)@MemberUpdatePasswordEndServlet = " + userId);
		
		String userPassword = (String) request.getParameter("userPassword");
		System.out.println("원래 비밀번호(userPassword)@MemberUpdatePasswordEndServlet = " + userPassword);
		
		String userPassword_New = (String) request.getParameter("userPassword_New");
		userPassword_New = new MemberDao().getSha512(userPassword_New);
		System.out.println("새 비밀번호(userPassword_New)@MemberUpdatePasswordEndServlet = " + userPassword_New);

		// 2. 비즈니스 로직
		// 기존 비밀번호 확인
		// logincheck : userId, userPassword
		// 1(로그인 한 상태), 0(아이디는 있지만 비밀번호가 틀린 상태)
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPassword(userPassword);
		System.out.println();

		int result = new MemberService().loginCheck(m);
		String msg = "";
		String loc = "";
		
		System.out.println("result@MemberUpdatePasswordEndServlet, 기존비밀번호체크 : " + result);

		if (result == MemberService.LOGIN_OK) {
			// 새 비밀번호 변경
			m.setUserPassword(userPassword_New); // 변경할 비밀번호로 Member객체 갱신
			result = new MemberService().updatePassword(m);
			
			if(result > 0) {
				// 비밀번호 변경 성공
				msg = "비밀번호가 변경되었습니다.";
				// 팝업창을 닫기 위한 코드
				String script = "self.close();";
				// jsp에 전달하기 위해 속성으로 전달
				request.setAttribute("script", script);
			}
			else {
				// 비밀번호 변경 실패
				msg = "비밀번호 변경에 실패했습니다.";
				loc = "/member/updatePassword?userId=" + userId;
			}
			
		} else {
			msg = "기존 비밀번호를 잘 못 입력하셨습니다.";
			loc = "/member/updatePassword?userId=" + userId;
		}

		// 3. view
		String view = "/WEB-INF/views/common/msg.jsp";

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
