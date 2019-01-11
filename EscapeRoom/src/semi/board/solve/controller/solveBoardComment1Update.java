package semi.board.solve.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.free.model.dao.FreeBoardDao;
import semi.board.solve.model.dao.SolveBoardDao;

/**
 * Servlet implementation class solveBoardComment1Update
 */
@WebServlet("/board/solve/solveBoardCommentUpdate")
public class solveBoardComment1Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public solveBoardComment1Update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		String commentUpdate = request.getParameter("commentUpdate");
	    int ref = Integer.parseInt(request.getParameter("ref"));
	
	    System.out.println("commentNo="+commentNo);
	    System.out.println("commentUpdate="+commentUpdate);
	    System.out.println("ref="+ref);

	    int result = new FreeBoardDao().commentUpdate(commentNo,commentUpdate);
		String getUpdateComment = new SolveBoardDao().getUpdateComment(commentNo);

		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/";

		if(result>0) {
			msg = "댓글을 수정하였습니다.";
			loc ="/board/solve/solveBoardView?postNo="+ref;

		}else {
			msg = "댓글 수정에 실패했습니다.";	
			loc ="/board/solve/solveBoardView?postNo="+ref;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
		reqDispatcher.forward(request, response);
	}
	


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
