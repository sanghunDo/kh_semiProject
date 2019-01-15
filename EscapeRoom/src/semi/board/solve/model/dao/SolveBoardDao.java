package semi.board.solve.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import semi.board.solve.model.vo.BoardComment;
import semi.board.solve.model.vo.GameRank;
import semi.board.solve.model.vo.SolveBoard;

public class SolveBoardDao {
   public static void commit(Connection conn) {
         try {
            if(conn!=null && !conn.isClosed())
               conn.commit();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
   
   public static void rollback(Connection conn) {
         try {
            if(conn!=null && !conn.isClosed())
               conn.rollback();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
   
   
   public List<SolveBoard> boardSelectAll(int cPage, int numPerPage) {
      List<SolveBoard> list = null;
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "select * from ( select rownum as rnum, v.* from( select v.*, (select count(*) from board_comment_solve where ref = v.postNo) as board_comment_cnt from board_solve v  order by postNo desc) v ) v where rnum between ? and ?";
      
      //1. 클래스등록확인
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
           int startRnum = (cPage-1)*numPerPage +1;
           int endRnum = cPage*numPerPage;

           pstmt.setInt(1, startRnum);
           pstmt.setInt(2, endRnum);
         
         rset = pstmt.executeQuery();
         
         list = new ArrayList<>();
         while(rset.next()) {
            SolveBoard sb = new SolveBoard();
            sb.setPostNo(rset.getInt("postno"));
            sb.setPostTitle(rset.getString("posttitle"));
            sb.setPostWriter(rset.getString("postwriter"));
            sb.setPostContent(rset.getString("postcontent"));
            sb.setPostOriginalFile(rset.getString("postoriginalfile"));
            sb.setPostRenamedFile(rset.getString("postrenamedfile"));
            sb.setPostLike(rset.getInt("postlike"));
            sb.setPostDislike(rset.getInt("postdislike"));
            sb.setPostDate(rset.getDate("postdate"));
            sb.setPostReadCount(rset.getInt("postreadcount"));
            sb.setBoard_comment_cnt(rset.getInt("board_comment_cnt"));
            
            list.add(sb);
            
         }
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            rset.close();
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
      //2. Connection 객체 생성
      
      return list;
   }

   public int BoardCount() {
      
      Connection conn = null;
      int totalContent = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "select count(*) as cnt from board_solve";
      
      //1. 클래스등록확인
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
         rset = pstmt.executeQuery();
         if(rset.next()) {
            totalContent = rset.getInt("cnt");
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }catch (ClassNotFoundException e) {
         e.printStackTrace();
      }finally {
         try {
            rset.close();
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
      
      
      return totalContent;
   }

   public List<SolveBoard> boardSelectBest3() {
      List<SolveBoard> bestList = null;
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "select * from ( select rownum as rnum, v.* from( select v.*, (select count(*) from board_comment_solve where ref = v.postNo) as board_comment_cnt from board_solve v  order by postlike desc) v ) v where ROWNUM <4";
      
      //1. 클래스등록확인
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
          
     
         rset = pstmt.executeQuery();
         
         bestList = new ArrayList<>();
         while(rset.next()) {
            SolveBoard sb = new SolveBoard();
            sb.setPostNo(rset.getInt("postno"));
            sb.setPostTitle(rset.getString("posttitle"));
            sb.setPostWriter(rset.getString("postwriter"));
            sb.setPostContent(rset.getString("postcontent"));
            sb.setPostOriginalFile(rset.getString("postoriginalfile"));
            sb.setPostRenamedFile(rset.getString("postrenamedfile"));
            sb.setPostLike(rset.getInt("postlike"));
            sb.setPostDislike(rset.getInt("postdislike"));
            sb.setPostDate(rset.getDate("postdate"));
            sb.setPostReadCount(rset.getInt("postreadcount"));
            sb.setBoard_comment_cnt(rset.getInt("board_comment_cnt"));
            
            bestList.add(sb);
            
         }
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            rset.close();
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
      //2. Connection 객체 생성
      
      return bestList;
   }

   public SolveBoard selectByPostNo(int postNo) {
      SolveBoard sb = null;
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "select * from ( select rownum as rnum, v.* from( select v.*, (select count(*) from board_comment_solve where ref = v.postNo) as board_comment_cnt from board_solve v  order by postdate desc) v ) v  where postno =?";
      
      //1. 클래스등록확인
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, postNo);
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            sb = new SolveBoard();
            sb.setPostNo(rset.getInt("postno"));
            sb.setPostTitle(rset.getString("posttitle"));
            sb.setPostWriter(rset.getString("postwriter"));
            sb.setPostContent(rset.getString("postcontent"));
            sb.setPostOriginalFile(rset.getString("postoriginalfile"));
            sb.setPostRenamedFile(rset.getString("postrenamedfile"));
            sb.setPostLike(rset.getInt("postlike"));
            sb.setPostDislike(rset.getInt("postdislike"));
            sb.setPostDate(rset.getDate("postdate"));
            sb.setPostReadCount(rset.getInt("postreadcount"));   
            sb.setBoard_comment_cnt(rset.getInt("board_comment_cnt"));
         }
         
         } catch (ClassNotFoundException e) {
            e.printStackTrace();
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            try {
               rset.close();
               pstmt.close();
               conn.close();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            
         }
         //2. Connection 객체 생성
         
         return sb;
      }

   public int updateBoard(SolveBoard sb) {
      int result = 0;
      Connection conn = null;
      PreparedStatement pstmt = null;
      String query = "UPDATE board_solve SET posttitle = ?, postcontent=? ,postoriginalfile=? , postrenamedfile=? where postno = ?";
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         
         pstmt = conn.prepareStatement(query);
         
         pstmt.setString(1, sb.getPostTitle());
         pstmt.setString(2, sb.getPostContent());
         pstmt.setString(3, sb.getPostOriginalFile());
         pstmt.setString(4, sb.getPostRenamedFile());
         pstmt.setInt(5, sb.getPostNo());
         
         result = pstmt.executeUpdate();
         
         if(result >0) commit(conn);
            else rollback(conn);
         
         } catch (ClassNotFoundException e) {
            e.printStackTrace();
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            try {
            
               pstmt.close();
               conn.close();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            
         }
      
      
      return result;
   }

   public SolveBoard selectByNo(int postNo) {
      SolveBoard sb = null;
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "select * from board_solve where postno=?";
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         
         pstmt = conn.prepareStatement(query);
         
         pstmt.setInt(1, postNo);
         
         rset = pstmt.executeQuery();
         if(rset.next()) {
            sb = new SolveBoard();
            sb.setPostNo(rset.getInt("postno"));
            sb.setPostTitle(rset.getString("posttitle"));
            sb.setPostWriter(rset.getString("postwriter"));
            sb.setPostContent(rset.getString("postcontent"));
            sb.setPostOriginalFile(rset.getString("postoriginalfile"));
            sb.setPostRenamedFile(rset.getString("postrenamedfile"));
            sb.setPostLike(rset.getInt("postlike"));
            sb.setPostDislike(rset.getInt("postdislike"));
            sb.setPostDate(rset.getDate("postdate"));
            sb.setPostReadCount(rset.getInt("postreadcount"));   
         }

         } catch (ClassNotFoundException e) {
            e.printStackTrace();
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            try {
               rset.close();
               pstmt.close();
               conn.close();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            
         }
      
      return sb;
   }

   public int deleteBoard(int postNo) {
      int result = 0;
      Connection conn = null;
      PreparedStatement pstmt = null;
      String query = "delete from board_solve where postno=?";
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, postNo);
         
         
         result = pstmt.executeUpdate();   
         
         if(result >0) commit(conn);
            else rollback(conn);
         
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
         
      }
   
      return result;
   }

   public List<BoardComment> selectAllComment(int postNo) {
      List<BoardComment> commentList = null;
      PreparedStatement pstmt = null;
      Connection conn = null;
      ResultSet rset = null;
      String query = "select * from board_comment_solve where ref = ?";
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, postNo);
         
         rset = pstmt.executeQuery();

         commentList = new ArrayList<>();
         while(rset.next()) {
            BoardComment bc = new BoardComment();
            bc.setCommentNo(rset.getInt("commentno"));
            bc.setCommentLevel(rset.getInt("commentlevel"));
            bc.setCommentWriter(rset.getString("commentwriter"));
            bc.setCommentContent(rset.getString("commentcontent"));
            bc.setRef(rset.getInt("ref"));
            bc.setCommentDate(rset.getDate("commentdate"));
            bc.setCommentLike(rset.getInt("commentlike"));
            bc.setCommentDislike(rset.getInt("commentdislike"));
            
            commentList.add(bc);
         }
         
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
         
      }
      return commentList;
      
   }

   public List<BoardComment> selectBestComment(int postNo) {
      List<BoardComment> bestCommentList = null;
      PreparedStatement pstmt = null;
      Connection conn = null;
      ResultSet rset = null;
      String query = "select * from (select * from board_comment_solve where ref=? order by commentlike desc) where ROWNUM <4 and commentlike>0";
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, postNo);
         
         rset = pstmt.executeQuery();

         bestCommentList = new ArrayList<>();
         while(rset.next()) {
            BoardComment bc = new BoardComment();
            bc.setCommentNo(rset.getInt("commentno"));
            bc.setCommentLevel(rset.getInt("commentlevel"));
            bc.setCommentWriter(rset.getString("commentwriter"));
            bc.setCommentContent(rset.getString("commentcontent"));
            bc.setRef(rset.getInt("ref"));
            bc.setCommentDate(rset.getDate("commentdate"));
            bc.setCommentLike(rset.getInt("commentlike"));
            bc.setCommentDislike(rset.getInt("commentdislike"));
            
            bestCommentList.add(bc);
         }
         
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
         
      }
      return bestCommentList;
   }

   public int insertComment(BoardComment bc) {
      int result = 0;
      Connection conn = null;
      PreparedStatement pstmt = null;
      String query = 
       "INSERT INTO board_comment_solve (commentno,  commentlevel,  commentwriter,  commentcontent,  ref,  commentref) VALUES (seq_comment_free_commentno.nextVal, ? ,  ? ,  ? , ? , ?)";
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         
         pstmt = conn.prepareStatement(query);
         
         pstmt.setInt(1, bc.getCommentLevel());
         pstmt.setString(2, bc.getCommentWriter());
         pstmt.setString(3, bc.getCommentContent());
         pstmt.setInt(4, bc.getRef());
         pstmt.setObject(5, bc.getCommentRef()==0?null:bc.getCommentRef());
      
         result = pstmt.executeUpdate();
         
         if(result >0) commit(conn);
            else rollback(conn);
         
         } catch (ClassNotFoundException e) {
            e.printStackTrace();
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            try {
               pstmt.close();
               conn.close();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            
         }
      
      
      return result;
   }

   public int commentUpdate(int commentNo, String commentUpdate) {
      int result = 0;
      Connection conn = null;
      PreparedStatement pstmt = null;
      String query = "UPDATE board_comment_solve SET commentcontent = ? where commentno = ?";
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         
         pstmt = conn.prepareStatement(query);
         
         pstmt.setString(1,commentUpdate);
         pstmt.setInt(2,commentNo);
         
         result = pstmt.executeUpdate();
         
         if(result >0) commit(conn);
            else rollback(conn);
         

         } catch (ClassNotFoundException e) {
            e.printStackTrace();
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            try {
            
               pstmt.close();
               conn.close();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            
         }
      
      
      return result;
   }

   public int deleteComment(int commentNo) {
      int result = 0;
      Connection conn = null;
      PreparedStatement pstmt = null;
      String query = "delete from board_comment_solve where commentno=?";
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, commentNo);
//         sb.setPostNo(rset.getInt("postno"));
//         
         result = pstmt.executeUpdate();   
         
         if(result >0) commit(conn);
            else rollback(conn);
         
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
         
      }
   
      return result;
   }

   public int updateLikey(int commentNo) {
      PreparedStatement pstmt = null;
      Connection conn = null;
      int commentLikey = 0;
      int result = 0;
      ResultSet rset = null;
      String query = "UPDATE board_comment_solve SET commentlike = commentlike+1 where commentNo = ?";
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         pstmt = conn.prepareStatement(query);
         
         pstmt.setInt(1, commentNo);

         result = pstmt.executeUpdate();
         
         if(result >0) {
            BoardComment bc = new BoardComment();
            commit(conn);
         }else {
            rollback(conn);
         };
         
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
         
      }
   
      return result;
   }

   public int getLikey(int commentNo) {
      Connection conn = null;
      int likey = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "select commentlike from board_comment_solve where commentNo=?";
      
      //1. 클래스등록확인
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, commentNo);
         rset = pstmt.executeQuery();
         if(rset.next()) {
            likey = rset.getInt("commentlike");
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }catch (ClassNotFoundException e) {
         e.printStackTrace();
      }finally {
         try {
            rset.close();
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
      
      
      return likey;
   }

   public int updateBoardLikey(int postNo) {
      PreparedStatement pstmt = null;
      Connection conn = null;
      int commentLikey = 0;
      int result = 0;
      ResultSet rset = null;
      String query = "UPDATE board_solve SET postlike = postlike+1 where postno = ?";
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         pstmt = conn.prepareStatement(query);
         
         pstmt.setInt(1, postNo);

         result = pstmt.executeUpdate();
         
         if(result >0) {
            commit(conn);
         }else {
            rollback(conn);
         };
         
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
         
      }
   
      return result;
   }
   
   public int getPostLikey(int postNo) {
      Connection conn = null;
      int likey = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "select postlike from board_solve where postNo=?";
      
      //1. 클래스등록확인
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, postNo);
         rset = pstmt.executeQuery();
         if(rset.next()) {
            likey = rset.getInt("postlike");
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }catch (ClassNotFoundException e) {
         e.printStackTrace();
      }finally {
         try {
            rset.close();
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
      
      
      return likey;
   }

   public int updateBoardDislikey(int postNo) {
      PreparedStatement pstmt = null;
      Connection conn = null;
      int commentLikey = 0;
      int result = 0;
      ResultSet rset = null;
      String query = "UPDATE board_solve SET postdislike = postdislike+1 where postno = ?";
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         pstmt = conn.prepareStatement(query);
         
         pstmt.setInt(1, postNo);

         result = pstmt.executeUpdate();
         
         if(result >0) {
            commit(conn);
         }else {
            rollback(conn);
         };
         
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
         
      }
   
      return result;
   }
   
   public int getPostDislikey(int postNo) {
      Connection conn = null;
      int dislikey = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "select postdislike from board_solve where postNo=?";
      
      //1. 클래스등록확인
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, postNo);
         rset = pstmt.executeQuery();
         if(rset.next()) {
            dislikey = rset.getInt("postdislike");
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }catch (ClassNotFoundException e) {
         e.printStackTrace();
      }finally {
         try {
            rset.close();
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
      
      
      return dislikey;
   }

   

   public String getDate(int commentRef) {
      Connection conn = null;
      String date = "";
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "select commentdate from board_comment_solve where commentno=?";
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, commentRef);
         rset = pstmt.executeQuery();
         if(rset.next()) {
            date = rset.getString("commentdate");
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }catch (ClassNotFoundException e) {
         e.printStackTrace();
      }finally {
         try {
            rset.close();
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
      
      
      return date;
   }
   
   public List<BoardComment> selectAllCommentLevel2(int ref, int commentRef) {
      List<BoardComment> commentList = null;
      PreparedStatement pstmt = null;
      Connection conn = null;
      ResultSet rset = null;
      String query = "select * from board_comment_solve where ref = ? and commentlevel=2 and commentref = ?";
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, ref);
         pstmt.setInt(2, commentRef);

         rset = pstmt.executeQuery();

         commentList = new ArrayList<>();
         while(rset.next()) {
            BoardComment bc = new BoardComment();
            bc.setCommentNo(rset.getInt("commentno"));
            bc.setCommentLevel(rset.getInt("commentlevel"));
            bc.setCommentWriter(rset.getString("commentwriter"));
            bc.setCommentContent(rset.getString("commentcontent"));
            bc.setRef(rset.getInt("ref"));
            bc.setCommentDate(rset.getDate("commentdate"));
            bc.setCommentLike(rset.getInt("commentlike"));
            bc.setCommentDislike(rset.getInt("commentdislike"));
            
            commentList.add(bc);
         }
         
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
         
      }
      return commentList;
      
   }

   public int updateDislike(int commentNo) {
      PreparedStatement pstmt = null;
      Connection conn = null;
      int commentLikey = 0;
      int result = 0;
      ResultSet rset = null;
      String query = "UPDATE board_comment_solve SET commentdislike = commentdislike+1 where commentNo = ?";
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, commentNo);

         result = pstmt.executeUpdate();
         
         if(result >0) {
            BoardComment bc = new BoardComment();
            commit(conn);
         }else {
            rollback(conn);
         };
         
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
         
      }
   
      return result;
   
   }

   public int getDislike(int commentNo) {
      Connection conn = null;
      int dislike = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "select commentdislike from board_comment_solve where commentNo=?";
      
      //1. 클래스등록확인
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, commentNo);
         rset = pstmt.executeQuery();
         if(rset.next()) {
            dislike = rset.getInt("commentdislike");
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }catch (ClassNotFoundException e) {
         e.printStackTrace();
      }finally {
         try {
            rset.close();
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
      
      
      return dislike;
   }

   public String getUpdateComment(int commentNo) {
      Connection conn = null;
      String getUpdateComment = "";
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "select commentcontent from board_comment_solve where commentNo=?";
      
      //1. 클래스등록확인
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, commentNo);
         rset = pstmt.executeQuery();
         if(rset.next()) {
            getUpdateComment = rset.getString("commentcontent");
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }catch (ClassNotFoundException e) {
         e.printStackTrace();
      }finally {
         try {
            rset.close();
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
      
      
      return getUpdateComment;
   }

   public int insertPost(SolveBoard sb) {
      int result = 0;
      PreparedStatement pstmt = null;
      Connection conn = null;
      String query = 
       "INSERT INTO board_solve (postno, posttitle, postwriter, postcontent,postoriginalfile, postrenamedfile, postdate, postreadcount, postlike, postdislike, postreport ) values ( seq_board_solve_postno.nextVal , ?, ? , ? ,?, ?, default, default, default , default , default)";
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         
         pstmt = conn.prepareStatement(query);
         
         pstmt.setString(1, sb.getPostTitle());
         pstmt.setString(2, sb.getPostWriter());
         pstmt.setString(3, sb.getPostContent());
         pstmt.setString(4, sb.getPostOriginalFile());
         pstmt.setString(5, sb.getPostRenamedFile());
   
         result = pstmt.executeUpdate();
               
         if(result >0) commit(conn);
          else rollback(conn);
         
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
         
      }
      return result;
   }
   
   public int getLastSeq() {
      Connection conn = null;
      ResultSet rset = null;
      PreparedStatement pstmt = null;
      int lastSeq = 0;
      String query = 
            
   "select * from ( select rownum as rnum, v.* from(SELECT LAST_VALUE(postno) OVER (ORDER BY postno ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS L_postno FROM  board_solve ) v) v where rnum = 1 ";
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query); 
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            lastSeq = rset.getInt("L_postno");
            
         }
         
      
         System.out.println("Dao안에 lastSeq="+lastSeq);
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            pstmt.close();
            conn.close();
            rset.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
         
      }
      
      
      return lastSeq;
   }

   public List<SolveBoard> searchByTitle(String searchVal, int cPage, int numPerPage) {
      List<SolveBoard> list = null;
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "select * from ( select rownum as rnum, v.* from( select v.*, (select count(*) from board_comment_solve where ref = v.postNo) as board_comment_cnt from board_solve v  where posttitle like ? order by postlike desc) v ) v where rnum between ? and ?";
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
           int startRnum = (cPage-1)*numPerPage +1;
           int endRnum = cPage*numPerPage;

            pstmt.setString(1, "%"+searchVal+"%");
            pstmt.setInt(2, startRnum);
            pstmt.setInt(3, endRnum);
           
         rset = pstmt.executeQuery();
         
         list = new ArrayList<>();
         while(rset.next()) {
            SolveBoard sb = new SolveBoard();
            sb.setPostNo(rset.getInt("postno"));
            sb.setPostTitle(rset.getString("posttitle"));
            sb.setPostWriter(rset.getString("postwriter"));
            sb.setPostContent(rset.getString("postcontent"));
            sb.setPostOriginalFile(rset.getString("postoriginalfile"));
            sb.setPostRenamedFile(rset.getString("postrenamedfile"));
            sb.setPostLike(rset.getInt("postlike"));
            sb.setPostDislike(rset.getInt("postdislike"));
            sb.setPostDate(rset.getDate("postdate"));
            sb.setPostReadCount(rset.getInt("postreadcount"));
            sb.setBoard_comment_cnt(rset.getInt("board_comment_cnt"));
            
            list.add(sb);
            
         }
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            rset.close();
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
   
      
      return list;
   }

   public List<SolveBoard> searchByContent(String searchVal, int cPage, int numPerPage) {
      List<SolveBoard> list = null;
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "select * from ( select rownum as rnum, v.* from( select v.*, (select count(*) from board_comment_solve where ref = v.postNo) as board_comment_cnt from board_solve v  where postcontent like ? order by postlike desc) v ) v where rnum between ? and ?";
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
           int startRnum = (cPage-1)*numPerPage +1;
           int endRnum = cPage*numPerPage;

            pstmt.setString(1, "%"+searchVal+"%");
            pstmt.setInt(2, startRnum);
            pstmt.setInt(3, endRnum);
           
         rset = pstmt.executeQuery();
         
         list = new ArrayList<>();
         while(rset.next()) {
            SolveBoard sb = new SolveBoard();
            sb.setPostNo(rset.getInt("postno"));
            sb.setPostTitle(rset.getString("posttitle"));
            sb.setPostWriter(rset.getString("postwriter"));
            sb.setPostContent(rset.getString("postcontent"));
            sb.setPostOriginalFile(rset.getString("postoriginalfile"));
            sb.setPostRenamedFile(rset.getString("postrenamedfile"));
            sb.setPostLike(rset.getInt("postlike"));
            sb.setPostDislike(rset.getInt("postdislike"));
            sb.setPostDate(rset.getDate("postdate"));
            sb.setPostReadCount(rset.getInt("postreadcount"));
            sb.setBoard_comment_cnt(rset.getInt("board_comment_cnt"));
            
            list.add(sb);
            
         }
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            rset.close();
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
   
      
      return list;
   }

   public List<SolveBoard> searchById(String searchVal, int cPage, int numPerPage) {
      List<SolveBoard> list = null;
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query =
"select * from ( select rownum as rnum, v.* from( select v.*, (select count(*) from board_comment_solve where ref = v.postNo) as board_comment_cnt from board_solve v  where postwriter like ? order by postlike desc) v ) v where rnum between ? and ?";
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
           int startRnum = (cPage-1)*numPerPage +1;
           int endRnum = cPage*numPerPage;

            pstmt.setString(1, "%"+searchVal+"%");
            pstmt.setInt(2, startRnum);
            pstmt.setInt(3, endRnum);
           
         rset = pstmt.executeQuery();
         
         list = new ArrayList<>();
         while(rset.next()) {
            SolveBoard sb = new SolveBoard();
            sb.setPostNo(rset.getInt("postno"));
            sb.setPostTitle(rset.getString("posttitle"));
            sb.setPostWriter(rset.getString("postwriter"));
            sb.setPostContent(rset.getString("postcontent"));
            sb.setPostOriginalFile(rset.getString("postoriginalfile"));
            sb.setPostRenamedFile(rset.getString("postrenamedfile"));
            sb.setPostLike(rset.getInt("postlike"));
            sb.setPostDislike(rset.getInt("postdislike"));
            sb.setPostDate(rset.getDate("postdate"));
            sb.setPostReadCount(rset.getInt("postreadcount"));
            sb.setBoard_comment_cnt(rset.getInt("board_comment_cnt"));
            
            list.add(sb);
            
         }
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            rset.close();
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
   
      
      return list;
   }

   public int searchByTitleCount(String searchVal) {
      Connection conn = null;
      int totalContent = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "select count(*) as cnt from board_solve where posttitle like ?";
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, "%"+searchVal+"%");
         rset = pstmt.executeQuery();
         if(rset.next()) {
            totalContent = rset.getInt("cnt");
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }catch (ClassNotFoundException e) {
         e.printStackTrace();
      }finally {
         try {
            rset.close();
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
      
      
      return totalContent;
   }
   
   public int searchByContentCount(String searchVal) {
      Connection conn = null;
      int totalContent = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "select count(*) as cnt from board_solve where postcontent like ?";
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, "%"+searchVal+"%");
         rset = pstmt.executeQuery();
         if(rset.next()) {
            totalContent = rset.getInt("cnt");
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }catch (ClassNotFoundException e) {
         e.printStackTrace();
      }finally {
         try {
            rset.close();
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
      
      
      return totalContent;
   }

   public int searchByIdCount(String searchVal) {
      Connection conn = null;
      int totalContent = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "select count(*) as cnt from board_solve where postwriter like ?";
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, "%"+searchVal+"%");
         rset = pstmt.executeQuery();
         if(rset.next()) {
            totalContent = rset.getInt("cnt");
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }catch (ClassNotFoundException e) {
         e.printStackTrace();
      }finally {
         try {
            rset.close();
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
      
      
      return totalContent;
   }

   public int increaseReadCount(int postNo) {
      Connection conn = null;
      int result = 0;
      PreparedStatement pstmt = null;
      String query = "update board_solve set postreadcount=postreadcount + 1 where postno = ?";
         
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
         //쿼리문미완성
         pstmt.setInt(1, postNo);
         //쿼리 실행
         result = pstmt.executeUpdate();
         
         if(result >0) commit(conn);
          else rollback(conn);
         
      }catch(SQLException e) {
         e.printStackTrace();
      }catch (ClassNotFoundException e) {
         e.printStackTrace();
      }finally {
         try {
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
      
            
      return result;
   }

   public int reportPost(int postNo) {
      Connection conn = null;
      int result = 0;
      PreparedStatement pstmt = null;
      String query = "update board_solve set postreport='Y' where postno = ?";
         
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
         //쿼리문미완성
         pstmt.setInt(1, postNo);
         //쿼리 실행
         result = pstmt.executeUpdate();
         
         if(result >0) commit(conn);
          else rollback(conn);
         
      }catch(SQLException e) {
         e.printStackTrace();
      }catch (ClassNotFoundException e) {
         e.printStackTrace();
      }finally {
         try {
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
      
            
      return result;
   }
   
   public int reportComment(int commentNo) {
      Connection conn = null;
      int result = 0;
      PreparedStatement pstmt = null;
      String query = "update board_comment_solve set commentreport='Y' where commentno = ?";
         
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
         //쿼리문미완성
         pstmt.setInt(1, commentNo);
         //쿼리 실행
         result = pstmt.executeUpdate();
         
         if(result >0) commit(conn);
          else rollback(conn);
         
      }catch(SQLException e) {
         e.printStackTrace();
      }catch (ClassNotFoundException e) {
         e.printStackTrace();
      }finally {
         try {
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
      
            
      return result;
   }

   public int insertReportPost(int postNo, String postTitle, String postWriter, String reasonVal, String userComment) {
      Connection conn = null;
      int result = 0;
      PreparedStatement pstmt = null;
      String query = "INSERT INTO admin_report_board values ('S' , ?, ?, ?, ?, ?)";
         
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
         //쿼리문미완성
         pstmt.setInt(1, postNo);
         pstmt.setString(2, postTitle);
         pstmt.setString(3, postWriter);
         pstmt.setString(4, reasonVal);
         pstmt.setString(5, userComment);


         //쿼리 실행
         result = pstmt.executeUpdate();
         
         if(result >0) commit(conn);
          else rollback(conn);
         
      }catch(SQLException e) {
         e.printStackTrace();
      }catch (ClassNotFoundException e) {
         e.printStackTrace();
      }finally {
         try {
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
      
            
      return result;
   }

   public int insertReportComment(int postNo, int commentNo, String commentWriter, String commentContent, String reasonVal,
         String userComment) {
      Connection conn = null;
      int result = 0;
      PreparedStatement pstmt = null;
      String query = "INSERT INTO admin_report_comment values ('S', ?, ?, ?, ?, ?, ?)";
         
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
         //쿼리문미완성
         pstmt.setInt(1, postNo);
         pstmt.setInt(2, commentNo);
         pstmt.setString(3, commentContent);
         pstmt.setString(4, commentWriter);
         pstmt.setString(5, reasonVal);
         pstmt.setString(6, userComment);


         //쿼리 실행
         result = pstmt.executeUpdate();
         
         if(result >0) commit(conn);
          else rollback(conn);
         
      }catch(SQLException e) {
         e.printStackTrace();
      }catch (ClassNotFoundException e) {
         e.printStackTrace();
      }finally {
         try {
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      }
      
            
      return result;
   }

   public List<GameRank> selectRankList() {
	  List<GameRank> list = null;
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String query = "select * from game_rank";
      
      //1. 클래스등록확인
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
               "escape_if_you_can", //아이디 
               "escape_if_you_can");//비번
         
         pstmt = conn.prepareStatement(query);
 
         rset = pstmt.executeQuery();
         
         list = new ArrayList<>();
         while(rset.next()) {
            GameRank gr = new GameRank();
            
            gr.setPlayno(rset.getInt("playno"));
            gr.setGameid(rset.getString("gameid"));
            gr.setGameruntime(rset.getInt("gameruntime"));
            gr.setGameEscapeDate(rset.getDate("gameescapedate"));
           
            list.add(gr);
            
         }
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            rset.close();
            pstmt.close();
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
         
      }
      
      return list;
	}
   
}

