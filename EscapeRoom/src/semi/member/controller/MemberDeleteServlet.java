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
import com.oreilly.servlet.multipart.FileRenamePolicy;

import semi.common.MyFileRenamePolicy;
import semi.member.model.service.MemberService;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/member/memberDelete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteServlet() {
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
		System.out.printf("[saveDirectory@MemberDeleteEndServlet = %s]\n", saveDirectory);
		
		// 1-2. maxPostSize : 파일최대크기
		int maxPostSize = 1024 * 1024 * 10; // 10MB
		
		// 1-3. 인코딩 : UTF-8
		String enc = "UTF-8";
		
		// 1-4. FileRename정책
		FileRenamePolicy mfrp = new MyFileRenamePolicy();
		
		// MultipartRequest객체생성
		MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, maxPostSize, enc, mfrp);
				
		
		
		// 1. 파라미터 핸들링
		String userId = multiReq.getParameter("userId");
		System.out.println("userId@MemberDeleteServlet = " + userId);
		
		int result = new MemberService().deleteMember(userId);
		
		String msg = "";
		String loc = "/member/logout";
		String view = "/WEB-INF/views/common/msg.jsp";
		
		if(result > 0){
			msg = "회원탈퇴 완료!";
		}
		else{
			msg = "회원탈퇴 실패!";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher(view).forward(request,  response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
