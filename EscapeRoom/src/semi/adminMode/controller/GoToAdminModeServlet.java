package semi.adminMode.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.adminMode.model.service.AdminModeService;
import semi.adminMode.model.vo.Report_Board;
import semi.adminMode.model.vo.Report_Comment;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class GoToAdminModeServlet
 */
@WebServlet("/adminMode/adminMain")
public class GoToAdminModeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoToAdminModeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Report_Board> rbList = new AdminModeService().selectAllReportBoard();
		List<Report_Comment> rcList = new AdminModeService().selectAllReportComment();
		List<Member> memberList = new AdminModeService().selectAllMember();
		
		System.out.println(rbList);
		System.out.println(rcList);
		
		request.setAttribute("memberList", memberList);
		request.setAttribute("rbList", rbList);
		request.setAttribute("rcList", rcList);
		request.getRequestDispatcher("/WEB-INF/views/adminMode/adminMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
