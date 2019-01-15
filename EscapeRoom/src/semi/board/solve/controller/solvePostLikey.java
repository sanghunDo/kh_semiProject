package semi.board.solve.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.board.solve.model.vo.BoardComment;
import semi.board.solve.model.dao.SolveBoardDao;

/**
 * Servlet implementation class solvePostLikey
 */
@WebServlet("/board/solve/solveBoardLike.do")
public class solvePostLikey extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public solvePostLikey() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int postNo =Integer.parseInt(request.getParameter("postNo"));
		int boardLikey =Integer.parseInt(request.getParameter("likey"));

//		System.out.println("서블릿"+postNo);
//		System.out.println("좋아요수"+boardLikey);
		
		
		int result = new SolveBoardDao().updateBoardLikey(postNo,boardLikey);
		int likey = new SolveBoardDao().getPostLikey(postNo);
//		System.out.println("result_"+result);
//		System.out.println("commentLikey"+commentLikey);
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(likey,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
