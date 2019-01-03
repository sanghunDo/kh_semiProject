package semi.common;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
<<<<<<< HEAD
 * Singletone패턴으로 다음 업무를 수행함
 * 0. 드라이버 클래스 등록
 * 1. DB연결 : Connection객체 생성(url, user, password)
 * 2. 트랜잭션 관리
 * 3. 연결해제 : 자원반납
 * 
 * 클래스에 대한 객체가 프로그램 구동내내 단 하나만 생성되어 작동되게 함.
 * static자원을 활용
 */
public class JDBCTemplate {

	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Properties prop = new Properties();
			String fileName = JDBCTemplate.class.getResource("/driver.properties").getPath();
=======
 * Singletone패턴으로 다음 업무를 수행함.
 * 0. 드라이버클래스 등록(jdbc 4.0이하일때만 반드시 작성) 
 * 1.DB연결 : Connection객체생성(url, user, password) DB로 가는 통행권을 만든것임 
 * 2. 트랜잭션처리 : 
 *					 EX) //트랜잭션처리 
 * 						if(result>0) { 
 * 						conn.commit(); 
 * 						} else { 
 * 								conn.rollback(); } 
 * 3. 연결해제 : 자원반납 (역순으로 할 것)
 * 
 * 싱글톤패턴은?
 * 클래스에 대한 객체가 프로그램 구동내내 단 하나만 생성되어 작동되게 한다.
 * static자원을 활용
 * 
 *
 */

public class JDBCTemplate {
	
	public static Connection getConnection() {
		
		Connection conn = null;

		try {
			Properties prop = new Properties();
//			prop.load(new FileReader("resources/driver.properties"));
			
			String fileName = JDBCTemplate.class.getResource("/driver.properties")
												.getPath();
>>>>>>> d992ac243f2c9aa36c6e2f643e8e803079c15ac7
			prop.load(new FileReader(fileName));
			
			String driver = prop.getProperty("driver");
			String url = prop.getProperty("url");
			String user = prop.getProperty("user");
			String password = prop.getProperty("password");
<<<<<<< HEAD
			
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
=======
		
			
			//0. 드라이버 등록
			Class.forName(driver);
			
			//1. Connection객체생성
			conn = DriverManager.getConnection(url, user, password);
			
			//Java Application에서 트랜잭션을 제어
>>>>>>> d992ac243f2c9aa36c6e2f643e8e803079c15ac7
			conn.setAutoCommit(false);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
<<<<<<< HEAD
=======
		
		
>>>>>>> d992ac243f2c9aa36c6e2f643e8e803079c15ac7
		return conn;
	}
	
	public static void close(Connection conn) {
<<<<<<< HEAD
		
		try {
			if(conn!=null && !conn.isClosed()) conn.close();
=======
		try {
			//conn이 null이 아니고 닫히지 않았을때만 커넥션객체 실행
			if(conn!=null && !conn.isClosed())
			conn.close();
>>>>>>> d992ac243f2c9aa36c6e2f643e8e803079c15ac7
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
<<<<<<< HEAD
		try {
			if(stmt!=null && !stmt.isClosed()) stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
=======
		
		try {
			if(stmt!=null && !stmt.isClosed())
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
>>>>>>> d992ac243f2c9aa36c6e2f643e8e803079c15ac7
	}
	
	public static void close(ResultSet rset) {
		try {
<<<<<<< HEAD
			if(rset!=null && !rset.isClosed()) rset.close();
=======
			if(rset!=null && !rset.isClosed())
			rset.close();
>>>>>>> d992ac243f2c9aa36c6e2f643e8e803079c15ac7
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection conn) {
		try {
<<<<<<< HEAD
			if(conn!=null && !conn.isClosed()) conn.commit();
=======
			if(conn!=null && !conn.isClosed())
			conn.commit();
>>>>>>> d992ac243f2c9aa36c6e2f643e8e803079c15ac7
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
<<<<<<< HEAD
			if(conn!=null && !conn.isClosed()) conn.rollback();
=======
			if(conn!=null && !conn.isClosed())
			conn.rollback();
>>>>>>> d992ac243f2c9aa36c6e2f643e8e803079c15ac7
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
<<<<<<< HEAD
=======

>>>>>>> d992ac243f2c9aa36c6e2f643e8e803079c15ac7
}
