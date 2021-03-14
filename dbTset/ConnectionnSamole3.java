package dbTset;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import utill.DBUtill;

public class ConnectionnSamole3 {

	public static void main(String[] args) {
		// 모든부서 조회

		Connection conn =DBUtill.getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = "select*from departments";
		
		try {
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString("department_name");
				System.out.println(id+name);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally { DBUtill.dbClose(rs, st, conn);}
		
		
		
	}

}
