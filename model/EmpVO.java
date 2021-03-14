package model;

import java.sql.Date;
import java.sql.ResultSet;

//DTO(Data Transfer Object)
//VO (Value Object)
public class EmpVO {
	int EMPLOYEE_ID;
	String FIRST_NAME;
	String LAST_NAME;
	String EMAIL;
	String PHONE_NUMBER;
	Date HIRE_DATE;
	String JOB_ID;
	int SALARY;
	double COMMISSION_PCT;
	int MANAGER_ID;
	int DEPARTMENT_ID;
	public EmpVO(int eMPLOYEE_ID, String fIRST_NAME, String lAST_NAME, String eMAIL, String pHONE_NUMBER,
			Date hIRE_DATE, String jOB_ID, int sALARY, double cOMMISSION_PCT, int mANAGER_ID, int dEPARTMENT_ID) {
		super();
		EMPLOYEE_ID = eMPLOYEE_ID;
		FIRST_NAME = fIRST_NAME;
		LAST_NAME = lAST_NAME;
		EMAIL = eMAIL;
		PHONE_NUMBER = pHONE_NUMBER;
		HIRE_DATE = hIRE_DATE;
		JOB_ID = jOB_ID;
		SALARY = sALARY;
		COMMISSION_PCT = cOMMISSION_PCT;
		MANAGER_ID = mANAGER_ID;
		DEPARTMENT_ID = dEPARTMENT_ID;
	}
	public EmpVO() {
		super();
	}
	public EmpVO(String fIRST_NAME, Date hIRE_DATE, String jOB_ID, int sALARY, int dEPARTMENT_ID) {
		super();
		FIRST_NAME = fIRST_NAME;
		HIRE_DATE = hIRE_DATE;
		JOB_ID = jOB_ID;
		SALARY = sALARY;
		DEPARTMENT_ID = dEPARTMENT_ID;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("직원정보 EmpVO [EMPLOYEE_ID=").append(EMPLOYEE_ID).append(", FIRST_NAME=").append(FIRST_NAME)
				.append(", LAST_NAME=").append(LAST_NAME).append(", EMAIL=").append(EMAIL).append(", PHONE_NUMBER=")
				.append(PHONE_NUMBER).append(", HIRE_DATE=").append(HIRE_DATE).append(", JOB_ID=").append(JOB_ID)
				.append(", SALARY=").append(SALARY).append(", COMMISSION_PCT=").append(COMMISSION_PCT)
				.append(", MANAGER_ID=").append(MANAGER_ID).append(", DEPARTMENT_ID=").append(DEPARTMENT_ID)
				.append("]");
		return builder.toString();
	}
	public int getEMPLOYEE_ID() {
		return EMPLOYEE_ID;
	}
	public void setEMPLOYEE_ID(int eMPLOYEE_ID) {
		EMPLOYEE_ID = eMPLOYEE_ID;
	}
	public String getFIRST_NAME() {
		return FIRST_NAME;
	}
	public void setFIRST_NAME(String fIRST_NAME) {
		FIRST_NAME = fIRST_NAME;
	}
	public String getLAST_NAME() {
		return LAST_NAME;
	}
	public void setLAST_NAME(String lAST_NAME) {
		LAST_NAME = lAST_NAME;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getPHONE_NUMBER() {
		return PHONE_NUMBER;
	}
	public void setPHONE_NUMBER(String pHONE_NUMBER) {
		PHONE_NUMBER = pHONE_NUMBER;
	}
	public Date getHIRE_DATE() {
		return HIRE_DATE;
	}
	public void setHIRE_DATE(Date hIRE_DATE) {
		HIRE_DATE = hIRE_DATE;
	}
	public String getJOB_ID() {
		return JOB_ID;
	}
	public void setJOB_ID(String jOB_ID) {
		JOB_ID = jOB_ID;
	}
	public int getSALARY() {
		return SALARY;
	}
	public void setSALARY(int sALARY) {
		SALARY = sALARY;
	}
	public double getCOMMISSION_PCT() {
		return COMMISSION_PCT;
	}
	public void setCOMMISSION_PCT(double cOMMISSION_PCT) {
		COMMISSION_PCT = cOMMISSION_PCT;
	}
	public int getMANAGER_ID() {
		return MANAGER_ID;
	}
	public void setMANAGER_ID(int mANAGER_ID) {
		MANAGER_ID = mANAGER_ID;
	}
	public int getDEPARTMENT_ID() {
		return DEPARTMENT_ID;
	}
	public void setDEPARTMENT_ID(int dEPARTMENT_ID) {
		DEPARTMENT_ID = dEPARTMENT_ID;
	}
	public void makeEmp(ResultSet rs) {
		// TODO Auto-generated method stub
		
	}
	
	
}
