package semi.board.solve.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.solve.model.vo.BoardComment;
import semi.board.solve.model.vo.SolveBoard;
import semi.board.solve.model.dao.SolveBoardDao;

/**
 * Servlet implementation class solveBoardUpdate
 */
@WebServlet("/board/solve/solveBoardUpdate")
public class solveBoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public solveBoardUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    int postNo = Integer.parseInt(request.getParameter("postNo"));
	    
	    SolveBoard sb = new SolveBoardDao().selectByNo(postNo);
	    request.setAttribute("SolveBoard", sb);
	    String view = "/WEB-INF/views/board/solve/solveBoardUpdate.jsp";
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
