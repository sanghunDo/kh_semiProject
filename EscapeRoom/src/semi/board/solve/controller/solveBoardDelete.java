package semi.board.solve.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.solve.model.vo.BoardComment;
import semi.board.solve.model.dao.SolveBoardDao;

/**
 * Servlet implementation class solveBoardDelete
 */
@WebServlet("/board/solve/solveBoardDelete")
public class solveBoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public solveBoardDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String rName = request.getParameter("rName");		
		int result = new SolveBoardDao().deleteBoard(postNo);
				
		if(result>0 && !"".equals(rName)) {
			String saveDirectory = getServletContext().getRealPath("/upload/solveBoard/");
		    File delFile = new File(saveDirectory+rName);
			
			String delDirectory = getServletContext().getRealPath("/deleteFiles/solveBoard/");
			File delFile_ = new File(delDirectory+rName);
			delFile.renameTo(delFile_);
		}
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/board/solve/solveBoardList";
		if(result > 0) {
			msg = "게시글이 성공적으로 삭제되었습니다.";
		}else {
			msg = "게시글 삭제 실패!";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
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
