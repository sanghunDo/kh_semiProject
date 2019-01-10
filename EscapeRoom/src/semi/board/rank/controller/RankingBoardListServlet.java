package semi.board.rank.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
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
		
		int best1;
		try {
			best1 = Integer.parseInt(request.getParameter("best1"));
		} catch(NumberFormatException e) {
			best1 = 1;
		}
		
		int best10;
		try {
			best10 = Integer.parseInt(request.getParameter("best10"));
		} catch(NumberFormatException e) {
			best10 = 10;
		}
		
		List<Rank> list = new RankService().selectRankList(best1, best10);
		List<Rank> finalList = new ArrayList<>();
		ArrayList<Long> RuntimeSort = new ArrayList<>();
		
		for(Rank r : list) {
			int runtime = (int)r.getGameruntime();
			
			int hours = (runtime / 60 / 60) % 24;
			int minutes = (runtime / 60) % 60;
			int seconds = runtime % 60;
			
			String endRuntime = hours + "시간 " + minutes + "분 " + seconds + "초";
			
			RuntimeSort.add(r.getGameruntime());
			Collections.sort(RuntimeSort);
			
			Rank modifiedR = new Rank(r.getPlayno(), r.getGameId(), r.getUserprofilerenamedfile(),
									r.getGameruntime(), r.getGameescapedate(), endRuntime);
			
			finalList.add(modifiedR);
		}
		
		
		request.setAttribute("list", finalList);
		request.setAttribute("best1", best1);
		request.setAttribute("best10", best10);
		
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
