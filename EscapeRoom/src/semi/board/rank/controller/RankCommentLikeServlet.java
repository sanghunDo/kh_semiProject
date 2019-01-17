package semi.board.rank.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.rank.model.service.RankCommentService;

/**
 * Servlet implementation class RankCommentLikeServlet
 */
@WebServlet("/board/rank/rankCommentLike")
public class RankCommentLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int rankCommentNo = Integer.parseInt(request.getParameter("rankCommentNo"));
		String rankCommentWriter = request.getParameter("rankCommentWriter");
		
//		Cookie[] cookies = request.getCookies();
//		String postCookieVal = "";
//		boolean hasLike = false;
//		
//		if(cookies != null) {
//			for(Cookie c : cookies) {
//				String name = c.getName();
//				String value = c.getValue();
//				
//				if("likeCookie".equals(name)) {
//					postCookieVal = value;
//					
//					if(value.contains("|" + rankCommentNo + rankCommentWriter + "|")) {
//						hasLike = true;
//						break;
//					}
//				}
//			}
//		}
		
		int rankCommentLike = new RankCommentService().getCommentLike(rankCommentNo);
		
		int result = 0;
		result = new RankCommentService().updateCommentLike(rankCommentNo);
		
//		int likey = 0;
//		int result = 0;
//		
//		if(!hasLike) {
//			result = new RankCommentService().updateCommentLike(rankCommentNo);
//			likey = new RankCommentService().getCommentLike(rankCommentNo);
//			
//			Cookie postCookie = new Cookie("likeCookie", postCookieVal + "|" + rankCommentNo + rankCommentWriter + "|");
//			response.addCookie(postCookie);
//		}
//		else {
//			response.setContentType("text/html; charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>alert('이미 참여하셨습니다.');</script>");
//			out.flush();
//			likey = new RankCommentService().getCommentLike(rankCommentNo);
//		}
		
		String msg = "";
		String loc = "/board/rank/rankingBoardList";
		
		if(result > 0) {
			msg = "해당 댓글을 추천하였습니다.";
		}
		else {
			msg = "해당 댓글 추천에 실패하였습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
