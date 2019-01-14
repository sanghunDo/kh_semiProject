package semi.board.solve.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.adminMode.model.service.AdminModeService;
import semi.board.solve.model.dao.SolveBoardDao;
import semi.board.solve.model.vo.SolveBoard;

/**
 * Servlet implementation class PostReportEnd
 */
@WebServlet("/board/solve/solveBoardPostReportEnd")
public class PostReportEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostReportEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		
		String reason = request.getParameter("reason");
		System.out.println(reason);
		
		String userComment = request.getParameter("userComment");
		
		int result = new SolveBoardDao().reportPost(postNo);		
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "";
		
		SolveBoard sb = new SolveBoardDao().selectByNo(postNo);
		
		int insertReport = new AdminModeService().insertSolvePostReport(sb, reason, userComment);

        if(result > 0 && insertReport > 0) {
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
