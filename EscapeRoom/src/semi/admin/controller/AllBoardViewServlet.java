package semi.admin.controller;

import java.util.List;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.admin.model.service.AdminService;
import semi.member.model.vo.Member;
import semi.admin.model.vo.*;

import semi.notice.model.vo.*;
import semi.board.free.model.vo.*;
import semi.board.solve.model.vo.*;

/**
 * Servlet implementation class AllBoardViewServlet
 */
@WebServlet("/admin/allBoardView")
public class AllBoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllBoardViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      // 관리자용 회원작성 전체게시글 보는 서블릿
	      // 회원정보 & 신고된 게시글 & 신고된 댓글 가져와서 request로 전송하기
	      // 0. 관리자로 로그인되었는지 확인하기
		  // 관리자가 아니거나 로그인상태가 아니면 사이트 접근 금지
		  Member loggedInMember = (Member)request.getSession().getAttribute("loggedInMember");
	      if(loggedInMember == null || !"admin".equals(loggedInMember.getUserId())) {
	         request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
	         request.setAttribute("loc", "/home");
	         request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	         return;
	      }
	      
	      // 2. 비즈니스 로직
	      List<FreeBoard> freeList = new AdminService().selectFreeBoard();
	      List<SolveBoard> solveList = new AdminService().selectSolveBoard();
	
	      // 3. view단 처리
	      // request 객체에 속성 등록
	      request.setAttribute("reportList", freeList);
	      request.setAttribute("reportCmtList", solveList);
	      request.getRequestDispatcher("/WEB-INF/views/admin/allBoardView.jsp").forward(request, response);
	      
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
