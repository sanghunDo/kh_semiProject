package semi.board.free.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.free.model.dao.FreeBoardDao;
import semi.board.free.model.vo.FreeBoard;

/**
 * Servlet implementation class FreeBoardListServlet
 */
@WebServlet("/board/free/freeBoardList")
public class FreeBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage;
		try {
		cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e) {
			cPage = 1;
		}
		
		int numPerPage;
		
		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		} catch(NumberFormatException e) {
			numPerPage = 10;
		}
		 List<FreeBoard> list = new FreeBoardDao().boardSelectAll(cPage, numPerPage);
		 List<FreeBoard> bestList = new FreeBoardDao().boardSelectBest3();
		 System.out.printf("[cPage=%s , numPerPage=%s]",cPage, numPerPage);
		//전체컨텐츠수 구하기
		 int totalContent = new FreeBoardDao().BoardCount();
		 int totalPage = (int)Math.ceil((double)totalContent/numPerPage);
		//페이지바 지정
		 String pageBar = "";
		 int pageBarSize = 5;
		 int startPage = ((cPage-1)/pageBarSize)*pageBarSize +1 ;
		 int endPage = startPage + pageBarSize - 1;
		 
		 int pageNo = startPage;
		 
		   if(pageNo == 1) {
		    	  
		      }else {
		    	  pageBar += "<a href='"+request.getContextPath()+"/board/boardList?cPage="
		    			  	+(pageNo-1)+"&numPerPage="
		    			  	+numPerPage+"'>[이전]</a>";
		    	  
		      }
		      
		      //[페이지]section
		      while(pageNo <= endPage && pageNo <= totalPage) { //페이지증감변수가 페이지바끝보다 같거나 작을때 && 페이지증감변수가 천체페이지보다 같거나 작을때 
		    	  if(cPage == pageNo) {
		    		  //현재페이지는 클릭할 필요가 없다 //다른페이지는 클리되어야함(else절)
		    		  pageBar += "<span class='cPage'>"+pageNo+"</span>";
		    		  
		    	  }else {
		    		  pageBar += "<a href='"+request.getContextPath()+"/board/boardList?cPage="
		      			  			+pageNo+"&numPerPage="
		      			  			+numPerPage+"'>"+pageNo+"</a>";
		    	  }
		    	  pageNo++;
		    	  
		      }
		      
		      //[다음]section
		      if(pageNo > totalPage) { //증감변수가 전체페이지보다 클때 
		    	  //113이 끝 빠져나올때 (pageNo <= endPage && pageNo <= totalPage여기서) 114때 나오게 된다.여기가 바로 114다
		    	  
		      }else {
		    	  pageBar += "<a href='"+request.getContextPath()+"/board/boardList?cPage="
				  			+pageNo+"&numPerPage="
				  			+numPerPage+"'>[다음]</a>";
		      }
		      
		      
		
		 request.setAttribute("list", list);
		 request.setAttribute("bestList", bestList);

		 request.setAttribute("pageBar", pageBar);
		 request.setAttribute("cPage", cPage);
		 request.setAttribute("numPerPage", numPerPage);
		 request.getRequestDispatcher("/WEB-INF/views/board/free/freeBoardList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
