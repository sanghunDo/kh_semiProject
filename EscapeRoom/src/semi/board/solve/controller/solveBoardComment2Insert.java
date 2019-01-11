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
 * Servlet implementation class solveBoardComment2Insert
 */
@WebServlet("/board/solve/CommentLevel2Insert.do")
public class solveBoardComment2Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public solveBoardComment2Insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String level2Comment = request.getParameter("level2Comment");
		int ref = Integer.parseInt(request.getParameter("ref"));
		int commentRef = Integer.parseInt(request.getParameter("commentRef"));
		String commentWriter = request.getParameter("commentWriter");
		int commentLevel = Integer.parseInt(request.getParameter("commentLevel"));
		
		BoardComment bc = new BoardComment();
		bc.setRef(ref);
		bc.setCommentWriter(commentWriter);
		bc.setCommentLevel(commentLevel);
		bc.setCommentContent(level2Comment);
		bc.setCommentRef(commentRef);
		
		
		int result = new SolveBoardDao().insertComment(bc);
//		List<BoardComment> commentList = new FreeBoardDao().selectAllCommentLevel2(ref,commentRef);
		String comment_date = new SolveBoardDao().getDate(commentRef);
		System.out.println("comment_date:"+comment_date);
		//System.out.println("서블릿 도달"+comment2);
		response.setContentType("application/json; charset=utf-8");
		String data = bc.getCommentWriter()+"/"+
				comment_date+"/"+
				bc.getCommentContent()+"/"+bc.getCommentLike()+"/"+bc.getCommentDislike();
		
		new Gson().toJson(data,response.getWriter());
		
//		new Gson().toJson(commentList,response.getWriter());
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
