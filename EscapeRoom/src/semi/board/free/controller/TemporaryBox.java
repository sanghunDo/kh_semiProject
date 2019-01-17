package semi.board.free.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.free.model.dao.FreeBoardDao;
import semi.board.free.model.vo.TemporaryData;

/**
 * Servlet implementation class TemporaryBox
 */
@WebServlet("/board/free/freeBoardTemporaryBox")
public class TemporaryBox extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TemporaryBox() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		   // 팝업창을 닫기 위한 코드
        // jsp에 전달하기 위해 속성으로 전달
		
		String view = "/WEB-INF/views/board/free/temporaryBox.jsp";
		List<TemporaryData> boxList = new FreeBoardDao().selectTemporaryData(userId);
	
		request.setAttribute("boxList", boxList);
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
