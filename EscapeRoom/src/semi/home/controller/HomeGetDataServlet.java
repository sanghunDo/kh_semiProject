package semi.home.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.free.model.dao.FreeBoardDao;
import semi.board.free.model.vo.FreeBoard;
import semi.board.rank.model.vo.Rank;
import semi.board.solve.model.dao.SolveBoardDao;
import semi.board.solve.model.vo.SolveBoard;
import semi.home.model.service.HomeService;
import semi.notice.model.vo.Notice;

/**
 * Servlet implementation class HomeGetDataServlet
 */
@WebServlet("/home")
public class HomeGetDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeGetDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//공지사항 링크
		Notice n = null;

		try {
			n = new HomeService().selectLinkedNotice();
			
		} catch(NullPointerException e) {
			n = new Notice();
		}
		
		//랭킹 1위 정보
		Rank r = new HomeService().selectRankTop();

		int runtime = (int) r.getGameruntime() / 1000;
        
        int hours = runtime / 3600;
        int minutes = (runtime % 3600) / 60;
        int seconds = runtime % 60;
        
        String endRuntime = "";
        
        if(hours >= 1) {
           endRuntime += hours + "시간 " + minutes + "분 " + seconds + "초";
        }
        else if(hours < 1 && minutes >= 1) {
           endRuntime += minutes + "분" + seconds + "초";
        }
        else if(hours < 1 && minutes < 1) {
           endRuntime += seconds + "초";
        }
        
        Rank modifiedR = new Rank(r.getGameId(), r.getGameruntime(), r.getUserprofilerenamedfile(), r.getGameescapedate(), endRuntime);
		
		//자유게시판 인기게시물 top3
		List<FreeBoard> list_free = new FreeBoardDao().boardSelectBest3();
		System.out.println("자유 : " + list_free);
		
		//공략게시판 인기게시물 top3
		List<SolveBoard> list_solve = new SolveBoardDao().boardSelectBest3();
		System.out.println("공략 : " + list_solve);
		
		String view = "/WEB-INF/views/home.jsp";
		
		request.setAttribute("linkedNotice", n);
		request.setAttribute("rankTop", modifiedR);
		request.setAttribute("list_free", list_free);
		request.setAttribute("list_solve", list_solve);
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
