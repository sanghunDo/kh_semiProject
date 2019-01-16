package semi.board.free.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TemporaryForm
 */
@WebServlet("/board/free/freeBoardTemporaryForm")
public class TemporaryForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TemporaryForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int dataNo = Integer.parseInt(request.getParameter("dataNo"));
		String dataTitle = request.getParameter("dataTitle").equals("null")?"":request.getParameter("dataTitle");
		String dataContent = request.getParameter("dataContent").equals("null")?"":request.getParameter("dataContent");
		String file = request.getParameter("file").equals("null")?"":request.getParameter("file");
		System.out.println("dataNo="+dataNo);
		System.out.println("dataTitle="+dataTitle);
		System.out.println("dataContent="+dataContent);
		System.out.println("file="+file);

		String view = "/WEB-INF/views/board/free/tempoaryForm.jsp";
		request.setAttribute("dataNo", dataNo);
		request.setAttribute("title", dataTitle);
		request.setAttribute("content", dataContent);
		request.setAttribute("fileName", file);

         // jsp에 전달하기 위해 속성으로 전달
        
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
