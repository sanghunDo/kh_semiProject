package semi.admin.controller;

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

import semi.admin.model.service.AdminService;
import semi.common.MyFileRenamePolicy;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberDeleteServlet
 */
@WebServlet("/admin/adminMemberDelete")
public class AdminMemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자용 회원삭제 서블릿
		// 0. 관리자로 로그인되었는지 확인하기		
		Member loggedInMember = (Member)request.getSession().getAttribute("loggedInMember");
		if(loggedInMember != null && !"admin".equals(loggedInMember.getUserId())) {
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		// 0.1. 유효성 타입 enctype으로 보냈는지 확인
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "게시판작성오류![form:enctype]");
			request.setAttribute("loc", "/home");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
				   .forward(request, response);
			return;
		}
				
		// 1. FileUpload처리 : 파일 태그 처리는 반드시 MultipartRequest 객체 사용(cos.jar 제공)
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root + "upload" + File.separator + "member";
		System.out.printf("[saveDirectory@AdminMemberDeleteServlet = %s]\n", saveDirectory);
				
		// 1.2. maxPostSize : 파일 최대 크기
		int maxPostSize = 1024 * 1024 * 10; // 10MB
				
		// 1.3. 인코딩 : utf-8
		String enc = "utf-8";
				
		// 1.4. FileRename정책
		FileRenamePolicy mfrp = new MyFileRenamePolicy();
				
		// MultipartRequest객체생성
		MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, maxPostSize, enc, mfrp);
	
		// 2. 파라미터 핸들링
		String userId = multiReq.getParameter("userId");
		System.out.println("userId@AdminMemberDeleteServlet = " + userId);
	
		// 3. 비즈니스 로직
		int result = new AdminService().deleteMember(userId);
	
		// 4. view단 처리
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/";
		
		if (result > 0) {
			msg = "해당 회원이 삭제되었습니다.";
		} else {
			msg = "해당 회원 삭제를 실패했습니다.";
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
