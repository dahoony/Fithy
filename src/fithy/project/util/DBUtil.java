package fithy.project.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
	public static String CLASS_NAME = "oracle.jdbc.driver.OracleDriver";
	public static String URI = "jdbc:oracle:thin:@localhost:1521:xe";
	public static String ID = "gymproject";
	public static String PASSWORD =  "1234";
	
	public static Connection getConnect() {
		try {
			Class.forName(CLASS_NAME);
			System.out.println("성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("실패");
		}
		Connection con = null;
		try {
			con = DriverManager.getConnection(URI,ID,PASSWORD);
			System.out.println("성공");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("실패");
		}
		return con;
	}
	
	public static void close(Connection c,PreparedStatement pState) {
		if(pState != null) {
			try {
			pState.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(c != null) {
			try {
			c.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void close(Connection c, PreparedStatement pState, ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		close(c,pState);
	}
}
