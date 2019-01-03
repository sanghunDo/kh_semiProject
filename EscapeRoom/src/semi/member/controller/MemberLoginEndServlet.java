package semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/member/loginEnd")
public class MemberLoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 파라미터 핸들링
		String userid = request.getParameter("userid");
		String userpassword = request.getParameter("userpassword");
		System.out.printf("[%s, %s]\n", userid, userpassword);
		
		Member m = new Member();
		m.setUserid(userid);
		m.setUserpassword(userpassword);
		
		// 2. 업무로직요청
		int result = new MemberService().loginCheck(m);
		
		// return 1 : 로그인성공
		// return 0 : 패스워드 틀림
		// return -1 : 존재하지 않는 아이디
		System.out.println("[로그인 결과 : " + result + "]");
		
		// 3. view단 처리
		String view = "";
		
		// 로그인 실패한 경우 사용
		String msg = "";
		String loc = "/";
		
		// 0. 로그인 후 이전 페이지로 리다이렉트하기
		String referer = request.getHeader("Referer");
		String origin = request.getHeader("Origin");
		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI();
		
		System.out.println("referer@MemberLoginServlet=" + referer);
		System.out.println("origin@MemberLoginServlet=" + origin);
		System.out.println("url@MemberLoginServlet=" + url);
		System.out.println("uri@MemberLoginServlet=" + uri);
		
		// 크롬외 브라우저용
		if(origin == null) {
			origin = url.replace(uri, "");
		}
		
		// 1. 로그인 성공한 경우
		if(result == MemberService.LOGIN_OK) {
			// 쿠키관련
			String saveId = request.getParameter("saveId");
			// 체크된 경우 "on", 아닌 경우 null
			System.out.println("saveId@MemberLoginServlet=" + saveId);
			
			// 쿠키생성 : Server, 보관 : Client
			if(saveId != null) {
				Cookie c = new Cookie("saveId", userid);
				c.setMaxAge(7 * 24 * 60 * 60); // 쿠키유효기간 : 7일, 단위 : 초
				c.setPath("/semi"); // 쿠키유효디렉토리 설정
				response.addCookie(c);
			} else {
				// 현재 등록된 쿠키삭제 목적
				Cookie c = new Cookie("saveId", userid);
				c.setMaxAge(0); // 쿠키유효기간을 0으로 설정해서 삭제
				c.setPath("/semi"); // 삭제하고자 하는 쿠키와 동일하게
				response.addCookie(c);
			}
			
			Member loggedInMember = new MemberService().selectOne(userid);
			
			// request객체로부터 세션객체 가져오기
			// getSession 기본값 : true
			// 세션이 있으면 해당 세션을 반납, 없으면 새로 생성후 반납
			HttpSession session = request.getSession(true);
			
			// timeout설정 : web.xml보다 우선 순위 높음, 단위 : 초
			session.setMaxInactiveInterval(10 * 60);
			
			// Client의 ip주소 가져오기
			String ip = request.getRemoteAddr();
			session.setAttribute("ip", ip);
			
			// 세션객체에 속성으로 저장
			session.setAttribute("loggedInMember", loggedInMember);
			
			// 페이지 리다이렉트 : Client에게 돌려보낸 후, 해당 URL로 다시 요청하도록 함
			response.sendRedirect(request.getContextPath());
			
		} else {
			// 2. 로그인 실패한 경우
			view = "/WEB-INF/views/common/msg.jsp";
			
			if(result == MemberService.WRONG_PASSWORD) {
				msg = "패스워드를 잘 못 입력하셨습니다.";
			} else if(result == MemberService.ID_NOT_EXIST) {
				msg = "존재하지 않는 아이디입니다.";
			}
			
			// 속성에 값 보관
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			request.getRequestDispatcher(view).forward(request, response);
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
