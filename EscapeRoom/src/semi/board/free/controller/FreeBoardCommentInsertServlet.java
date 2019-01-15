package semi.board.free.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.free.model.dao.FreeBoardDao;
import semi.board.free.model.vo.BoardComment;

/**
 * Servlet implementation class FreeBoardCommentInsertServlet
 */
@WebServlet("/board/free/FreeBoardCommentInsert")
public class FreeBoardCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ref = Integer.parseInt(request.getParameter("ref"));
		String commentWriter = request.getParameter("userId");
		int commentLevel = Integer.parseInt(request.getParameter("commentLevel"));
		String commentContent = request.getParameter("boardCommentContent");
		int commentRef = Integer.parseInt(request.getParameter("commentRef"));

        
        BoardComment bc = new BoardComment();
        bc.setRef(ref);
        bc.setCommentWriter(commentWriter);
        bc.setCommentLevel(commentLevel);
        bc.setCommentContent(commentContent);
        bc.setCommentRef(commentRef);
        
		int result = new FreeBoardDao().insertComment(bc);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/";

		if(result>0) {
			msg = "성공적으로 댓글 등록했습니다.";
			loc ="/board/free/freeBoardView?postNo="+ref;

		}else {
			msg = "댓글 등록에 실패했습니다.";	
			loc ="/board/free/freeBoardView?postNo="+ref;
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
