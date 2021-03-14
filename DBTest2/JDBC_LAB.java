package DBTest2;

import java.sql.*;

import utill.DBUtill;

public class JDBC_LAB {
	static Connection conn;
	static Statement st;
	static ResultSet rs;

	public static void main(String[] args) throws SQLException {

		//method1("steven");
		//method2(80);
		method3("john");

	}

	private static void method3(String string) throws SQLException {
		String sql = " select salary, hire_date, first_name||last_name" + " from employees"
				+ " where first_name = initcap(?)";

		// 1.DB����
		conn = DBUtill.getConnection();
		// 2. DB�� ��ȭ��� �����
		PreparedStatement pst;
		pst = conn.prepareStatement(sql);
		pst.setString(1, string);
		// 3. sql�� ����
		rs = pst.executeQuery();
		// 4. select��� ���
		while (rs.next()) {
			int sal = rs.getInt(1);
			Date dt = rs.getDate("hire_date");
			String s = rs.getString(3);
			System.out.println(sal + "\t" + dt + "\t" + s);
		}
		DBUtill.dbClose(rs, st, conn);
	}
		
	

	private static void method2(int di) throws SQLException {
		String sql = " select salary, hire_date, first_name||last_name" + " from employees"
				+ " where department_id = ?"; // ? -> ���ε� ����

// 1.DB����
		conn = DBUtill.getConnection();
// 2. DB�� ��ȭ��� ����� : Statement <---- PreparedStatement
		PreparedStatement pst;
		pst = conn.prepareStatement(sql);
		pst.setInt(1, di);
// 3. sql�� ����
		rs = pst.executeQuery();
// 4. select��� ���
		while (rs.next()) {
			int sal = rs.getInt(1);
			Date dt = rs.getDate("hire_date");
			String s = rs.getString(3);
			System.out.println(sal + "\t" + dt + "\t" + s);
		}
		DBUtill.dbClose(rs, pst, conn);
	}







	private static void method1(String fname) throws SQLException {
		String sql = " select salary, hire_date, first_name||last_name" + " from employees"
				+ " where first_name = initcap('" + fname + "')";

		// 1.DB����
		conn = DBUtill.getConnection();
		// 2. DB�� ��ȭ��� �����
		st = conn.createStatement();
		// 3. sql�� ����
		rs = st.executeQuery(sql);
		// 4. select��� ���
		while (rs.next()) {
			int sal = rs.getInt(1);
			Date dt = rs.getDate("hire_date");
			String s = rs.getString(3);
			System.out.println(sal + "\t" + dt + "\t" + s);
		}
		DBUtill.dbClose(rs, st, conn);
	}

}
