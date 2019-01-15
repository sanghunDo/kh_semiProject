package semi.board.free.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.free.model.dao.FreeBoardDao;

/**
 * Servlet implementation class TemporaryData
 */
@WebServlet("/board/freeBoard/temporaryDataInsert")
public class TemporaryData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TemporaryData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String title = request.getParameter("title")==null?"":request.getParameter("title");
		String content = request.getParameter("content")==null?"":request.getParameter("content");

		System.out.println("서블릿안"+userId+"/"+title+"/"+content);
//		int result = new FreeBoardDao().temporaryDataInsert(userId);
		
//		String view = "/WEB-INF/views/common/msg.jsp";
//		String msg = "";
//		String loc = "/board/free/freeBoardView?postNo="+postNo ;
//		
//		if(result >0 ) {
//			msg ="댓글을 삭제하였습니다.";
//			
//		}else {
//			msg = "삭제실패";
//		}
//		request.setAttribute("msg", msg);
//		request.setAttribute("loc", loc);
//		request.getRequestDispatcher(view).forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
