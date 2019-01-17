package semi.adminMode.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.adminMode.model.service.AdminModeService;

/**
 * Servlet implementation class AdminGrantServlet
 */
<<<<<<< HEAD:EscapeRoom/src/semi/admin/controller/DeleteProfileServlet.java
@WebServlet("/DeleteProfileServlet")
public class DeleteProfileServlet extends HttpServlet {
=======
@WebServlet("/adminMode/adminGrant")
public class AdminGrantServlet extends HttpServlet {
>>>>>>> 5e3f13b15fb5ae260a0c09149c7d388859cffa8f:EscapeRoom/src/semi/adminMode/controller/AdminGrantServlet.java
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminGrantServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		
		int result = new AdminModeService().insertAdminList(userId);
		
		String msg = "";
		String loc = "/adminMode/adminMain";
		
		if(result > 0) msg = "해당 회원이 관리자로 등록되었습니다.";
		else msg = "관리자 등록 실패";
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
