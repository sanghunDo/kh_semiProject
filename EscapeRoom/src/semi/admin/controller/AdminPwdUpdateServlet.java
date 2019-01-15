package semi.admin.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.admin.model.service.AdminService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class AdminPwdUpdateServlet
 */
@WebServlet("/admin/adminPwdUpdate")
public class AdminPwdUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPwdUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 관리자용 회원 비밀번호 수정 서블릿
		// 회원정보 가져와서 request로 전송하기
		// 0. 관리자로 로그인되었는지 확인하기
		// 관리자가 아니거나 로그인상태가 아니면 사이트 접근 금지0
		Member loggedInMember = (Member)request.getSession().getAttribute("loggedInMember");
	    if(loggedInMember != null && !"admin".equals(loggedInMember.getUserId())) {
	        request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
	        request.setAttribute("loc", "/home");
	        request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	        return;
	     }
		
		// 1. 파라미터 핸들링
	    Enumeration<String> param = request.getParameterNames();
	    
	    String userId = request.getParameter("userId");
	    System.out.println("회원 아이디(userId)@AdminPwdUpdate = " + userId);
	    
	    String userPassword = (String)request.getParameter("userPassword");
	    System.out.println("기존 비밀번호(userPassword)@AdminPwdUpdate = " + userPassword);
	    
	    String userPassword_New = (String)request.getParameter("userPassword_New");
		System.out.println("새 비밀번호(userPassword_New)@AdminPwdUpdate = " + userPassword_New);
		
		// 2. 비즈니스 로직
		// 기존 비밀번호 확인 -> loginCheck 사용: userId, userPassword로 불러와서 비교
		// 1(로그인 성공), 0(아이디 있음, 비밀번호 틀림)
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPassword(userPassword);
		System.out.println("회원 아이디 & 비밀번호: " + userId + userPassword);
		
		int result = new AdminService().loginCheck(m);
		System.out.println("result@AdminPwdUpdateServlet(기존 비밀번호 체크) = " + result);
		
		// 3. view단 처리
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/";

		if(loggedInMember != null || "admin".equals(loggedInMember.getUserId())) {
			// 새 비밀번호로 변경
			m.setUserPassword(userPassword_New); // Member 객체를 변경된 비밀번호로 갱신
			result = new AdminService().updatePassword(m);
			
			if(result > 0) {
				// 변경 성공시
				msg = "비밀번호가 변경되었습니다.";
				// 비밀번호 변경 팝업창 닫는 코드
				String script = "self.close();";
				// 코드를 jsp에 전달
				request.setAttribute("script", script);
			} else {
				// 변경 실패시
				msg = "비밀번호 변경에 실패했습니다.";
				String script = "self.close();";
				request.setAttribute("script", script); 
				}
			} else {
				msg = "기존 비밀번호를 잘못 입력하셨습니다.";
				String script = "self.close();";
				request.setAttribute("script", script);
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
