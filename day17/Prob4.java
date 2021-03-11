package com.kosta.day17;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Iterator;

public class Prob4 {

	public static void main(String[] args) {
		Product[] prodList = { new Product("NT450R5E-K24S", 500000, "삼성전자"),
				new Product("15UD340-LX2CK", 400000, "LG전자"), new Product("G2-K3T32AV", 600000, "HP") };
		HashSet product_hs = makeHashSet(prodList, 500000);
		makeFile(product_hs);
		readFile();

	}

	private static HashSet makeHashSet(Product[] prodList, int price) {
		HashSet resultList = new HashSet();
		System.out.println("*특정 금액 이상의 상품 결과 입니다. ********");
		for (Product p : prodList) {
			if (p.getPrice() >= price) {
				resultList.add(p);
				System.out.println(p);
			}
		}
		return resultList;
	}

	private static void makeFile(HashSet resultList) {

		FileOutputStream fo;
		fo = null;
		ObjectOutputStream oo;
		oo = null;
		try {
			fo = new FileOutputStream("data.txt");
			oo = new ObjectOutputStream(fo);
			oo.writeObject(resultList);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fo != null && oo != null)
				try {
					oo.close();
					fo.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
	}

	private static void readFile() {
		String s = "data.txt";

		FileInputStream fi=null;
		ObjectInputStream oi=null;
		try {
			fi = new FileInputStream(s);
			oi = new ObjectInputStream(fi);

			Object o = oi.readObject();
			HashSet hs = (HashSet) o;
			Iterator it = hs.iterator();
			oi.close();
			System.out.println("*readfile 결과 입니다. ********");
			while (it.hasNext()) {
				Object object = (Object) it.next();
				System.out.println(object);
			}

		} catch (IOException e1) {

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

}

class Product implements Serializable {
	private String model_name;
	private int price;
	private String company;

	public Product(String model_name, int price, String company) {
		super();
		this.model_name = model_name;
		this.price = price;
		this.company = company;
	}

	public String getModel_name() {
		return model_name;
	}

	public void setModel_name(String model_name) {
		this.model_name = model_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	@Override
	public String toString() {
		return "Product [model_name=" + model_name + ", price=" + price + ", company=" + company + "]";
	}

}