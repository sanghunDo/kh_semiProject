package semi.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.notice.model.service.noticeService;
import semi.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/notice/noticeList")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage;
		int numPerPage;
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}
		catch (NumberFormatException e){
			cPage = 1;
		}
		
		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		}
		catch (NumberFormatException e){
			numPerPage = 4;
		}
		
		List<Notice> list = new noticeService().selectNoticeList(cPage, numPerPage);
		
		int totalCount = new noticeService().selectTotalCount();
		System.out.println("총 게시물 수 : " + totalCount);
		
		int totalPage = (int) Math.ceil(totalCount / numPerPage) + 1;
		
		String pageBar = "";
		int pageBarSize = 5;
		
		int startPage = ((cPage - 1)/ pageBarSize) * pageBarSize + 1;
		int endPage = startPage + pageBarSize - 1;
		
		int pageNo = startPage;
		
		//[이전] section
		if(pageNo == 1) {}
		else {
			pageBar += "<a href = '" + request.getContextPath() + "/notice/noticeList?cPage=" +
						(pageNo - 1) + "&numPerPage=" + numPerPage + "'>&lt;&lt; </a>";
		}
		
		//[페이지] section
		while(pageNo <= endPage && pageNo <= totalPage) {
			if(cPage == pageNo) {
				pageBar += "<span class='cPage'>" + pageNo + "</span>";
			}
			else {
				pageBar += "&nbsp;&nbsp;<a href = '" + request.getContextPath()+ "/notice/noticeList?cPage=" +
						pageNo + "&numPerPage=" + numPerPage + "'>" + pageNo + "</a>&nbsp;&nbsp;";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage) {}
		else {
			pageBar += "<a href = '" + request.getContextPath()+ "/board/boardList?cPage=" +
					pageNo + "&numPerPage=" + numPerPage + "'> &gt;&gt;</a>";
		}
		
		String view = "/WEB-INF/views/notice/noticeList.jsp";
		
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("numPerPage", numPerPage);
		
		request.getRequestDispatcher(view).forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
