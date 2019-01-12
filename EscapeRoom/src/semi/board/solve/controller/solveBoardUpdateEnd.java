package semi.board.solve.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import semi.board.solve.model.dao.SolveBoardDao;
import semi.board.solve.model.vo.SolveBoard;
import semi.common.MyFileRenamePolicy;

/**
 * Servlet implementation class solveUpdateEnd
 */
@WebServlet("/board/solve/solveBoardUpdateEnd")
public class solveBoardUpdateEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public solveBoardUpdateEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "게시판 수정 오류");
			request.setAttribute("loc", "/");
			String view = "/WEB-INF/views/common/msg.jsp";
			request.getRequestDispatcher(view).forward(request, response);
			return;
		}
		
		String saveDirectory = getServletContext().getRealPath("/upload/solveBoard/");
		int maxPostSize = 1024*1024*10;
		String enc = "UTF-8";
		FileRenamePolicy frp = new MyFileRenamePolicy();
		
		MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, maxPostSize, enc, frp);
		
		int postNo = Integer.parseInt(multiReq.getParameter("postNo"));
		String postTitle = multiReq.getParameter("title");
		String postWriter = multiReq.getParameter("writer");
		String postContent = multiReq.getParameter("content");
		
		String renamedFileName = multiReq.getFilesystemName("up_file");
		String originalFileName = multiReq.getOriginalFileName("up_file");

		String oldFile  = multiReq.getParameter("old_renamed_file");
		//글쓰기 
		File f = multiReq.getFile("up_file");
		//1.업로드한 파일이 있는 경우
		if(f!=null && f.length() >0) {
			//기존파일 삭제 처리
			File delFile = new File(saveDirectory+oldFile); //실제 입력된 값이 들어간다.
//			delFile.delete(); //파일 삭제 
			
			//파일 이동
			String delDirectory = getServletContext().getRealPath("/deleteFiles/solveBoard/");
			//파일이 생성되지 않았지만 객체를 먼저 생성해둔다.
			File old_delFile = new File(delDirectory+ oldFile);
			delFile.renameTo(old_delFile); //기존 파일을 renaemTo하면 알아서 옮겨진다.
			
		}
		
		//2.첨부파일 삭제가 체크된 경우
		else if(multiReq.getParameter("del_file")!=null) { // 체크하면 on이라는값이 전송 안되면 null
			//기존파일 삭제 처리
			File delFile = new File(saveDirectory+oldFile); ///null값이 들어감?
//			delFile.delete(); //파일 삭제 
			
			//파일 이동
			String delDirectory = getServletContext().getRealPath("/deleteFiles/solveBoard/");
			//파일이 생성되지 않았지만 객체를 먼저 생성해둔다.
			File old_delFile = new File(delDirectory+ oldFile);
			delFile.renameTo(old_delFile);
			
		}
		//3.첨부파일 없는 경우
		else {
			//기존값 유지
			originalFileName = multiReq.getParameter("old_original_file"); //null값에 파라미터로 받은 거 넣어줌
			renamedFileName = multiReq.getParameter("old_renamed_file"); //null값에 파라미터로 받은 거 넣어줌
		
		}
		
		SolveBoard sb = new SolveBoard();
		sb.setPostNo(postNo);
		sb.setPostTitle(postTitle);
		sb.setPostWriter(postWriter);
		sb.setPostContent(postContent);
		sb.setPostOriginalFile(originalFileName);
		sb.setPostRenamedFile(renamedFileName);
		
		int result = new SolveBoardDao().updateBoard(sb);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/board/solve/solveBoardView?postNo="+postNo ;
		
		if(result >0 ) {
			msg ="게시물 수정성공";
			
		}else {
			msg = "수정실패";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
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
