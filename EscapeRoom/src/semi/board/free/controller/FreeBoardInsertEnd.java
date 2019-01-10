package semi.board.free.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.josephoconnell.html.HTMLInputFilter;
import com.oreilly.servlet.MultipartRequest;

import semi.board.free.model.dao.FreeBoardDao;
import semi.board.free.model.vo.FreeBoard;
import semi.common.MyFileRenamePolicy;

/**
 * Servlet implementation class FreeBoardInsertEnd
 */
@WebServlet("/board/free/freeBoardInsertEnd")
public class FreeBoardInsertEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardInsertEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) { //request객체를 원래 있던 클래스 ServletFileUpload를 통해 검사
			request.setAttribute("msg", "게시판작성오류![form:enctype]");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return; 			
		}
		
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root + "upload"+File.separator+"freeBoard";
		System.out.printf("[saveDirectory = %s]\n", saveDirectory);
		
		int maxPostSize = 1024*1024*10;
		
		MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, maxPostSize, "UTF-8", 
				new MyFileRenamePolicy());
		
		String postTitle = multiReq.getParameter("title"); 
		String postWriter= multiReq.getParameter("writer");
	    String postContent  = multiReq.getParameter("content");
	    postContent = new HTMLInputFilter().filter(postContent);//boardContent전달하고 다시 돌려받음.
		String originalFileName = multiReq.getOriginalFileName("up_file");
		String renamedFileName = multiReq.getFilesystemName("up_file"); // 2018~.jpg

		FreeBoard fb = new FreeBoard();
		
		fb.setPostTitle(postTitle);
		fb.setPostWriter(postWriter);
		fb.setPostContent(postContent);
		fb.setPostOriginalFile(originalFileName);
		fb.setPostRenamedFile(renamedFileName);
		System.out.printf("[%s]\n", fb);
		
		int postNo = new FreeBoardDao().insertPost(fb);
	    System.out.println("(InsertEnd)postNo="+postNo);
	    if(postNo>0) {
	    	 int getlastNo = new FreeBoardDao().getLastSeq();
	 	     System.out.println("(InsertEnd)getlastNo="+getlastNo);
	    }
	
	/*	String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/";
		
		
		if(postNo>0) {
			int getlastNo = new FreeBoardDao().getLastSeq();
			System.out.println("getlastNo="+getlastNo);
			msg = "성공적으로 게시글을 등록했습니다.";
		
			loc="/board/free/freeBoardView?postNo="+getlastNo;
		
		}
		else {
			msg = "게시글 등록에 실패했습니다.";	
			
			loc="/board/free/freeBoardList";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher(view).forward(request, response);*/

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
