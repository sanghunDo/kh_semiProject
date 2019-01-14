package semi.board.free.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.free.model.dao.FreeBoardDao;

/**
 * Servlet implementation class PostReportEnd
 */
@WebServlet(name = "postReportEnd", urlPatterns = { "/board/free/freeBoardPostReportEnd" })
public class FreeBoardPostReportEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardPostReportEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String postTitle = request.getParameter("postTitle");
		String postWriter = request.getParameter("postWriter");
		String[] reason = request.getParameterValues("reason");
		String userComment = request.getParameter("userComment");

		
		String reasonVal = "";
		for(int i=0; i < reason.length; i++){
			reasonVal += reason[i] +"/";
		}

		System.out.println(reasonVal);
		int result = new FreeBoardDao().reportPost(postNo);
		int Insertreport = new FreeBoardDao().insertReportPost(postNo,postTitle,postWriter,reasonVal,userComment);		
		
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "";
		


        if(result > 0 && Insertreport>0) {
            msg = "신고접수를 완료하였습니다.";
            // 팝업창을 닫기 위한 코드
            String script = "self.close();";
            // jsp에 전달하기 위해 속성으로 전달
            request.setAttribute("script", script);
         }else {
        	 msg="신고실패";
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
