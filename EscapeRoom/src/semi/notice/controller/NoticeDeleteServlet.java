package semi.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.notice.model.service.noticeService;
import semi.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet("/notice/noticeDelete")
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		Notice n = new noticeService().selectOneNotice(noticeNo);
		String saveDirectory = getServletContext().getRealPath("/upload/notice/");
		File delFile = new File(saveDirectory + n.getNoticeRenamedFile());
		
		int result = new noticeService().deleteNotice(noticeNo);
		
		delFile.delete();
		
		String msg = "";
		String loc = "/";
		
		if(result > 0) {
			msg = "해당 공지사항이 삭제되었습니다.";
			loc = "/notice/noticeList";
		}
		
		else {
			msg = "공지사항 삭제오류";
			loc = "/WEB-INF/views/notice/noticeView?noticeNo=" + noticeNo;
		}
		
		String view = "/WEB-INF/views/common/msg.jsp";
		
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
