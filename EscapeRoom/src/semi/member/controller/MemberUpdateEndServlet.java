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
import semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateEndServlet
 */
@WebServlet("/member/memberUpdateEnd")
public class MemberUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateEndServlet() {
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
		
		// 1-3. 인코딩 : UTF-8
		String enc = "UTF-8";
		
		// 1-4. FileRename정책
		FileRenamePolicy mfrp = new MyFileRenamePolicy();
		
		// MultipartRequest객체생성
		MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, maxPostSize, enc, mfrp);
		
		// 2. 파라미터 핸들링
		String userId = multiReq.getParameter("userId");
		System.out.println("userId@MemberUpdateEndServlet = " + userId);
		
		String userPassword = multiReq.getParameter("userPassword");
		System.out.println("userPassword@MemberUpdateEndServlet = " + userPassword);
		
		String userEmail = multiReq.getParameter("userEmail");
		System.out.println("userEmail@MemberUpdateEndServlet = " + userEmail);
		
		// 새로 첨부한 프로필이 있다고 가정
		String userProfileOriginalFile_ = multiReq.getOriginalFileName("userProfile");
		System.out.println("userProfileOriginalFile_@MemberRegisterEndServlet = " + userProfileOriginalFile_);
		
		String userProfileRenamedFile_ = multiReq.getFilesystemName("userProfile");
		System.out.println("userProfileRenamedFile_@MemberRegisterEndServlet = " + userProfileRenamedFile_);
		
		// 이전 프로필 삭제용
		String oldProfile = multiReq.getParameter("oldRenamedProfile");
		System.out.println("oldProfile@MemberRegisterEndServlet = " + oldProfile);
		
		// 파일 유무 테스트용 파일객체
		// 업로드한 프로필이 없다면 null
		File f = multiReq.getFile("userProfile");
		
		// 1. 업로드한 사진이 있는 경우
		if(f != null && f.length() > 0) {
			// 기존 프로필 삭제처리
			File delProfile = new File(saveDirectory + oldProfile);
			// 지워진 프로필 삭제
			delProfile.delete();
			
			// 2. 프로필사진 삭제가 체크된 경우 (체크 : on, 언체크드 : null)
		} else if(multiReq.getParameter("delProfile") != null) {
			// 기존 프로필 삭제
			File delProfile = new File(saveDirectory + oldProfile);
			// 지워진 프로필 삭제
			delProfile.delete();
		
			// 3. 프로필사진 없는 경우
		} else {
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
		
		System.out.printf("[m@MemberUpdateEndServlet = %s]\n", m);
		
		int result = new MemberService().updateMember(m);
		
		String msg = "";
		String loc = "/";
		String view = "/WEB-INF/views/common/msg.jsp";
		
		
		
		if(result > 0) {
			msg = "회원정보수정이 완료되었습니다.";
			loc = "/main";
		}
		else {
			msg = "회원정보수정을 실패했습니다.";
			String root2 = request.getContextPath();
			response.sendRedirect(root2 + "/member/memberView?userId=" + userId);
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
