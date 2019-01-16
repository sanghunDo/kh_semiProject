package semi.adminMode.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.adminMode.model.service.AdminModeService;
import semi.adminMode.model.vo.Admin;
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
		
		List<Admin> adminList = new AdminModeService().selectAllAdmin();
		List<Report_Board> rbList = new AdminModeService().selectAllReportBoard();
		List<Report_Comment> rcList = new AdminModeService().selectAllReportComment();
		List<Member> memberList = new AdminModeService().selectAllMember();

		String temp = " ";
		String[] tempArr = null;
		
		for(int i=0; i<rbList.size(); i++) {
			tempArr = rbList.get(i).getReason().split("/");
			for(int j=0; j<tempArr.length; j++) {
				if("reason1".equals(tempArr[j])) temp += "욕설 ";
				else if ("reason2".equals(tempArr[j])) temp += "음란 ";
				else if ("reason3".equals(tempArr[j])) temp += "광고 ";
				else if ("reason4".equals(tempArr[j])) temp += "기타 ";
			}
			rbList.get(i).setReasonChecked(temp);
			temp = " ";
			tempArr = null;
		}
		
		for(int i=0; i<rcList.size(); i++) {
			tempArr = rcList.get(i).getReason().split("/");
			for(int j=0; j<tempArr.length; j++) {
				if("reason1".equals(tempArr[j])) temp += "욕설 ";
				else if ("reason2".equals(tempArr[j])) temp += "음란 ";
				else if ("reason3".equals(tempArr[j])) temp += "광고 ";
				else if ("reason4".equals(tempArr[j])) temp += "기타 ";
			}
			rcList.get(i).setReasonChecked(temp);
			temp = " ";
			tempArr = null;
		}
		
		request.setAttribute("adminList", adminList);
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
