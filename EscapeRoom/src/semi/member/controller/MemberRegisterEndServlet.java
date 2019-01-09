package semi.member.controller;

import java.io.File;
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

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import semi.common.MyFileRenamePolicy;
import semi.member.model.dao.MemberDao;
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
		// 0. 유효성 타입 enctype으로 보냈는지 확인
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "게시판작성오류![form:enctype]");
			request.setAttribute("loc", "/main");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
				   .forward(request, response);
			return; // 더 실행되지 않도록 return처리
		}
		
		// 1. FileUpload처리 : 파일태그처리는 반드시 MultipartRequest객체사용(cos.jar 제공)
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root + "upload" + File.separator + "member";
		System.out.printf("[saveDirectory@MemberRegisterEndServlet = %s]\n", saveDirectory);
		
		
		// 1-2. maxPostSize : 파일최대크기
		int maxPostSize = 1024 * 1024 * 10; // 10MB
		
		
		// MultipartRequest객체생성
		MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, maxPostSize, "UTF-8", new MyFileRenamePolicy());
		
		// 2. 파라미터 핸들링
		// MultipartRequest객체를 생성하면 기존 request객체로부터 파라미터값을 가져올 수 없다
		String userId = multiReq.getParameter("userId");
		System.out.println("userId@MemberRegisterEndServlet = " + userId);
//		죽여줘
//		String userPassword = getSha512(multiReq.getParameter("userPassword"));
		String userPassword = new MemberDao().getSha512(multiReq.getParameter("userPassword"));		
		System.out.println("userPassword@MemberRegisterEndServlet = " + userPassword);
		
		String userEmail = multiReq.getParameter("userEmail");
		System.out.println("userEmail@MemberRegisterEndServlet = " + userEmail);
		
//		String userProfileOriginalFile = multiReq.getParameter("userProfileOriginalFile");
		String userProfileOriginalFile = multiReq.getOriginalFileName("userProfile");
		System.out.println("userProfileOriginalFile@MemberRegisterEndServlet = " + userProfileOriginalFile);
		
//		String userProfileRenamedFile = multiReq.getParameter("userProfile");
		String userProfileRenamedFile = multiReq.getFilesystemName("userProfile");
		System.out.println("userProfileRenamedFile@MemberRegisterEndServlet = " + userProfileRenamedFile);
		
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPassword(userPassword);
		m.setUserEmail(userEmail);
		m.setUserProfileOriginalFile(userProfileOriginalFile);
		m.setUserProfileRenamedFile(userProfileRenamedFile);
		
		System.out.printf("[m@MemberRegisterEndServlet = %s]\n", m);
		
		
		// 3. 비즈니스로직
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
	
	
	// EncryptWrapper가 안되므로 여기서 바로 바꿔줌
//	private String getSha512(String userPassword) {
//		/**
//		 * MessageDigest 클래스에는 update() 메소드가 있는데, 
//		 * 이 메소드를 호출할때마다 객체 내에 저장된 digest 값이 계속해서 갱신이됩니다. 
//		 * 최종적으로 digest() 메서드를 호출하면 그 값을 가져올 수 있습니다.
//		 */
//		System.out.println("@MemberRegisterEndServlet getSha512 : " + userPassword);
//		String encUserPassword = null;
//		MessageDigest md = null;
//		
//		// 1. 암호화객체생성 SHA-512방식
//		try {
//			md = MessageDigest.getInstance("SHA-512");
//		} catch (NoSuchAlgorithmException e) {
//			e.printStackTrace();
//		}
//		// 2. 사용자가 입력한 패스워드(userPassword)를 바이트배열로 변환
//		byte[] bytes = userPassword.getBytes(Charset.forName("UTF-8"));
//		
//		// 3. md객체에 바이트배열전달해서 갱신
//		md.update(bytes);
//		
//		// 4. 암호화처리(return byte[])
//		byte[] encBytes = md.digest();
//		
//		// 5. Base64인코더를 사용해서 암호화된 바이트배열 => 문자열 변환
//		// Base64 인코딩 : ByteArray를 64개의 문자로 이루어진 문자열로 변환하는 방법
//		encUserPassword = Base64.getEncoder().encodeToString(encBytes);
//		System.out.println("암호화 후@MemberRegisterEndServlet : " + encUserPassword);
//		
//		return encUserPassword;
//	}
}
