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
import semi.game.model.vo.MainObj;

/**
 * Servlet implementation class GameSetObjectServlet
 */
@WebServlet({"/game/setObject", "/game/getObject"})
public class GameSetObjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<MainObj> objList = new GameService().getObjList();
		
/*		request.setAttribute("objList", objList);
		request.getRequestDispatcher("/WEB-INF/views/game/gameObject_xml.jsp").forward(request, response);*/
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(objList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
