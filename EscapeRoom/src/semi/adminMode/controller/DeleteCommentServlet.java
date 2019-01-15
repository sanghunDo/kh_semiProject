package semi.adminMode.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.adminMode.model.service.AdminModeService;

/**
 * Servlet implementation class DeleteCommentServlet
 */
@WebServlet("/adminMode/deleteComment")
public class DeleteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		
		int result = 0;
		
		if("F".equals(category)) result = new AdminModeService().changeFreeCommentReported(commentNo);
		else if("S".equals(category)) result = new AdminModeService().changeSolveCommentReported(commentNo);
		else if("R".equals(category)) result = new AdminModeService().changeRankCommentReported(commentNo);
		
		String msg = "";
		String loc = "/adminMode/adminMain";
		
		if(result > 0) {
			result = new AdminModeService().deleteReportComment(category, commentNo);
			if(result > 0) msg = "삭제처리가 완료되었습니다.";
			else msg = "삭제처리성공, 신고처리 실패";
		}
		
		else msg = "삭제 처리 실패";
		
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
