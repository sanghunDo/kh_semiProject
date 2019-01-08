package semi.board.free.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.board.free.model.dao.FreeBoardDao;
import semi.board.free.model.vo.BoardComment;


/**
 * Servlet implementation class FreeBoardComment1Like
 */
@WebServlet("/board/free/freeBoardComment1Like.do")
public class FreeBoardComment1Like extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardComment1Like() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int commentNo =Integer.parseInt(request.getParameter("commentNo"));
		int comment1Like =Integer.parseInt(request.getParameter("commentLikey"));
		//String flag = request.getParameter("flag");
		
		int result = new FreeBoardDao().updateLikey(commentNo,comment1Like);
		int likey = new FreeBoardDao().getLikey(commentNo);
		System.out.println("result"+result);
		
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
