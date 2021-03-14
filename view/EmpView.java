package view;

import java.util.List;

import model.EmpVO;

public class EmpView {
	
	public static void display(List<EmpVO> emplist) {
		
		System.out.println("직원정보 출력");
		for(EmpVO emp: emplist) {
			System.out.println(emp.getFIRST_NAME());
			System.out.println(emp);
		
		}
		}
	
	public static void display(EmpVO emp) {
		
		System.out.println("직원정보 1건");
		System.out.println(emp);
	}
	public static void display(String message) {
		System.out.println("직원정보 1건");
		System.out.println(message);
	}
	
	
	}

