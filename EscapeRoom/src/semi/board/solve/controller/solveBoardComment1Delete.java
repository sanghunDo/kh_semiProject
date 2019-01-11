package semi.board.solve.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.solve.model.dao.SolveBoardDao;

/**
 * Servlet implementation class solveBoardComment1Delete
 */
@WebServlet("/board/solve/solveBoardCommentDelete")
public class solveBoardComment1Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public solveBoardComment1Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		int postNo = Integer.parseInt(request.getParameter("postNo"));

		int result = new SolveBoardDao().deleteComment(commentNo);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/board/solve/solveBoardView?postNo="+postNo ;
		
		if(result >0 ) {
			msg ="게시물 수정성공";
			
		}else {
			msg = "수정실패";
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
