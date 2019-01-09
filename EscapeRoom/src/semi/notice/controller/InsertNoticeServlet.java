package semi.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.josephoconnell.html.HTMLInputFilter;
import com.oreilly.servlet.MultipartRequest;

import semi.common.MyFileRenamePolicy;
import semi.notice.model.service.noticeService;
import semi.notice.model.vo.Notice;

/**
 * Servlet implementation class InsertNoticeServlet
 */
@WebServlet("/notice/insertNotice")
public class InsertNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//1. 파일업로드 처리 request >> MultipartRequest 객체 사용
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "공지사항 등록 오류 : [form:enctype]");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		//a. saveDirectory : /upload/board/
		//파일의 절대경로 가져오기
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root + "upload" + File.separator + "notice";
		System.out.printf("[saveDirectory = %s]\n", saveDirectory);
		
		//b. maxPostSize : 파일최대크기 10MB
		//1kb * 1kb * 10 (바이트 단위이므로)
		int maxPostSize = 1024 * 1024 * 10;
		
		//c. 파일 Rename 정책객체 : DefaultRenamePolicy를 상속한 사용자 정의 객체
		//MultipartRequest 객체 생성
		MultipartRequest multiReq = new MultipartRequest(request,
														saveDirectory,
														maxPostSize,
														"UTF-8",
														new MyFileRenamePolicy());
		
		
		//2. parameterHandling
		//(중요) MultipartRequest 객체를 생성하면, 기존 request객체로부터 파라미터 값을 가져올 수 있다.		
		String noticeUrgent = multiReq.getParameter("noticeUrgent");
		String noticeTitle = multiReq.getParameter("noticeTitle");
		String noticeContent = multiReq.getParameter("noticeContent");
		
		//xss(Cross-site Scripting) 공격 대비 코드
		//boardContent = boardContent.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
		
		//API사용 : html-filter-1.0.jar
		noticeContent = new HTMLInputFilter().filter(noticeContent);
		
		String noticeOriginalFile = multiReq.getOriginalFileName("up-file"); 
		String noticeRenamedFile = multiReq.getFilesystemName("up-file");
		
		System.out.println(noticeOriginalFile);
		System.out.println(noticeRenamedFile);
		
		Notice n = new Notice();
		n.setNoticeTitle(noticeTitle);
		n.setNoticeOriginalFile(noticeOriginalFile);
		n.setNoticeRenamedFile(noticeRenamedFile);
		n.setNoticeContent(noticeContent);
		n.setNoticeUrgent(noticeUrgent);
		
		System.out.println("확인 : " + n);
		
		//3. 업무로직 처리
		int result = new noticeService().insertNotice(n);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/notice/noticeList";
		
		if(result > 0) {
			msg = "공지사항 등록 성공";
		}
		else {
			msg = "공지사항 등록 실패";
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
