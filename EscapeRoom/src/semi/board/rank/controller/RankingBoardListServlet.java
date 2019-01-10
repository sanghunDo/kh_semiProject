package semi.board.rank.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.rank.model.service.RankService;
import semi.board.rank.model.vo.Rank;

/**
 * Servlet implementation class RankingBoardListServlet
 */
@WebServlet("/board/rank/rankingBoardList")
public class RankingBoardListServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      request.setCharacterEncoding("utf-8");
      
      List<Rank> list = new RankService().selectRankList();
      List<Rank> finalList = new ArrayList<>();
      
      for(Rank r : list) {
         int runtime = (int)r.getGameruntime() / 1000;
         
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
         
         finalList.add(modifiedR);
         
//         System.out.println("아이디 : " + r.getGameId() +" 원래 게임런타임 : " + r.getGameruntime() + " 시간 변환 런타임 : " + endRuntime);
      }
      
      System.out.println("최종 리스트 : " + finalList);
      
      request.setAttribute("list", finalList);
      
      request.getRequestDispatcher("/WEB-INF/views/board/rank/RankingBoard.jsp").forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}