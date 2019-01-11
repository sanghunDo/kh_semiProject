package semi.board.solve.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.solve.model.vo.BoardComment;
import semi.board.solve.model.vo.SolveBoard;
import semi.board.solve.model.dao.SolveBoardDao;

/**
 * Servlet implementation class solveBoardSearch
 */
@WebServlet("/board/solve/solveBoardSearch")
public class solveBoardSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public solveBoardSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String searchType = request.getParameter("searchType");
		String searchVal = request.getParameter("searchVal");

		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			  cPage = 1; 
		}
		int numPerPage;
		try {
		       numPerPage= Integer.parseInt(request.getParameter("numPerPage"));
		      }catch(NumberFormatException e) {
		    	  numPerPage = 5; 
		      }
		List<SolveBoard> list = null;
		List<SolveBoard> bestList = new SolveBoardDao().boardSelectBest3();
//		리스트 구하기 		
		switch(searchType) {
		case "title" : list = new SolveBoardDao().searchByTitle(searchVal, cPage, numPerPage);
		break;
		case "content" : list = new SolveBoardDao().searchByContent(searchVal, cPage, numPerPage);
		break;
		case "id" : list = new SolveBoardDao().searchById(searchVal, cPage, numPerPage);
		break;
		}
		
		
		int totalContent =0;
		int totalPage;
		String pageBar = "";
		
//		총 컨텐츠 수 구하기 
		switch(searchType) {
		case "title" : totalContent = new SolveBoardDao().searchByTitleCount(searchVal);
		break;
		case "content" : totalContent = new SolveBoardDao().searchByContentCount(searchVal);
		break;
		case "id" : totalContent = new SolveBoardDao().searchByIdCount(searchVal);
		break;
		}
		
		totalPage = (int)Math.ceil((double)totalContent/numPerPage) ;
		int pageBarSize = 5;
		int startPage = ((cPage-1)/pageBarSize) * pageBarSize + 1;
		int endPage =  startPage + pageBarSize - 1;
		
		int pageNo = startPage;
		
				//[이전]section
				if(pageNo == 1) {
					
				}else {
					pageBar += "<a href='"+request.getContextPath()+
							"/board/solve/solveBoardFinder?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"&searchType="+searchType+"&searchVal="+searchVal+"'>[이전]</a>";
				}
				//[페이지]section
				while(pageNo <= endPage && pageNo <= totalPage) {
					if(cPage == pageNo) {
						//현재페이지는 클릭할 필요가 없다 //다른페이지는 클리되어야함(else절)
						pageBar += "<span class='cPage'>"+pageNo+"</span>";
						
					}else {
						pageBar += "<a href='"+request.getContextPath()+
								"/board/solve/solveBoardFinder?cPage="+pageNo+"&numPerPage="+numPerPage+"&searchType="+searchType+"&searchVal="+searchVal+"'>"+pageNo+"</a>";
					}
					pageNo++;

				}
				//[다음]section
				
				if(pageNo > totalPage) {
					//113이 끝 빠져나올때 (pageNo <= endPage && pageNo <= totalPage여기서) 114때 나오게 된다.여기가 바로 114다
					
				}else {
					pageBar += "<a href='"+request.getContextPath()+
							"/board/solve/solveBoardFinder?cPage="+pageNo+"&numPerPage="+numPerPage+"&searchType="+searchType+"&searchVal="+searchVal+"'>[다음]</a>";
				}
				
				request.setAttribute("list", list);
				request.setAttribute("bestList", bestList);
				request.setAttribute("searchVal",searchVal );
				request.setAttribute("searchType",searchType );
			    request.setAttribute("pageBar", pageBar);
			    request.setAttribute("cPage", cPage);
			    request.setAttribute("numPerPage", numPerPage);
				request.getRequestDispatcher("/WEB-INF/views/board/solve/solveBoardFinder.jsp").forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
