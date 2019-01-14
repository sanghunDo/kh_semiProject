package semi.board.free.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.board.free.model.dao.FreeBoardDao;

/**
 * Servlet implementation class FreeBoardLikey
 */
@WebServlet("/board/free/freeBoardLike.do")
public class FreeBoardLikey extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardLikey() {
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

				if("PostlikeCookie".equals(name)) {
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
			int result = new FreeBoardDao().updateBoardLikey(postNo);
    		likey = new FreeBoardDao().getPostLikey(postNo);
	
			Cookie postCookie = new Cookie("PostlikeCookie", postCookieVal + "|"+postNo + userId + "|");
			response.addCookie(postCookie); 
			
			
		}else {
			response.setContentType("text/html; charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('이미 참여하셨습니다');</script>");    		
            out.flush();
    		likey = new FreeBoardDao().getPostLikey(postNo);

            // jsp에 전달하기 위해 속성으로 전	
		}
		
//		System.out.println("result_"+result);
//		System.out.println("commentLikey"+commentLikey);
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(likey,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
