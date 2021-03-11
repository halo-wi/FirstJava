package com.kosta.day17;

public class Prob2 {

	public static void main(String[] args) {
		System.out.println(leftPad("Samsung", 10, '#'));
		System.out.println(leftPad("SDS", 5, '*'));
		System.out.println(leftPad("Multicampus", 5, '@'));

	}

	public static String leftPad(String str, int size, char fillChar) {
		try {
			if (str.length() > size)
				throw new IllegalSizeException();
		} catch (IllegalSizeException e) {
			return "문자열의 길이가 size보다 큽니다.";
		}
		String s = "";

		for (int i = 0; i < size - (str.length()); i++) {
			s += fillChar;
		}

		return s + str;
	}

}

class IllegalSizeException extends RuntimeException {
	public IllegalSizeException() {
	}
}
