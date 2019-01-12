package semi.board.rank.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.rank.model.service.RankCommentService;

/**
 * Servlet implementation class RankCommentDeleteServlet
 */
@WebServlet("/board/rank/RankBoardCommentDelete")
public class RankCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int rankCommentNo = Integer.parseInt(request.getParameter("rankCommentNo"));
		int rankCommentLevel = Integer.parseInt(request.getParameter("rankCommentLevel"));
		
		int result = new RankCommentService().deleteRankComment(rankCommentNo, rankCommentLevel);
		
		String msg = "";
		
		if(result > 0) {
			msg = "댓글을 삭제하였습니다.";
		}
		else {
			msg = "댓글 삭제에 실패하였습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/board/rank/rankingBoardList");
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
