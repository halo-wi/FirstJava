package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import utill.DBUtill;

//DAO (Data Access Object)
public class EmpDAO {
	// 1. 모든직원 조회
	public List<EmpVO> selectAll() throws SQLException {

		String sql = "select * from employees";

		List<EmpVO> emplist = new ArrayList<>();
		Connection conn = DBUtill.getConnection();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			emplist.add(makeEmp(rs));
		}
		DBUtill.dbClose(rs, st, conn);

		return emplist;
	}

	private EmpVO makeEmp(ResultSet rs) throws SQLException {
		EmpVO emp = new EmpVO();
		emp.setCOMMISSION_PCT(rs.getDouble("commission_pct"));
		emp.setDEPARTMENT_ID(rs.getInt("DEPARTMENT_ID"));
		emp.setEMAIL(rs.getString("EMAIL"));
		emp.setEMPLOYEE_ID(rs.getInt("EMPLOYEE_ID"));
		emp.setFIRST_NAME(rs.getString("FIRST_NAME"));
		emp.setHIRE_DATE(rs.getDate("HIRE_DATE"));
		emp.setJOB_ID(rs.getString("JOB_ID"));
		emp.setLAST_NAME(rs.getString("LAST_NAME"));
		emp.setMANAGER_ID(rs.getInt("MANAGER_ID"));
		emp.setPHONE_NUMBER(rs.getString("PHONE_NUMBER"));
		emp.setSALARY(rs.getInt("SALARY"));

		return emp;
	}

	// 2. 유일키(Primary Key).. null불가, 필수칼럼, 중복없음
	// 직원 번호로 조회하기
	public EmpVO selectById(int empid) throws SQLException {
		EmpVO emp = new EmpVO();
		String sql = "select * from employees where employee_id=?";
		Connection conn = DBUtill.getConnection();
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, empid);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			emp.makeEmp(rs);
		}
		DBUtill.dbClose(rs, st, conn);

		return emp;
	}

	// 3. 부서로 조회하기

	public List<EmpVO> selectByDept(int deptid) throws SQLException {

		String sql = "select * from employees where department_id = ?";

		List<EmpVO> emplist = new ArrayList<>();
		Connection conn = DBUtill.getConnection();
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, deptid);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			emplist.add(makeEmp(rs));
		}
		DBUtill.dbClose(rs, st, conn);

		return emplist;
	}

	// 4. job_id로 조회
	public List<EmpVO> selectByJobId(String Jobid) throws SQLException {

		String sql = "select * from employees where job_id = ?";

		List<EmpVO> emplist = new ArrayList<>();
		Connection conn = DBUtill.getConnection();
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, Jobid);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			emplist.add(makeEmp(rs));
		}
		DBUtill.dbClose(rs, st, conn);

		return emplist;
	}

	// 5. 급여가 조회
	public List<EmpVO> selectBySal(int min, int max) throws SQLException {

		String sql = "select * from employees where salary between? and ?";

		List<EmpVO> emplist = new ArrayList<>();
		Connection conn = DBUtill.getConnection();
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, min);
		st.setInt(2, max);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			emplist.add(makeEmp(rs));
		}
		DBUtill.dbClose(rs, st, conn);

		return emplist;
	}

	// 6. 입사일로 조회
	public List<EmpVO> selectByDate(String sD, String eD) throws SQLException {

		String sql = "select * from employees where hire_date between ? and ?";

		List<EmpVO> emplist = new ArrayList<>();
		Connection conn = DBUtill.getConnection();
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, sD);
		st.setString(2, eD);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			emplist.add(makeEmp(rs));
		}
		DBUtill.dbClose(rs, st, conn);

		return emplist;
	}

	// 7. 이름에 특정 문자가 들어간 사람
	public List<EmpVO> selectByName(String ch) throws SQLException {

		String sql = "select * from employees where first_name like ?";

		List<EmpVO> emplist = new ArrayList<>();
		Connection conn = DBUtill.getConnection();
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, "%" + ch + "%");
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			emplist.add(makeEmp(rs));
		}
		DBUtill.dbClose(rs, st, conn);

		return emplist;
	}

	// 8. 여러조건 조회(부서, job, salary, hire_date)
	public List<EmpVO> selectByCondition(int deptId, String jobId, int sal, Date hd) throws SQLException {

		String sql = "select * from employees where department_id = ? and job_id =? and salary >= ? "
				+ " and hire_date between ? and add_months(?, 12)";

		List<EmpVO> emplist = new ArrayList<>();
		Connection conn = DBUtill.getConnection();
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, deptId);
		st.setString(2, jobId);
		st.setInt(3, sal);
		st.setDate(4, hd);
		st.setDate(5, hd);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			emplist.add(makeEmp(rs));
		}
		DBUtill.dbClose(rs, st, conn);

		return emplist;
	}

}
