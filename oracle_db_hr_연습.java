public static void main(String[] args) throws SQLException {
		method()

	}

	private static void method() throws SQLException {
		EmpDAO dao = new EmpDAO();
		EmpVO emp = makeEmp();
		
		
		int res = dao.insertEmp(emp);
		EmpView.display(res>0?"성공":"실패");
		
	}
	
	private static EmpVO makeEmp() throws SQLException {
		EmpVO emp = new EmpVO();
		emp.setCOMMISSION_PCT(0.5);
		emp.setDEPARTMENT_ID(10);
		emp.setEMAIL("sdhjkjhds@ndsdbn.com");
		emp.setEMPLOYEE_ID(9);
		emp.setFIRST_NAME("kim");
		emp.setHIRE_DATE(new Date(2000,01,01));
		emp.setJOB_ID("dev");
		emp.setLAST_NAME("sibqa");
		emp.setMANAGER_ID(21);
		emp.setPHONE_NUMBER("12314");
		emp.setSALARY(10000);

		return emp;
	}
  
  public class EmpDAO {
	// CRUD( create:insert, read:select, update, delete )
	// 사용자가 웹을 통해 회원가입 -> controller => service => DAO => DB
	public int insertEmp(EmpVO emp) {
		String sql="insert into employees values(?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn;
		PreparedStatement ps = null;
		int res = 0;
		
		conn=DBUtill.getConnection();
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, emp.getEMPLOYEE_ID());
			ps.setString(2, emp.getFIRST_NAME());
			ps.setString(3, emp.getLAST_NAME());
			ps.setString(4, emp.getEMAIL());
			ps.setString(5, emp.getPHONE_NUMBER());
			ps.setDate(6, emp.getHIRE_DATE());
			ps.setString(7, emp.getJOB_ID());
			ps.setInt(8, emp.getSALARY());
			ps.setDouble(9, emp.getCOMMISSION_PCT());
			ps.setInt(10, emp.getMANAGER_ID());
			ps.setInt(11, emp.getDEPARTMENT_ID());
			
			res = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;

	}
