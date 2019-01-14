package semi.board.solve.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.board.solve.model.vo.BoardComment;
import semi.board.free.model.dao.FreeBoardDao;
import semi.board.solve.model.dao.SolveBoardDao;

/**
 * Servlet implementation class solvePostLikey
 */
@WebServlet("/board/solve/solveBoardLike.do")
public class solvePostLikey extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public solvePostLikey() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("에이젝스실행됨");
		int postNo =Integer.parseInt(request.getParameter("postNo"));
		String userId = request.getParameter("userId");
		Cookie[] cookies = request.getCookies();
		String postCookieVal = "";
		boolean hasPostLike = false;
		
		if(cookies != null) {
			for(Cookie c:cookies) {
				String name = c.getName();
				String value = c.getValue();

				if("SolvePostlikeCookie".equals(name)) {
					postCookieVal = value;
					if(value.contains("|"+ postNo+userId+"|")) {
						hasPostLike = true;
						break;
					}
				}
			}
		}
		
		int likey = 0;
		if(!hasPostLike) {
			int result = new SolveBoardDao().updateBoardLikey(postNo);
    		likey = new SolveBoardDao().getPostLikey(postNo);
	
			Cookie postCookie = new Cookie("SolvePostlikeCookie", postCookieVal + "|"+postNo + userId + "|");
			response.addCookie(postCookie); 
			
			
		}else {
			response.setContentType("text/html; charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('이미 참여하셨습니다');</script>");    		
            out.flush();
    		likey = new SolveBoardDao().getPostLikey(postNo);

            // jsp에 전달하기 위해 속성으로 전	
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
