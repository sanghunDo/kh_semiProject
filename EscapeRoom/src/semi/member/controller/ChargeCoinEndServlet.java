package semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class ChargeCoinEndServlet
 */
@WebServlet("/member/chargeCoinEnd")
public class ChargeCoinEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChargeCoinEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		System.out.println("유저아이디(userId)@ChargeCoinEndServlet = " + userId);
		String imp_uid = request.getParameter("imp_uid");
		System.out.println("imp_uid = " + imp_uid);

		
		int coin = (int)Integer.parseInt(request.getParameter("coin"));
		System.out.println("코인(코인)@ChargeCoinEndServlet = " + coin);
		
		Member m = new Member();
		m.setUserId(userId);
		m.setCoin(coin);
		System.out.println();
		
		int result = new MemberService().chargeCoin(m);
		
		String msg = "";
		String loc = "";
		String view = "/WEB-INF/views/common/msg.jsp";
		
		if(result > 0) {
			msg = "코인이 충전되었습니다.";
			String script = "self.close();";
			request.setAttribute("script", script);
		}
		else {
			msg = "코인 충전을 실패했습니다.";
			loc = "/member/chargeCoin?userId=" + userId ;
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher(view).forward(request, response);
		
		System.out.println();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
