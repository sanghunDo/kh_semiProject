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
		
		boolean flag = true;
		
		String title = request.getParameter("title").equals("null")?"":request.getParameter("fileName");
		String content = request.getParameter("content");
		String fileName = request.getParameter("fileName").equals("null")?"":request.getParameter("fileName");
		
		if(flag==true) {
			 // 팝업창을 닫기 위한 코드
            String script = "self.close();";
            // jsp에 전달하기 위해 속성으로 전달
            request.setAttribute("script", script);
		}
		
		String view = "/WEB-INF/views/board/free/tempoaryForm.jsp";
		request.setAttribute("title", title);
		request.setAttribute("content", content);
		request.setAttribute("fileName", fileName);
		 
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
