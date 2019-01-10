package semi.board.free.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.free.model.dao.FreeBoardDao;
import semi.board.free.model.vo.BoardComment;
import semi.board.free.model.vo.FreeBoard;

/**
 * Servlet implementation class FreeBoardListView
 */
@WebServlet("/board/free/freeBoardView")
public class FreeBoardListView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardListView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String memberId = request.getParameter("loggedInMember");
		FreeBoard fb = new FreeBoardDao().selectByPostNo(postNo);
	
		//댓글
		List<BoardComment> commentList = new FreeBoardDao().selectAllComment(postNo);
		List<BoardComment> bestCommentList = new FreeBoardDao().selectBestComment(postNo);
		
		System.out.println("postNo"+postNo);
		String view = "/WEB-INF/views/common/msg.jsp";
		if(fb == null) {
			view ="/WEB-INF/views/common/msg.jsp";
			request.setAttribute("msg", "상세조회실패");
			request.setAttribute("loc", "/board/boardList");
		} else {
			view = "/WEB-INF/views/board/free/freeBoardView.jsp";
			request.setAttribute("fb", fb);
			request.setAttribute("commentList", commentList);
			request.setAttribute("bestCommentList", bestCommentList);
		
		}
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
