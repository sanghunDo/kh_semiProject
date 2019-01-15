package semi.board.solve.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.board.solve.model.dao.SolveBoardDao;

/**
 * Servlet implementation class solveBoardComment1Dislike
 */
@WebServlet("/board/solve/solveBoardComment1Dislike.do")
public class solveBoardComment1Dislike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public solveBoardComment1Dislike() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int commentNo =Integer.parseInt(request.getParameter("commentNo"));
		int commentDislikeAmount =Integer.parseInt(request.getParameter("commentDislikeAmount"));
		//String flag = request.getParameter("flag");
		System.out.println("commentNo="+commentNo);
		System.out.println("commentDislike="+commentDislikeAmount);
		int result = new SolveBoardDao().updateDislike(commentNo,commentDislikeAmount);
		int dislike = new SolveBoardDao().getDislike(commentNo);
		//System.out.println("result"+result);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(dislike,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
