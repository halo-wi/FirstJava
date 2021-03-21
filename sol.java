import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class sol {

	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String input = br.readLine();
		int a = 0;
		String s = "";
		int n = Integer.parseInt(input);
		String[] arr = new String[n];
		int[][] x = new int[n][6];
		int count = 0;
		for (int i = 0; i < n; i++) {
			arr[i] = br.readLine();
			arr[i] += ":";
		}

		for (int i = 0; i < n; i++) {
			count = 0;
			for (int j = 0; j < 14; j++) {
				char b = arr[i].charAt(j);

				if (b == ' ' || b == ':' || b == '~') {
					a = Integer.parseInt(s);
					s = "";
					b = '0';
					x[i][count] = a;
					count++;
				}
				s += b;
			}
		}
		double startT = 0;
		double endT = 24;
		int p =0;
		int f =0;		
		for (int i = 0; i < n; i++) {
			
			if (startT <= x[i][0] + (x[i][1] * 0.01)) {
				p=i;
				startT = x[p][0] + (x[p][1] * 0.01);
			}
			
			

			if (endT >= x[i][4] + (x[i][5] * 0.01)) {
				f=i;
				endT = x[f][4] + (x[f][5] * 0.01);
			}
		}
		if (startT > endT) {
			System.out.println(-1);
		}

		else {
			int sol1 = x[p][0];
			int sol2 = x[p][1];
			int sol3 = x[f][4];
			int sol4 = x[f][5];

			String sM = Integer.toString(sol2);
			String eM = Integer.toString(sol4);
			if (sol2 < 10)
				sM = "0" + sol2;
			if (sol4 < 10)
				eM = "0" + sol4;
			System.out.println(sol1 + ":" + sM + " ~ " + sol3 + ":" + eM);
		}
	}
}
