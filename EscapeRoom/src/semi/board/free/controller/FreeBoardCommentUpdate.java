package semi.board.free.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.board.free.model.dao.FreeBoardDao;
import semi.board.free.model.vo.BoardComment;

/**
 * Servlet implementation class FreeBoardCommentUpdate
 */
@WebServlet("/board/free/freeBoardCommentUpdate.do")
public class FreeBoardCommentUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardCommentUpdate() {
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
	
	
		int result = new FreeBoardDao().commentUpdate(commentNo,commentUpdate);
		String getUpdateComment = new FreeBoardDao().getUpdateComment(commentNo);

		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(getUpdateComment,response.getWriter());
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
