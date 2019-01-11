package semi.board.solve.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.solve.model.vo.BoardComment;
import semi.board.solve.model.vo.SolveBoard;
import semi.board.solve.model.dao.SolveBoardDao;

/**
 * Servlet implementation class solveBoardView
 */
@WebServlet("/board/solve/solveBoardView")
public class solveBoardView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public solveBoardView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String memberId = request.getParameter("loggedInMember");
		SolveBoard sb = new SolveBoardDao().selectByPostNo(postNo);
	
		//댓글
		List<BoardComment> commentList = new SolveBoardDao().selectAllComment(postNo);
		List<BoardComment> bestCommentList = new SolveBoardDao().selectBestComment(postNo);
		
		Cookie[] cookies = request.getCookies();
		String postCookieVal = "";
		boolean hasRead = false;
		
		if(cookies != null) {
			for(Cookie c:cookies) {
				String name = c.getName();
				String value = c.getValue();

				if("postCookie".equals(name)) {
					postCookieVal = value;
					if(value.contains("|"+postNo+"|")) {
						hasRead = true;
						break;
					}
				}
			}
		}
		
		if(!hasRead) {
			int result = new SolveBoardDao().increaseReadCount(postNo);
			
			Cookie postCookie = new Cookie("postCookie", postCookieVal + "|" + postNo + "|");
			response.addCookie(postCookie); 
		}
		
		
		
		String view = "/WEB-INF/views/common/msg.jsp";
		if(sb == null) {
			view ="/WEB-INF/views/common/msg.jsp";
			request.setAttribute("msg", "상세조회실패");
			request.setAttribute("loc", "/board/solve/solveBoardList");
		} else {
			view = "/WEB-INF/views/board/solve/solveBoardView.jsp";
			request.setAttribute("sb", sb);
			request.setAttribute("commentList", commentList);
			request.setAttribute("bestCommentList", bestCommentList);
		
		}
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
