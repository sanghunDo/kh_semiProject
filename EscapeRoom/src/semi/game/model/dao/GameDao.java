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

}
