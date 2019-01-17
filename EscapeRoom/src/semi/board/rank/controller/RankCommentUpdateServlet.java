package semi.board.rank.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.rank.model.service.RankCommentService;

/**
 * Servlet implementation class RankCommentUpdateServlet
 */
@WebServlet("/board/rank/RankBoardCommentUpdate")
public class RankCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
//		int rankCommentNo = Integer.parseInt(request.getParameter("rankCommentNo"));
		
		int rankCommentNo = Integer.parseInt(request.getParameter("rankCommentNo"));
		String updateComment = request.getParameter("rankCommentUpdateContent");
		
		
		String getUpdateComment = new RankCommentService().getUpdateComment(rankCommentNo);		
		int result = new RankCommentService().rankCommentUpdate(rankCommentNo, updateComment);
		
		String msg = "";
		String loc = "/board/rank/rankingBoardList";
		
		if(result > 0) {
			msg = "댓글 수정을 완료하였습니다.";
		}
		else {
			msg = "댓글 수정에 실패했습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
