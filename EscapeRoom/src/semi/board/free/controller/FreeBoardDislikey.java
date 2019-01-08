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
 * Servlet implementation class FreeBoardDislikey
 */
@WebServlet("/board/free/freeBoardDisike.do")
public class FreeBoardDislikey extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardDislikey() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int postNo =Integer.parseInt(request.getParameter("postNo"));
		int boardDislikey =Integer.parseInt(request.getParameter("dislikey"));

//		System.out.println("서블릿"+postNo);
//		System.out.println("좋아요수"+boardLikey);
		
		
		int result = new FreeBoardDao().updateBoardDislikey(postNo,boardDislikey);
		int dislikey = new FreeBoardDao().getPostDislikey(postNo);
//		System.out.println("result_"+result);
//		System.out.println("commentLikey"+commentLikey);
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(dislikey,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
