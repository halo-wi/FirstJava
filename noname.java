package com.kosta.day01;

import java.util.Scanner;

public class noname {

	public static void main(String[] args) {
		
		
		
		
		
		
		
		
		
		
		// ex3();
		// ex4();
		// ex5();
		// ex6();
		//ex7();
		// ex8();

	}

	private static void ex8() {
		boolean run = true;
		int bal = 0;
		Scanner sc = new Scanner(System.in);

		while (run) {
			System.out.println("=============");
			System.out.println("�Ա�,���,�ܾ�,������");
			System.out.println("=============");
			System.out.print("choice");

			int a = sc.nextInt();
			

			switch (a) {

			case 4:
				run = false;
				break;

			case 1:
				System.out.print("�Ա�");
				int inpt = sc.nextInt();
				bal += inpt;
				break;
			case 2:
				System.out.print("���");
				int oupt = sc.nextInt();
				bal -= oupt;
				break;
			case 3:
				System.out.print("�ܾ�");
				System.out.println(bal);
				break;
			
				
			}
			

		}
		sc.close();
		System.out.println("end");
	}

	private static void ex7() {
		boolean run = true;
		int bal = 0;
		Scanner sc = new Scanner(System.in);

		while (run) {
			System.out.println("=============");
			System.out.println("1�Ա�, 2���� ,3�ܰ�, 4������");
			System.out.println("=============");
			System.out.print("choice");

			int a = sc.nextInt();

			if (a == 4) {
				run = false;
				sc.close();
			} else if (a == 3) {
				System.out.print("�ܰ�");
				System.out.println(bal);

			} else if (a == 2) {
				System.out.print("����");
				int oupt = sc.nextInt();
				bal -= oupt;
			}

			else if (a == 1) {
				System.out.print("�Ա�");
				int inpt = sc.nextInt();
				bal += inpt;

			}

		}
		System.out.println("end");
	}

	private static void ex6() {

		for (int i = 1; i <= 5; i++) {
			for (int r = 1; r <= i; r++) {
				System.out.print("*");
			}
			System.out.println();
		}

	}

	private static void ex5() {
		for (int x = 1; x <= 10; x++) {
			for (int y = 1; y <= 10; y++) {
				if (4 * x + 5 * y == 60) {
					System.out.println(x + "," + y);
				}
			}
		}

	}

	private static void ex4() {
		// ���� 5�� �Ǵ� �ֻ��� ����

		int i;
		int j;
		boolean a = true;
		while (a) {
			i = (int) (Math.random() * 6 + 1);
			j = (int) (Math.random() * 6 + 1);
			System.out.println(i + "," + j);
			if (i + j == 5) {
				a = false;
				break;
			}
		}
	}

	private static void ex3() {
		// 100���� Ȧ���� ��
		int res = 0;
		for (int a = 1; a <= 100; a++) {
			if (a % 3 == 0) {
				res += a;
			}
		}
		System.out.println(res);

	}

}
