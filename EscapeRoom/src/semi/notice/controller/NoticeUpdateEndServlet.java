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
import com.oreilly.servlet.multipart.FileRenamePolicy;

import semi.common.MyFileRenamePolicy;
import semi.notice.model.service.noticeService;
import semi.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateEndServlet
 */
@WebServlet("/notice/noticeUpdateEnd")
public class NoticeUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//0. enctype == multipart/form-data 체크
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "공지사항 수정 오류");
			request.setAttribute("loc", "/");
			String view = "/WEB-INF/views/common/msg.jsp";
			request.getRequestDispatcher(view).forward(request, response);
			return;
		}
		
		//1. MultipartRequest 객체 생성
		//a. saveDirectory
		String saveDirectory = getServletContext().getRealPath("/upload/notice");
		
		//b. maxPostSize
		int maxPostSize = 1024 * 1024 * 10;
		
		//c. encoding : utf-8
		String enc = "UTF-8";
		
		//d. fileRenamePolicy
		FileRenamePolicy frp = new MyFileRenamePolicy();
		
		MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, maxPostSize, enc, frp);
		
		//2. MultipartRequest객체로부터 파라미터 핸들링
		int noticeNo = Integer.parseInt(multiReq.getParameter("noticeNo"));
		String noticeUrgent = multiReq.getParameter("noticeUrgent");
		String noticeTitle = multiReq.getParameter("noticeTitle");
		String noticeContent = multiReq.getParameter("noticeContent");
		
		//새로 첨부한 파일이 있다고 가정
		String noticeRenamedFile = multiReq.getFilesystemName("up_file");
		String noticeOriginalFile = multiReq.getOriginalFileName("up_file");
		
		//이전파일 삭제용
		String oldFile = multiReq.getParameter("old_renamed_file");
		
		//테스트용 파일 객체
		//업로드한 파일이 없다면 f = null
		File f = multiReq.getFile("up_file");
		
		//업로드한 파일이 있는 경우
		if(f != null && f.length() > 0) {
			//기존파일 삭제처리
			File delFile = new File(saveDirectory + oldFile);
			delFile.delete();
		}
		
		//첨부파일이 없는 경우
		else {
			//기존값 유지
			noticeOriginalFile = multiReq.getParameter("old_original_file");
			noticeRenamedFile = multiReq.getParameter("old_renamed_file");
		}
		
		Notice n = new Notice();
		
		n.setNoticeNo(noticeNo);
		n.setNoticeTitle(noticeTitle);
		n.setNoticeOriginalFile(noticeOriginalFile);
		n.setNoticeRenamedFile(noticeRenamedFile);
		n.setNoticeContent(noticeContent);
		n.setNoticeUrgent(noticeUrgent);
		
		System.out.println("확인 : " + n);
		
		//xss 방어코드
		n.setNoticeContent(new HTMLInputFilter().filter(noticeContent));
		n.setNoticeOriginalFile(noticeOriginalFile);
		n.setNoticeRenamedFile(noticeRenamedFile);
		
		//3. 업무로직 요청
		int result = new noticeService().updateNotice(n);
		
		//4. view단 처리
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/notice/noticeView?noticeNo=" + noticeNo;
		
		if(result > 0) {
			msg = "공지사항 수정 성공";
		}
	
		else {
			msg = "공지사항 수정 실패";
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
