package semi.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.free.model.vo.FreeBoard;
import semi.board.solve.model.vo.SolveBoard;
import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;
import semi.notice.model.vo.Notice;

/**
 * Servlet implementation class AllBoardViewServlet
 */
@WebServlet("/member/allBoardView")
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
	      // 작성한 게시글 보는 서블릿
		  String userId = (String) request.getSession().getAttribute("userId");
		  System.out.println("allboardviewservlet"+userId);
		  int noticeNo = (int)Integer.parseInt(request.getParameter("noticeNo"));
		  System.out.println("allboradviewservlet"+noticeNo);
		  
	      // 2. 비즈니스 로직
	      List<FreeBoard> freeList = new MemberService().selectFreeBoard(userId);
	      List<SolveBoard> solveList = new MemberService().selectSolveBoard(userId);
	      List<Notice> noticeList = new MemberService().selectNoticeBoard(noticeNo);
	      
	      // 3. view단 처리
		  // 로그인된 상태인지 확인
		  // 로그인 상태가 아니면 로그인 페이지로 이동하기
		  Member loggedInMember = (Member)request.getSession().getAttribute("loggedInMember");
		  if(loggedInMember == null) {
		         request.setAttribute("msg", "로그인을 해주세요.");
		         request.setAttribute("loc", "/member/login");
		         request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		  }
		  
	      // request 객체에 속성 등록
	      request.setAttribute("freeList", freeList);
	      request.setAttribute("solveList", solveList);
	      request.setAttribute("noticeList", noticeList);
	      request.getRequestDispatcher("/WEB-INF/views/member/allBoardView.jsp").forward(request, response);
	      
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
