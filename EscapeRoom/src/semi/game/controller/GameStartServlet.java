package semi.game.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.game.model.service.GameService;

/**
 * Servlet implementation class GameStartServlet
 */
@WebServlet("/game/gameStart")
public class GameStartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		if("guest".equals(userId)) {
			userId += "_"+(int)(Math.random()*1000)+1;
		}
		//game_state테이블에 아이디가 있는지 확인하기.
		new GameService().checkLog(userId);
		
		request.setAttribute("userId", userId);
		request.getRequestDispatcher("/WEB-INF/views/game/gamePrologue.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
