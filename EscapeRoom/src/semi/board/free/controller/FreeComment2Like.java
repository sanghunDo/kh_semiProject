package semi.board.free.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.board.free.model.dao.FreeBoardDao;

/**
 * Servlet implementation class FreeComment2Like
 */
@WebServlet("/board/free/freeBoardComment2Like.do")
public class FreeComment2Like extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeComment2Like() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int commentNo =Integer.parseInt(request.getParameter("commentNo"));
		int commentLikeAmount =Integer.parseInt(request.getParameter("commentLikeAmount"));
		//String flag = request.getParameter("flag");
		System.out.println("commentNo"+commentNo);
		System.out.println("commentLikeAmount"+commentLikeAmount);
		int result = new FreeBoardDao().updateLikey(commentNo,commentLikeAmount);
		int likey = new FreeBoardDao().getLikey(commentNo);
		System.out.println("likey=대체뭐야..?"+likey);
		
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
