package semi.home.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.rank.model.vo.Rank;
import semi.home.model.service.HomeService;

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
		
		//공략게시판 인기게시물 top3
		
		String view = "/WEB-INF/views/home.jsp";
		
		request.setAttribute("rankTop", modifiedR);
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
