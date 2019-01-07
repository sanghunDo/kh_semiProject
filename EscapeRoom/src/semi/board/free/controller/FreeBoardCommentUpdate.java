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
@WebServlet("/board/free/freeBoardCommentUpdate")
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
		
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		String commentUpdate = request.getParameter("commentUpdate");
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		System.out.println("commentNo"+commentNo);
		System.out.println("commentContent"+commentUpdate);
		System.out.println("postNo"+postNo);
	
		int result = new FreeBoardDao().commentUpdate(commentNo,commentUpdate);
		System.out.println("result="+result);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/board/free/freeBoardView?postNo="+postNo ;
		
		if(result >0 ) {
			msg ="댓글 수정성공";
			
		}else {
			msg = "수정실패";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
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
