package semi.board.rank.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.rank.model.service.RankCommentService;
import semi.board.rank.model.vo.RankComment;

/**
 * Servlet implementation class RankCommentInsertServlet
 */
@WebServlet("/board/rank/RankBoardCommentInsert")
public class RankCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int rankCommentLevel = Integer.parseInt(request.getParameter("rankCommentLevel"));
		String rankCommentWriter = request.getParameter("rankCommentWriter");
		String rankCommentContent = request.getParameter("rankCommentContent");
		int rankCommentRef = Integer.parseInt(request.getParameter("rankCommentRef"));
		
		RankComment rc = new RankComment();
		rc.setCommentLevel(rankCommentLevel);
		rc.setCommentWriter(rankCommentWriter);
		rc.setCommentContent(rankCommentContent);
		rc.setCommentRef(rankCommentRef);
		
		int result = 0;
		result = new RankCommentService().insertRankComment(rc);
		
		String msg = "";
		String loc = "/";
		
		request.getRequestDispatcher("/WEB-INF/views/board/rank/RankCommentInsert.jsp");
		
		if(result > 0) {
			msg = "댓글을 등록하였습니다.";
			loc = "/board/rank/rankingBoardList";
		}
		else {
			msg = "댓글 등록에 실패했습니다.";
		}
		
		System.out.println("댓글 등록한 유저 : " + rankCommentWriter);
		
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
