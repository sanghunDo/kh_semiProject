package semi.board.rank.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.rank.model.service.RankCommentService;

/**
 * Servlet implementation class RankCommentLikeServlet
 */
@WebServlet("/board/rank/rankCommentLike")
public class RankCommentLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int rankCommentNo = Integer.parseInt(request.getParameter("rankCommentNo"));
		int rankCommentLike = new RankCommentService().getCommentLike(rankCommentNo);
		
		int result = 0;
		result = new RankCommentService().updateCommentLike(rankCommentNo, rankCommentLike);
		
		String msg = "";
		String loc = "/board/rank/rankingBoardList";
		
		if(result > 0) {
			msg = "해당 댓글을 추천하였습니다.";
		}
		else {
			msg = "해당 댓글 추천에 실패하였습니다.";
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
