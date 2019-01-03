package semi.board.free.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.free.model.dao.FreeBoardDao;

/**
 * Servlet implementation class FreeBoardDeleteServlet
 */
@WebServlet("/board/free/freeBoardDelete")
public class FreeBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String rName = request.getParameter("rName");
		System.out.println("postNo여기가 나와야해"+postNo);
		
		int result = new FreeBoardDao().deleteBoard(postNo);
		
		System.out.println("result나와야해"+result);
		
		if(result>0 && !"".equals(rName)) {
			String saveDirectory = getServletContext().getRealPath("/upload/freeBoard/");
		    File delFile = new File(saveDirectory+rName);
			
			String delDirectory = getServletContext().getRealPath("/deleteFiles/board/");
			File delFile_ = new File(delDirectory+rName);
			delFile.renameTo(delFile_);
		}
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/board/free/freeBoardList";
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
