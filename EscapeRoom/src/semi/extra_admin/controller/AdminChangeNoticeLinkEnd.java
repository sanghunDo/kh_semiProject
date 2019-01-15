package semi.extra_admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.home.model.service.HomeService;
import semi.notice.model.service.noticeService;
import semi.notice.model.vo.Notice;

/**
 * Servlet implementation class AdminChangeNoticeLinkEnd
 */
@WebServlet("/admin/changeNoticeLinkEnd")
public class AdminChangeNoticeLinkEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChangeNoticeLinkEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		Notice n = new noticeService().selectOneNotice(noticeNo);
		
		System.out.println("확인1 : " + noticeNo);
		System.out.println("확인2 : " + n);
		
		int result = new noticeService().updateLinkY(noticeNo);
		String msg = "";	
		
		if(result > 0) {
			msg = "링크가 변경되었습니다. 상단바를 확인하세요.";
		}
		else {
			msg = "링크 변경 실패";
		}
		
		String loc = "/home";
		String view = "/WEB-INF/views/common/msg.jsp";
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.setAttribute("linkedNotice", n);
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
