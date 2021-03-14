package DBTest2;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utill.DBUtill;

public class JDBC {

	static Connection conn;
	static PreparedStatement st;
	static ResultSet rs;
	static String sql;

	public static void main(String[] args) throws SQLException {

		// Integer[] depts = {30,50,80};
		// int minSal = 5000;
		// int maxSal = 18000;
		// method1(depts, minSal, maxSal);
		List<EmpData> emplist = method2("r");
		myprint(emplist);
	}

	private static void myprint(List<EmpData> emplist) {
		for (EmpData emp : emplist) {
			System.out.println(emp);
		}
	}

	private static List<EmpData> method2(String ch) throws SQLException {
		List<EmpData> emplist = new ArrayList<EmpData>();
		String sql = "select first_name, last_name, salary,  hire_date" + " from employees"
				+ " where last_name like '__'||?||'%'";
		conn = DBUtill.getConnection();
		st = conn.prepareStatement(sql);
		st.setString(1, ch);
		rs = st.executeQuery();
		while (rs.next()) {
			emplist.add(new EmpData(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getDate(4)));
		}
		DBUtill.dbClose(rs, st, conn);
		return emplist;
	}

	private static void method1(Integer[] depts, int minSal, int maxSal) throws SQLException {
		String dept_w = " and department_id in (";
		for (Integer i : depts) {
			dept_w += "?,";
		}
		dept_w = dept_w.substring(0, dept_w.length() - 1) + ")";

		String sql = " select  * " + " from employees " + " where to_char(hire_date ,'yyyy') between '2000' and '2009'"
				+ dept_w + " and salary between ? and ?" + " and commission_pct is not null"
				+ " order by hire_date, salary desc";
		conn = DBUtill.getConnection();
		st = conn.prepareStatement(sql);

		int cnt = 1;
		for (Integer i : depts) {
			st.setInt(cnt++, i);
		}
		st.setInt(cnt++, minSal);
		st.setInt(cnt++, maxSal);

		rs = st.executeQuery();

		while (rs.next()) {
			int id = rs.getInt(1);
			String n = rs.getString(2);
			Date d = rs.getDate("hire_date");
			int sal = rs.getInt("salary");
			int dept = rs.getInt("department_id");
			double comm = rs.getInt("commission_pct");

			System.out.println(id + n + dept + sal + d + comm);
		}
		DBUtill.dbClose(rs, st, conn);
	}
}
