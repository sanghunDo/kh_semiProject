package semi.board.free.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CommentReport
 */
@WebServlet("/board/free/freeBoardCommentReport")
public class CommentReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		String commentWriter = request.getParameter("commentWriter");
		String commentContent = request.getParameter("commentContent");
		String view = "/WEB-INF/views/common/msg.jsp";
		
			view = "/WEB-INF/views/board/free/report.jsp";
			request.setAttribute("commentNo", commentNo);
			request.setAttribute("commentWriter", commentWriter);
			request.setAttribute("commentContent", commentContent);
			
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
