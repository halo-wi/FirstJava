package com.kosta.day17;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class FileController {

	private static String outputFileName;
	private static String inputFileName;
	
	
	public static void main(String[] args) throws Exception {

		
		
		
		
	
		System.out.println(inputFileName);
		
		reverseLine(inputFileName, outputFileName);
		

	}

	static void reverseLine(String inputFileName, String outputFileName) throws Exception{
		
		ArrayList arr = new ArrayList();
		String s = "";
		FileReader fr = null;
		BufferedReader br =  null;
		
		fr = new FileReader("asd.txt");
		br = new BufferedReader(fr);
		
		while ((s = br.readLine())!=null)
		{
			arr = (ArrayList) s.lines();
		}
		
		System.out.println(arr);
		
		
		
		}
		

}
