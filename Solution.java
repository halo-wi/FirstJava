class Solution {
	public String solution(int[] numbers, String hand) {

		String rHand = "right";
		String lHand = "left";
		String answer = "";
		int leftLocation = 10;
		int rightLocation = 12;

		for (int i : numbers) {
			if (i == 1 || i == 4 || i == 7) {
				answer += "L";
				leftLocation = i;
			} else if (i == 3 || i == 6 || i == 9) {
				answer += "R";
				rightLocation = i;
			} else {
				int l = distinct(i, leftLocation);
				int r = distinct(i, rightLocation);
				if (l - r > 0 || (l - r == 0 && hand.equals(rHand))) {
					answer += "R";
					rightLocation = i;
				} else {
					answer += "L";
					leftLocation = i;
				}

			}

		}
		return answer;

	}

	private int distinct(int i, int handLocation) {
		if (i == handLocation)
			return 0;

		switch (i) {
		case 2:
			if (handLocation == 1 || handLocation == 3 || handLocation == 5)
				return 1;
			if (handLocation == 7 || handLocation == 9 || handLocation == 0)
				return 3;
			if (handLocation == 10 || handLocation == 12)
				return 4;
			else
				return 2;

		case 5:
			if (handLocation == 2 || handLocation == 4 || handLocation == 6 || handLocation == 8)
				return 1;
			if (handLocation == 10 || handLocation == 12)
				return 3;
			else
				return 2;

		case 8:
			if (handLocation == 5 || handLocation == 7 || handLocation == 9 || handLocation == 0)
				return 1;
			if (handLocation == 1 || handLocation == 3)
				return 3;
			else
				return 2;

		case 0:
			if (handLocation == 12 || handLocation == 10 || handLocation == 8)
				return 1;
			if (handLocation == 2 || handLocation == 4 || handLocation == 6)
				return 3;
			if (handLocation == 1 || handLocation == 3)
				return 4;
			else
				return 2;
		}

		return 0;
	}
}
