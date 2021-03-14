package dbTset;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import utill.DBUtill;

public class Lab {

	//급여를 가변으로 입력 받아 입력값 이상의 급여를 받는 직원들 조회
	//직원이름, 급여, 입사일, 부서번호 출력
	public static void main(String[] args) throws SQLException {
		
		met(2000);
		
	}

	private static void met(int val) throws SQLException {
		
		
		Connection conn =DBUtill.getConnection();
		Statement st = null;
		ResultSet rs = null;
		
		String sql = "select first_name, salary, hire_date, department_id from employees where salary >= "+val;
	
		st = conn.createStatement();
		rs = st.executeQuery(sql);
		while(rs.next()) {
			String fn = rs.getString("first_name");
			int sa = rs.getInt("salary");
			String hd = rs.getString("hire_date");
			int di = rs.getInt("department_id");
			
			System.out.println(fn+"\t"+sa+"\t"+hd+"\t"+di);
		}
		rs.close();
		st.close();
		conn.close();
		
	}

}
