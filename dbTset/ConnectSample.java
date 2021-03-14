package dbTset;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectSample {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// 1. Oracle이 제공하는 드라이버 준비....jar
		String driverName = "oracle.jdbc.driver.OracleDriver";
		Class.forName(driverName);
		System.out.println("load sucess");
		
		//2. 연결: connection
		Connection conn= null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
		String userid = "hr"; 
		String pw = "hr"; 
		conn= DriverManager.getConnection(url, userid, pw);
		
		//2. sql문 실행
		
		String sql = 
				" select first_name"+
				" from EMPLOYEES"+
				" where FIRST_NAME like '%s'";
		Statement st= conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while(rs.next()) {
			String fname = rs.getString(1);
			System.out.println(fname+"\t"+"!!");
			
		}
		//4. 자원반납...db연결 해제
		rs.close();
		st.close();
		conn.close();
	}

}
