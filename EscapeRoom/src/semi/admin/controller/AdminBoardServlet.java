package semi.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.admin.model.service.AdminService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class AdminBoardServlet
 */
@WebServlet("/admin/adminBoard")
public class AdminBoardServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // 회원 전체보기 서블릿
      // 회원정보 가져와서 request로 전송하기
      // 0. 관리자로 로그인되었는지 확인하기
	  // 관리자가 아니거나 로그인상태가 아니면 사이트 접근 금지
	  Member loggedInMember = (Member)request.getSession().getAttribute("loggedInMember");
      if(loggedInMember == null || !"admin".equals(loggedInMember.getUserId())) {
         request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
         request.setAttribute("loc", "/");
         request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
         return;
      }
      
      // 1. 파라미터 핸들링
      // 페이징
      int cPage;
      try {
         cPage = Integer.parseInt(request.getParameter("cPage"));
         } catch (NumberFormatException e) {
            cPage = 1;
         }

      int numPerPage;
      try {
         numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
         } catch(NumberFormatException e) {
         numPerPage = 5;
         }
      System.out.printf("[cPage=%s, numPerPage=%s]\n", cPage, numPerPage);

      // 2. 비즈니스 로직
      // 2. 1. 컨텐츠 영역
      List<Member> list = new AdminService().selectMemberList(cPage, numPerPage);
      
      // 2. 2. 페이지바 영역
      // 전체 컨텐츠 수(전체 회원 수)를 구하기
      int totalContent = new AdminService().selectMemberCount();
      System.out.printf("[totalContent=%s]\n", totalContent);

      //공식 전체페이지 수 구하기
      int totalPage = (int)Math.ceil((double)totalContent/numPerPage);
      
      //페이지바 html
      String pageBar = "";
      //페이지바 길이
      int pageBarSize = 5;
      //공식 시작페이지 번호세팅 
      int StartPage = ((cPage-1)/pageBarSize)*pageBarSize+1;
      int endPage = StartPage + pageBarSize -1;
      
      //페이지 증감변수 
      int pageNo = StartPage;
      //[이전]section
            if(pageNo==1) {
               
            }else {/*html,자바코드*/ 
               pageBar += "<a href='"+request.getContextPath()
                                +"/admin/memberList?"
                                +"cPage="+(pageNo-1)
                                +"&numPerPage="+numPerPage+"'>[이전]</a>";
            }
            
            //[페이지]section
            while(pageNo<=endPage && pageNo <= totalPage) {
               if(cPage == pageNo) {
                  pageBar += "<span class='cPage'>"+pageNo+"</span>";
               }
               else {
                  pageBar += "<a href='"+request.getContextPath()
                    +"/admin/adminBoard?"
                    +"cPage="+pageNo
                    +"&numPerPage="+numPerPage+"'>"
                    +pageNo+"</a>";
               }
               pageNo++;
               
            }
            
            //[다음]section
            if(pageNo > totalPage) {
               
            }
            else {
               pageBar += "<a href='"+request.getContextPath()
                 +"/admin/adminBoard?"
                 +"cPage="+pageNo
                 +"&numPerPage="+numPerPage+"'>[다음]</a>";
            }
            
      // 3. view단 처리
      // 실패시 사용
      String view = "/WEB-INF/views/common/msg.jsp";
      String msg = "";
      String loc = "/home";

      request.setAttribute("view", view); // 
      request.setAttribute("msg", msg); // 실패했을 시 사용
      request.setAttribute("loc", loc); // 실패했을 시 사용

      // request 객체에 속성 등록
      System.out.println(list);
      request.setAttribute("list", list);
      request.setAttribute("pageBar", pageBar);
      request.setAttribute("cPage", cPage);
      request.setAttribute("numPerPage", numPerPage);
      request.getRequestDispatcher("/WEB-INF/views/admin/adminBoard.jsp").forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}