package semi.game.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.game.model.service.GameService;

/**
 * Servlet implementation class GameGetHintServlet
 */
@WebServlet("/game/getHint")
public class GameGetHintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = (int)(Math.random()*10)+1;
		String hint = new GameService().getHint(num);
		response.setContentType("application/json; charset=utf-8"); 
		new Gson().toJson(hint, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
