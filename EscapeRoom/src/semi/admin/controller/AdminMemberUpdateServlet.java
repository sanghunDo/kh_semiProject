package semi.admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import semi.common.MyFileRenamePolicy;
import semi.admin.model.service.AdminService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberUpdateServlet
 */
@WebServlet("/admin/adminMemberUpdate")
public class AdminMemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자용 회원정보 수정하는 서블릿
		// 회원정보 가져와서 request로 전송
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
			request.setAttribute("msg", "게시판 작성 오류![form:enctype]");
			request.setAttribute("loc", "/home");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
				   .forward(request, response);
			return;
		}
		
		// 1. FileUpload처리 : 파일 태그 처리는 반드시 MultipartRequest 객체 사용(cos.jar 제공)
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root + "upload" + File.separator + "member";
		System.out.printf("[saveDirectory@AdminMemberUpdateServlet = %s]\n", saveDirectory);
		
		// 1.2. maxPostSize : 파일 최대 크기
		int maxPostSize = 1024 * 1024 * 10; // 10MB
		
		// 1.3. 인코딩 : utf-8
		String enc = "utf-8";
		
		// 1.4. FileRename정책
		FileRenamePolicy mfrp = new MyFileRenamePolicy();
				
		// MultipartRequest객체생성
		MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, maxPostSize, enc, mfrp);
		
		// 2. 파라미터 핸들링
		String userId = request.getParameter("userId");
		System.out.println("userId@AdminMemberUpdateServlet = " + userId);
		
		String userPassword = multiReq.getParameter("userPassword");
		System.out.println("userPassword@AdminMemberUpdateServlet = " + userPassword);
		
		String userEmail = request.getParameter("userEmail");
		System.out.println("userEmail@AdminMemberUpdateServlet = " + userEmail);
		
		String userProfileOriginalFile = request.getParameter("userProfileOriginalFile");
		System.out.println("userProfileOriginalFile@AdminMemberUpdateServlet = " + userProfileOriginalFile);
		
		String userProfileRenamedFile = request.getParameter("userProfileRenamedFile");
		System.out.println("userProfileRenamedFile@AdminMemberUpdateServlet = " + userProfileRenamedFile);
		
		// 새 프로필 사진을 첨부했을 경우
		String userProfileOriginalFile_ = multiReq.getOriginalFileName("userProfile");
		System.out.println("userProfileOriginalFile_@AdminMemberUpdateServlet = " + userProfileOriginalFile_);
		
		String userProfileRenamedFile_ = multiReq.getFilesystemName("userProfile");
		System.out.println("userProfileRenamedFile_@AdminMemberUpdateServlet = " + userProfileRenamedFile_);
		
		// 이전 프로필 사진 삭제용
		String oldProfile = multiReq.getParameter("oldRenamedProfile");
		System.out.println("oldProfile@AdminMemberUpdateServlet = " + oldProfile);
				
		// 프로필 사진용 파일 유무 테스트용 파일 객체
		// 업로드한 프로필 사진이 없다면 null 표시
		File f = multiReq.getFile("userProfile");
	
		if(f != null && f.length() > 0) {
			// 1. 업로드한 프로필 사진용 파일이 있을 경우
			// 기존 프로필 사진 삭제
			File delProfile = new File(saveDirectory + oldProfile);
			// 지워진 프로필 사진용 파일 삭제
			delProfile.delete();
		} else if(multiReq.getParameter("delProfile") != null) {
			// 2. 프로필 사진용 파일 삭제가 체크된 경우 (체크 : on, 언체크드 : null)
			// 기존 프로필 사진용 파일 삭제
			File delProfile = new File(saveDirectory + oldProfile);
			// 지워진 프로필 사진용 파일 삭제
			delProfile.delete();
		} else {
			// 3. 프로필 사진용 파일이 없는 경우
			// 기존값 유지
			userProfileOriginalFile_ = multiReq.getParameter("oldUserOriginalProfile");
			userProfileRenamedFile_ = multiReq.getParameter("oldUserRenamedProfile");			
		}
		
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPassword(userPassword);
		m.setUserEmail(userEmail);
		m.setUserProfileOriginalFile(userProfileOriginalFile_);
		m.setUserProfileRenamedFile(userProfileRenamedFile_);
		System.out.printf("[m@AdminMemberUpdateServlet = %s]\n", m);
		
		// 3. 비즈니스 로직
		int result = new AdminService().updateMember(m);
				
		// 4. view단 처리
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/";
		
		if (result > 0) {
			msg = "성공적으로 회원 정보를 수정하였습니다.";
			loc = "/home";
		} else {
			msg = "회원 정보 수정에 실패하였습니다.";
			String root2 = request.getContextPath();
			response.sendRedirect(root2 + "/admin/adminMemberView?userId=" + userId);
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
