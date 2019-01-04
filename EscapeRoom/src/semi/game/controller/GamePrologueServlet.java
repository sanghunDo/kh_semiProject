package semi.game.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.game.model.service.GameService;
import semi.game.model.vo.PrologueObj;

/**
 * Servlet implementation class GamePrologueServlet
 */
@WebServlet("/game/prologue")
public class GamePrologueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<PrologueObj> scenario = new GameService().getPrologueScenario();
		int index = Integer.parseInt(request.getParameter("index"));
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(scenario.get(index), response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
