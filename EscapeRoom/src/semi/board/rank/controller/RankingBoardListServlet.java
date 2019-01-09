package semi.board.rank.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.rank.model.service.RankService;
import semi.board.rank.model.vo.Rank;

/**
 * Servlet implementation class RankingBoardListServlet
 */
@WebServlet("/board/rank/rankingBoardList")
public class RankingBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		System.out.println("game rank servlet");
		String gameId = request.getParameter("gameId");
		System.out.println("아이디 : " + gameId);
		
		RankService rankService = new RankService();
		
		Rank r = rankService.viewOne(gameId);
		System.out.println("확인 : " + r);
		
		List<Rank> list = new RankService().selectRankList();
		
		request.setAttribute("rank", r);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/views/board/rank/RankingBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
