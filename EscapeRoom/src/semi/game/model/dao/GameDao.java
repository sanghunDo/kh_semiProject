package semi.game.model.dao;

import static semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import semi.game.model.vo.MainObj;
import semi.game.model.vo.PrologueObj;
import semi.game.model.vo.StoryObj;
import semi.member.model.vo.Member;
public class GameDao {
	private Properties prop = new Properties();

	public GameDao() {
		String fileName = GameDao.class.getResource("/sql/game/game-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public List<PrologueObj> getPrologueScenario(Connection conn) {
		List<PrologueObj> scenario = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getPrologueScenario");
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			scenario = new ArrayList<>();
			while(rset.next()) {
				PrologueObj po = new PrologueObj();
				po.setNo(rset.getInt("no"));
				po.setContent(rset.getString("content"));
				po.setFileName(rset.getString("filename")!=null?rset.getString("filename"):"");
				scenario.add(po);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return scenario;
	}
	public int buyHint(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("buyHint");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int useHint(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("useHint");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public String getHint(Connection conn, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getHint");
		String hint = "";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				hint = rset.getString("content");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hint;
	}
	public List<MainObj> getObjList(Connection conn) {
		List<MainObj> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getObjList");
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			while(rset.next()) {
				MainObj m = new MainObj();
				m.setObjNo(rset.getInt("objno"));
				m.setObjName(rset.getString("objname"));
				m.setSecondName(rset.getString("secondname")==null?"":rset.getString("secondname"));
				m.setThirdName(rset.getString("thirdname")==null?"":rset.getString("thirdname"));
				m.setParentName(rset.getString("parentname")==null?"":rset.getString("parentname"));
				m.setPosition(rset.getString("position"));
				m.setObjLevel(rset.getInt("objlevel"));
				m.setRefNo(rset.getInt("refno"));
				m.setIsItem(rset.getString("isitem"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public String getComent(Connection conn, String objName, int rnum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getComent");
		String coment = "";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, objName);
			pstmt.setInt(2, rnum);
			rset = pstmt.executeQuery();
			if(rset.next()) coment = rset.getString("coment"); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return coment;
	}
	public int checkLog(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("checkLog");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) result = rset.getInt("cnt");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	public int insertLog(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertLog");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int resetLog(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("resetLog");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int updateState(Connection conn, String stateName, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty(stateName);
		System.out.println(stateName+"//"+query+"//"+userId);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int checkState(Connection conn, String objName, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("checkState");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(objName);
			}
		} catch (SQLException e) {
			System.out.println(objName+"//"+userId);
			e.printStackTrace();
		}
		return result;
	}
	public List<StoryObj> selectAllBadEnding(Connection conn) {
		List<StoryObj> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAllBadEnding");
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				StoryObj sObj = new StoryObj();
				
				sObj.setNo(rset.getInt("no"));
				sObj.setContent(rset.getString("content"));
				sObj.setFileName(rset.getString("fileName"));
				sObj.setAudioName(rset.getString("audioName"));
				
				list.add(sObj);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public List<StoryObj> selectAllTrueEnding(Connection conn) {
		List<StoryObj> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAllTrueEnding");
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				StoryObj sObj = new StoryObj();
				
				sObj.setNo(rset.getInt("no"));
				sObj.setContent(rset.getString("content"));
				sObj.setFileName(rset.getString("fileName"));
				sObj.setAudioName(rset.getString("audioName"));
				
				list.add(sObj);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public MainObj getObject(Connection conn, String objName) {
		MainObj obj = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getObject");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, objName);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				obj = new MainObj();
				obj.setObjNo(rset.getInt("objno"));
				obj.setObjName(rset.getString("objname"));
				obj.setSecondName(rset.getString("secondname"));
				obj.setThirdName(rset.getString("thirdname"));
				obj.setParentName(rset.getString("parentname"));
				obj.setPosition(rset.getString("position"));
				obj.setObjLevel(rset.getInt("objlevel"));
				obj.setRefNo(rset.getInt("refno"));
				obj.setIsItem(rset.getString("isitem"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return obj;
	}

}
