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
 * Servlet implementation class GameGetComentServlet
 */
@WebServlet("/game/getComent")
public class GameGetComentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String objName = request.getParameter("objName");
		int rnum = Integer.parseInt(request.getParameter("rnum")); 
		String coment = new GameService().getComent(objName, rnum);
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(coment, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
