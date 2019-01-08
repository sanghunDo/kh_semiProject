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
 * Servlet implementation class FreeBoardComment2Insert
 */
@WebServlet("/board/free/freeBoardComment2.do")
public class FreeBoardComment2Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardComment2Insert() {
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

		System.out.println("서블릿 : level2Comment="+level2Comment);
		System.out.println("서블릿 : ref="+ref);
		System.out.println("서블릿 : commentRef="+commentRef);
		System.out.println("서블릿 : commentWriter="+commentWriter);
		System.out.println("서블릿 : commentLevel="+commentLevel);


		
		BoardComment bc = new BoardComment();
		bc.setRef(ref);
		bc.setCommentWriter(commentWriter);
		bc.setCommentLevel(commentLevel);
		bc.setCommentContent(level2Comment);
		bc.setCommentRef(commentRef);
		
		
		int result = new FreeBoardDao().insertComment(bc);
		String comment_date = new FreeBoardDao().getDate(commentRef);
		System.out.println("comment_date:"+comment_date);
		//System.out.println("서블릿 도달"+comment2);
		response.setContentType("application/json; charset=utf-8");
		String data = bc.getCommentWriter()+"/"+
				comment_date+"/"+
				bc.getCommentContent();
		
		new Gson().toJson(data,response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
