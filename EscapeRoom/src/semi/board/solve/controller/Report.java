package semi.board.solve.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Report
 */
@WebServlet("/board/solve/solveBoardCommentReport")
public class Report extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Report() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		String commentWriter = request.getParameter("commentWriter");
		String commentContent = request.getParameter("commentContent");
		String view = "/WEB-INF/views/common/msg.jsp";
			view = "/WEB-INF/views/board/solve/report.jsp";
			request.setAttribute("postNo", postNo);
			request.setAttribute("commentNo", commentNo);
			request.setAttribute("commentWriter", commentWriter);
			request.setAttribute("commentContent", commentContent);

		request.getRequestDispatcher(view).forward(request, response);
	}

}
