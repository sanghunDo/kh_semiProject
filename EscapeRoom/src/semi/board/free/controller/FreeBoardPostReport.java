package semi.board.free.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class postReport
 */
@WebServlet("/board/free/freeBoardPostReport")
public class FreeBoardPostReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardPostReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String postTitle = request.getParameter("postTitle");
		String postWriter = request.getParameter("postWriter");
		
		System.out.println("postNo="+postNo);
		System.out.println("postTitle="+postTitle);
		System.out.println("postWriter="+postWriter);
		

		String view = "/WEB-INF/views/common/msg.jsp";
		view = "/WEB-INF/views/board/free/PostReport.jsp";
		
		request.setAttribute("postNo", postNo);
		request.setAttribute("postTitle", postTitle);
		request.setAttribute("postWriter", postWriter);

		
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
