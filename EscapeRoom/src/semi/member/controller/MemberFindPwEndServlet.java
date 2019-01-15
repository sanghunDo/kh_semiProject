package semi.member.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.common.SendEmail;
import semi.member.model.dao.MemberDao;
import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberFindPwEndServlet
 */
@WebServlet("/member/memberFindPwEnd")
public class MemberFindPwEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindPwEndServlet() {
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
		System.out.println("userEmail@MemberFindPwEndServlet = " + userEmail);
	
		Member m = new Member();
		m.setUserEmail(userEmail);
		m.setUserId(userId);
		System.out.printf("[m@MemberFindPwEndServlet = %s]\n", m);
		
		// 2. 업무로직요청
		int result = new MemberService().iDEmailCheck(m);
		
		System.out.println("[이메일 조회 결과 : " + result + "]@MemberFindPwEndServlet");
		
		String view = "";
		String msg = "";
		String loc = "/home";
		
		// 1. 이메일이 존재하는 경우
		if(result == MemberService.EMAIL_OK) {
			m = new SendEmail().sendEmail(userId, userEmail, 8);
			String temporaryPw = getSha512(m.getUserPassword());
			m.setUserId(userId);
			m.setUserPassword(temporaryPw);
			m.setUserEmail(userEmail);
			
			System.out.println("아이디 = " + m.getUserId());
			System.out.println("암호화 된 비밀번호 = " + m.getUserPassword());
			
			result = new MemberService().updatePassword(m);
			
			view = "/WEB-INF/views/member/memberFindPw.jsp";
			loc = "/member/memberFindPwEnd";
		} else if(result == MemberService.WRONG_PASSWORD) {
			view = "/WEB-INF/views/common/msg.jsp";
			msg = "해당 이메일이 존재하지 않습니다.";
			loc = "/member/findPw";		
		}
		else {
			view = "/WEB-INF/views/common/msg.jsp";
			msg = "해당 아이디가 존재하지 않습니다.";
			loc = "/member/findPw";			
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
	
	public String getSha512(String userPassword) {
		/**
		 * MessageDigest 클래스에는 update() 메소드가 있는데, 
		 * 이 메소드를 호출할때마다 객체 내에 저장된 digest 값이 계속해서 갱신이됩니다. 
		 * 최종적으로 digest() 메서드를 호출하면 그 값을 가져올 수 있습니다.
		 */
		System.out.println("@MemberFindPwEndServlet getSha512 : " + userPassword);
		String encUserPassword = null;
		MessageDigest md = null;
		
		// 1. 암호화객체생성 SHA-512방식
		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		// 2. 사용자가 입력한 패스워드(userPassword)를 바이트배열로 변환
		byte[] bytes = userPassword.getBytes(Charset.forName("UTF-8"));
		
		// 3. md객체에 바이트배열전달해서 갱신
		md.update(bytes);
		
		// 4. 암호화처리(return byte[])
		byte[] encBytes = md.digest();
		
		// 5. Base64인코더를 사용해서 암호화된 바이트배열 => 문자열 변환
		// Base64 인코딩 : ByteArray를 64개의 문자로 이루어진 문자열로 변환하는 방법
		encUserPassword = Base64.getEncoder().encodeToString(encBytes);
		// System.out.println("암호화 후@MemberDao : " + encUserPassword);
		
		return encUserPassword;
	}


}
