package semi.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.home.model.service.HomeService;
import semi.notice.model.service.noticeService;
import semi.notice.model.vo.Notice;

/**
 * Servlet implementation class AdminChangeNoticeLink
 */
@WebServlet("/admin/changeNoticeLink")
public class AdminChangeNoticeLink extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChangeNoticeLink() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//현재 링크되어있는 공지사항 객체  및 공지사항 전체 리스트 호출
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		Notice n = new noticeService().selectOneNotice(noticeNo);
		
		List<Notice> list = new HomeService().selectAllNotice();		
		String view = "/WEB-INF/views/admin/changeNoticeLink.jsp";
		
		request.setAttribute("notice", n);
		request.setAttribute("list", list);
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
