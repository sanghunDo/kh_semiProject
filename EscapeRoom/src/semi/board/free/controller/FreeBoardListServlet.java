package semi.board.free.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.free.model.dao.FreeBoardDao;
import semi.board.free.model.vo.FreeBoard;

/**
 * Servlet implementation class FreeBoardListServlet
 */
@WebServlet("/board/free/freeBoardList")
public class FreeBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage;
		try {
		cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e) {
			cPage = 1;
		}
		
		int numPerPage;
		
		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		} catch(NumberFormatException e) {
			numPerPage = 5;
		}
		
		
		 System.out.printf("[cPage=%s , numPerPage=%s]",cPage, numPerPage);
		//전체컨텐츠수 구하기
		//페이지바 지정
		 
		 List<FreeBoard> list = new FreeBoardDao().boardSelectAll(cPage, numPerPage);
		 /*int totalContent = new BoardService().BoardCount();
		 int totalPage = (int)Math.ceil((double)totalContent/numPerPage);*/
		 request.setAttribute("list", list);
		 request.setAttribute("cPage", cPage);
		 request.setAttribute("numPerPage", numPerPage);
		 request.getRequestDispatcher("/WEB-INF/views/board/free/freeBoardList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
