package com.kosta.day10;

public class Prob1 {

	public static void main(String[] args) {
		String x = "everyday we have is one more than we deserve";
		System.out.println("암호화할 문자열" + x);
		char[] y = new char[x.length()];
		System.out.print("암호화된 문자열");
		for (int i = 0; i <= x.length() - 1; i++) {
			char pw = x.charAt(i);
			y[i] = pw;
			char c = (char) (y[i] + 3);
			if (c >= 123) {
				c = (char) (c - 26);
			}
			if (c == '#') {
				c = ' ';
			}
			System.out.print(c);
		}
	}
}
