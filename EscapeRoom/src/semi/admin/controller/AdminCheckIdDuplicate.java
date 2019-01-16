package semi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import semi.common.MyFileRenamePolicy;
import semi.admin.model.service.AdminService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class AdminCheckIdDuplicate
 */
@WebServlet("/admin/adminCheckIdDuplicate")
public class AdminCheckIdDuplicate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCheckIdDuplicate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자용 회원아이지 중복검사 서블릿
		// 회원정보 가져와서 request로 전송하기
		// 0. 관리자로 로그인되었는지 확인하기
		// 관리자가 아니거나 로그인상태가 아니면 사이트 접근 금지0
		Member loggedInMember = (Member)request.getSession().getAttribute("loggedInMember");
			if(loggedInMember != null && !"admin".equals(loggedInMember.getUserId())) {
					request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
			        request.setAttribute("loc", "/home");
			        request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			        return;
			  }
		
		// 1. 파라미터 핸들링
		String userId = request.getParameter("userId");
		System.out.println("userId@adminCheckIdDuplicateServlet = " + userId);
		
		// 2. 비즈니스 로직
		Member m = new AdminService().selectOne(userId);
		
		// 사용 가능 여부를 isUsable변수에 담기
		boolean isUsable = m == null?true:false;

		// 3. view단 처리
		// adminCheckIdDuplicate.jsp에서 사용할 데이터를 request로 전송
		String view = "/WEB-INF/views/admin/adminCheckIdDuplicate.jsp";
		request.setAttribute("isUsable", isUsable);
		request.setAttribute("userId", userId);
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
