package com.kosta.day17;

public class Prob5 {
	public static void main(String[] args) {
		int[] answer = { 1, 4, 4, 3, 1, 4, 4, 2, 1, 3, 2 };
		int[] counter = new int[4];
		
		for (int a : answer) {
			counter[a-1] ++;
		}
		for (int k = 0; k < counter.length; k++) {
			System.out.println(k + 1 + "의 갯수는 " + counter[k] + "개 입니다");
		}
	}
}
// wed0406@daum.net
