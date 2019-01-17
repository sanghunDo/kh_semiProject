package semi.adminMode.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.adminMode.model.service.AdminModeService;
import semi.adminMode.model.vo.Admin;

/**
 * Servlet implementation class AdminWarnServlet
 */
@WebServlet("/adminMode/adminWarn")
public class AdminWarnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminWarnServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		
		int result = new AdminModeService().updateAdminVote(userId);
		
		String msg = "";
		String loc = "/adminMode/adminMain";
		
		if(result > 0) {
			Admin a = new AdminModeService().selectOneAdmin(userId);
			if(a.getAdminVote() == 5) {
				result = new AdminModeService().deleteAdmin(userId);
				if(result > 0) msg = "해당 관리자는 경고가 5회 누적되어 관리자 자격이 박탈됩니다.";
				else msg = "경고처리 완료 : 자격 박탈 실패";
			}
			
			else msg = "해당 관리자에 대한 경고처리가 완료되었습니다.";
		}
		
		else msg = "경고처리 실패";
		
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
