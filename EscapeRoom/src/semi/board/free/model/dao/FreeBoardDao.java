package semi.board.free.model.dao;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import semi.board.free.model.vo.BoardComment;
import semi.board.free.model.vo.FreeBoard;

public class FreeBoardDao {
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
	
	
	public List<FreeBoard> boardSelectAll(int cPage, int numPerPage) {
		List<FreeBoard> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from ( select rownum as rnum, v.* from( select v.*, (select count(*) from board_comment_free where ref = v.postNo) as board_comment_cnt from board_free v  order by postdate desc) v ) v where rnum between ? and ?";
		
		//1. 클래스등록확인
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
			pstmt = conn.prepareStatement(query);
	        int startRnum = (cPage-1)*numPerPage +1;
	        int endRnum = cPage*numPerPage;

	        pstmt.setInt(1, startRnum);
	        pstmt.setInt(2, endRnum);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			while(rset.next()) {
				FreeBoard fb = new FreeBoard();
				fb.setPostNo(rset.getInt("postno"));
				fb.setPostTitle(rset.getString("posttitle"));
				fb.setPostWriter(rset.getString("postwriter"));
				fb.setPostContent(rset.getString("postcontent"));
				fb.setPostOriginalFile(rset.getString("postoriginalfile"));
				fb.setPostRenamedFile(rset.getString("postrenamedfile"));
				fb.setPostLike(rset.getInt("postlike"));
				fb.setPostDislike(rset.getInt("postdislike"));
				fb.setPostDate(rset.getDate("postdate"));
				fb.setPostReadCount(rset.getInt("postreadcount"));
				fb.setBoard_comment_cnt(rset.getInt("board_comment_cnt"));
				
				list.add(fb);
				
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
		String query = "select count(*) as cnt from board_free";
		
		//1. 클래스등록확인
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
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

	public List<FreeBoard> boardSelectBest3() {
		List<FreeBoard> bestList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from ( select rownum as rnum, v.* from( select v.*, (select count(*) from board_comment_free where ref = v.postNo) as board_comment_cnt from board_free v  order by postlike desc) v ) v where ROWNUM <4";
		
		//1. 클래스등록확인
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
			pstmt = conn.prepareStatement(query);
	       
	  
			rset = pstmt.executeQuery();
			
			bestList = new ArrayList<>();
			while(rset.next()) {
				FreeBoard fb = new FreeBoard();
				fb.setPostNo(rset.getInt("postno"));
				fb.setPostTitle(rset.getString("posttitle"));
				fb.setPostWriter(rset.getString("postwriter"));
				fb.setPostContent(rset.getString("postcontent"));
				fb.setPostOriginalFile(rset.getString("postoriginalfile"));
				fb.setPostRenamedFile(rset.getString("postrenamedfile"));
				fb.setPostLike(rset.getInt("postlike"));
				fb.setPostDislike(rset.getInt("postdislike"));
				fb.setPostDate(rset.getDate("postdate"));
				fb.setPostReadCount(rset.getInt("postreadcount"));
				fb.setBoard_comment_cnt(rset.getInt("board_comment_cnt"));
				
				bestList.add(fb);
				
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

	public FreeBoard selectByPostNo(int postNo) {
		FreeBoard fb = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from ( select rownum as rnum, v.* from( select v.*, (select count(*) from board_comment_free where ref = v.postNo) as board_comment_cnt from board_free v  order by postdate desc) v ) v  where postno =?";
		
		//1. 클래스등록확인
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				fb = new FreeBoard();
				fb.setPostNo(rset.getInt("postno"));
				fb.setPostTitle(rset.getString("posttitle"));
				fb.setPostWriter(rset.getString("postwriter"));
				fb.setPostContent(rset.getString("postcontent"));
				fb.setPostOriginalFile(rset.getString("postoriginalfile"));
				fb.setPostRenamedFile(rset.getString("postrenamedfile"));
				fb.setPostLike(rset.getInt("postlike"));
				fb.setPostDislike(rset.getInt("postdislike"));
				fb.setPostDate(rset.getDate("postdate"));
				fb.setPostReadCount(rset.getInt("postreadcount"));	
				fb.setBoard_comment_cnt(rset.getInt("board_comment_cnt"));
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
			
			return fb;
		}

	public int updateBoard(FreeBoard fb) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "UPDATE board_free SET posttitle = ?, postcontent=? ,postoriginalfile=? , postrenamedfile=? where postno = ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, fb.getPostTitle());
			pstmt.setString(2, fb.getPostContent());
			pstmt.setString(3, fb.getPostOriginalFile());
			pstmt.setString(4, fb.getPostRenamedFile());
			pstmt.setInt(5, fb.getPostNo());
			
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

	public FreeBoard selectByNo(int postNo) {
		FreeBoard fb = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from board_free where postno=?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, postNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				fb = new FreeBoard();
				fb.setPostNo(rset.getInt("postno"));
				fb.setPostTitle(rset.getString("posttitle"));
				fb.setPostWriter(rset.getString("postwriter"));
				fb.setPostContent(rset.getString("postcontent"));
				fb.setPostOriginalFile(rset.getString("postoriginalfile"));
				fb.setPostRenamedFile(rset.getString("postrenamedfile"));
				fb.setPostLike(rset.getInt("postlike"));
				fb.setPostDislike(rset.getInt("postdislike"));
				fb.setPostDate(rset.getDate("postdate"));
				fb.setPostReadCount(rset.getInt("postreadcount"));	
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
		
		return fb;
	}

	public int deleteBoard(int postNo) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "delete from board_free where postno=?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
			
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
		String query = "select * from board_comment_free where ref = ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
			
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
		String query = "select * from (select * from board_comment_free where ref=? order by commentlike desc) where ROWNUM <4 and commentlike>0";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
			
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
	    "INSERT INTO board_comment_free (commentno,  commentlevel,  commentwriter,  commentcontent,  ref,  commentref) VALUES (seq_comment_free_commentno.nextVal, ? ,  ? ,  ? , ? , ?)";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
			
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
		String query = "UPDATE board_comment_free SET commentcontent = ? where commentno = ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
			
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
		String query = "delete from board_comment_free where commentno=?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, commentNo);
//			fb.setPostNo(rset.getInt("postno"));
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

	public int updateLikey(int commentNo, int likey) {
		PreparedStatement pstmt = null;
		Connection conn = null;
		int commentLikey = 0;
		int result = 0;
		ResultSet rset = null;
		String query = "UPDATE board_comment_free SET commentlike = ?+1 where commentNo = ?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, likey);
			pstmt.setInt(2, commentNo);

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
		String query = "select commentlike from board_comment_free where commentNo=?";
		
		//1. 클래스등록확인
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
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

	public int updateBoardLikey(int postNo, int boardLikey) {
		PreparedStatement pstmt = null;
		Connection conn = null;
		int commentLikey = 0;
		int result = 0;
		ResultSet rset = null;
		String query = "UPDATE board_free SET postlike = ?+1 where postno = ?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardLikey);
			pstmt.setInt(2, postNo);

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
		String query = "select postlike from board_free where postNo=?";
		
		//1. 클래스등록확인
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
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

	public int updateBoardDislikey(int postNo, int boardDislikey) {
		PreparedStatement pstmt = null;
		Connection conn = null;
		int commentLikey = 0;
		int result = 0;
		ResultSet rset = null;
		String query = "UPDATE board_free SET postdislike = ?+1 where postno = ?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardDislikey);
			pstmt.setInt(2, postNo);

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
		String query = "select postdislike from board_free where postNo=?";
		
		//1. 클래스등록확인
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
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
		String query = "select commentdate from board_comment_free where commentno=?";
		
		//1. 클래스등록확인
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
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
		String query = "select * from board_comment_free where ref = ? and commentlevel=2 and commentref = ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
			
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

	public int updateDislike(int commentNo, int commentDislikeAmount) {
		PreparedStatement pstmt = null;
		Connection conn = null;
		int commentLikey = 0;
		int result = 0;
		ResultSet rset = null;
		String query = "UPDATE board_comment_free SET commentdislike = ?+1 where commentNo = ?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, commentDislikeAmount);
			pstmt.setInt(2, commentNo);

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
		String query = "select commentdislike from board_comment_free where commentNo=?";
		
		//1. 클래스등록확인
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
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
		String query = "select commentcontent from board_comment_free where commentNo=?";
		
		//1. 클래스등록확인
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"semi", //아이디 
					"semi");//비번
			
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

	
	
}
	

	


