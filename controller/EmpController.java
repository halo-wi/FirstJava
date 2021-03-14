package controller;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import model.EmpDAO;
import model.EmpVO;
import view.EmpView;

public class EmpController {

	public static void main(String[] args) throws SQLException {
		//1. 모든직원 조회
		//2. 유일키(Primary Key).. null불가, 필수칼럼, 중복없음
		//직원 번호로 조회하기
		//3. 부서로 조회하기
		method8(60,"IT_PROG",1000,"2005-01-01");

	}

	private static void method8(int dept, String job, int sal, String dt) throws SQLException {
		EmpDAO dao = new EmpDAO();
		List<EmpVO> emplist = dao.selectByCondition(dept,job,sal,Date.valueOf(dt));
		EmpView.display(emplist);
		
	}

	private static void method7(String r) throws SQLException {
		EmpDAO dao = new EmpDAO();
		List<EmpVO> emplist = dao.selectByName(r);
		EmpView.display(emplist);
	}

	private static void method6(String sd, String ed) throws SQLException {
		EmpDAO dao = new EmpDAO();
		List<EmpVO> emplist = dao.selectByDate(sd, ed);
		EmpView.display(emplist);
		
	}

	private static void method5(int min, int max ) throws SQLException {
		EmpDAO dao = new EmpDAO();
		List<EmpVO> emplist = dao.selectBySal(min, max);
		EmpView.display(emplist);
		
	}

	private static void method4(String jobid) throws SQLException {
		EmpDAO dao = new EmpDAO();
		List<EmpVO> emplist = dao.selectByJobId(jobid);
		EmpView.display(emplist);
		
	}

	private static void method3(int deptid) throws SQLException {
		EmpDAO dao = new EmpDAO();
		List<EmpVO> emplist = dao.selectByDept(deptid);
		EmpView.display(emplist);
		
	}

	private static void method2(int empid) throws SQLException {
		EmpDAO dao = new EmpDAO();
		EmpVO emp = dao.selectById(empid);
		EmpView.display(emp);
		
	}

	private static void method1() throws SQLException {
		EmpDAO dao = new EmpDAO();
		List<EmpVO> emplist = dao.selectAll();
		EmpView.display(emplist);
		
	}

}
