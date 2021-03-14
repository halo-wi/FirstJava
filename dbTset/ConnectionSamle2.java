package dbTset;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionSamle2 {

	public static void main(String[] args) {
		// JDBC(JAca DataBase Connection)
		String driverName = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String userid = "hr";
		String pw = "hr";
		String sql = "select * from employees";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;

		try {
			Class.forName(driverName);
			System.out.println("load");
			conn = DriverManager.getConnection(url, userid, pw);
			System.out.println("connection");
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			System.out.println("sql");
			while (rs.next()) {
				String fname = rs.getString(2);
				int salary = rs.getInt("salary");
				Date d = rs.getDate("hire_date");
				System.out.println(fname + salary + d);
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
