import java.util.*;

public class Skil {
	public int Skil(String skill, String[] skill_trees) {
		int answer = skill_trees.length;
		List<Integer> list = new ArrayList<>();
		List<Integer> o = new ArrayList<>();
		Queue<Character> q = new LinkedList<>();
		int pivot = 0;
		for (int i = 0; i < skill_trees.length; i++) {
			for (int j = 0; j < skill.length(); j++) {
				char a = skill.charAt(j);
				q.add(a);
				list.add(j + 1);
			}
			int n = 0;
			int pollNum = 0;
			while (!q.isEmpty()) {
				Character x = q.poll();
				pollNum++;// 순서스킬 번호
				int count = 0;
				for (int j = 0; j < skill_trees[i].length(); j++) {
					count++;
					if (x.equals(skill_trees[i].charAt(j))) {
						if (count < n) {
							pivot++;
							break;
						}
						o.add(pollNum);// 순서스킬 찍은 순서 저장
						n = count;
					}
				}
				if (pivot != 0) {
					answer--;
					break;
				}
			}
			for (int j = 0; j < o.size(); j++) {
				if (!list.get(j).equals(o.get(j)) && pivot == 0) {
					answer--;
					break;
				}
			}
			o.clear();
			pivot = 0;
			q.clear();
		}
		return answer;
	}
}
