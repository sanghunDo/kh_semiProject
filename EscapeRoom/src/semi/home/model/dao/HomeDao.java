package semi.home.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;

import semi.board.rank.model.vo.Rank;

public class HomeDao {

	private Properties prop = new Properties();
	
	public HomeDao() {
		String fileName = HomeDao.class.getResource("/sql/home/home-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Rank selectRankTop(Connection conn) {
		
		return null;
	}

}
