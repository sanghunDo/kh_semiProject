package semi.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import semi.common.MyFileRenamePolicy;
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
		
		String userPassword = multiReq.getParameter("userPassword");
		System.out.println("userPassword@MemberRegisterEndServlet = " + userPassword);
		
		String userEmail = multiReq.getParameter("userEmail");
		System.out.println("userEmail@MemberRegisterEndServlet = " + userEmail);
		
//		String userProfileOriginalFile = multiReq.getParameter("userProfileOriginalFile");
		String userProfileOriginalFile_ = multiReq.getOriginalFileName("userProfile");
		System.out.println("userProfileOriginalFile@MemberRegisterEndServlet = " + userProfileOriginalFile_);
		
//		String userProfileRenamedFile = multiReq.getParameter("userProfile");
		String userProfileRenamedFile_ = multiReq.getFilesystemName("userProfile");
		System.out.println("userProfileRenamedFile@MemberRegisterEndServlet = " + userProfileRenamedFile_);
		
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPassword(userPassword);
		m.setUserEmail(userEmail);
		m.setUserProfileOriginalFile(userProfileOriginalFile_);
		m.setUserProfileRenamedFile(userProfileRenamedFile_);
		
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

}
