package controller;

import model.BoardVO;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

import model.BoardDAO;
import model.EmpDAO;
import model.EmpVO;
import view.BoardView;
import view.EmpView;

public class BoradCnotroller {

	public static void main(String[] args) throws SQLException {
		int res = 0;
		BoardDAO boardDAO = new BoardDAO();
		Scanner sc = new Scanner(System.in);
		BoardVO board = null;
		String user = null;
		String pw = null;
		boolean al = true;
		while (al) {
			System.out.println("***********����");
			System.out.println("0. login   1. ��Ϻ���\t 2.��ȣ�� ��ȸ\t 3. �߰��ϱ�\t 4. �����ϱ�\t 5. ����\t 9. �ý��� ����");
			int work = sc.nextInt();

			switch (work) {

			case 0:
				user = sc.next();
				pw = sc.next();
				break;

			case 1:
				BoardView.display(boardDAO.viewBoard());
				break;

			case 2:

				System.out.println("��ȣ�Է�");
				int boardNo = sc.nextInt();
				BoardView.display(boardDAO.selectBoard(boardNo));
				break;

			case 3:
				if (user == null || pw == null) {
					System.out.println("�α����� �ʿ��մϴ�.");
					break;
				}
				board = new BoardVO();
				System.out.print("���� : ");
				board.setBoard_title(sc.next());
				System.out.print("���� : ");
				board.setBoard_contents(sc.next());
				board.setBoard_writer(user);
				board.setBoard_password(pw);
				System.out.print("�̹���");
				board.setBoard_image(sc.next());
				res = boardDAO.insertBoard(board);
				BoardView.display(res > 0 ? "����" : "����");

				break;

			case 4:
				if (user == null || pw == null) {
					System.out.println("�α����� �ʿ��մϴ�.");
					break;
				}
				board = new BoardVO();
				System.out.print("��ȣ?");
				board.setBoard_seq(sc.nextInt());
				System.out.print("���� : ");
				board.setBoard_title(sc.next());
				System.out.print("���� : ");
				board.setBoard_contents(sc.next());
				System.out.print("��й�ȣ : ");
				pw = sc.next();
				board.setBoard_password(pw);
				System.out.print("�̹���");
				board.setBoard_image(sc.next());
				res = boardDAO.insertBoard(board);
				BoardView.display(res > 0 ? "����" : "����");

				break;
			case 5:
				if (user == null || pw == null) {
					System.out.println("�α����� �ʿ��մϴ�.");
					break;
				}
				board = new BoardVO();
				System.out.print("��ȣ? and pw");
				BoardView.display(boardDAO.boardDelete(sc.nextInt(), sc.next()) + "�� ����");
			case 9:
				al = false;
				System.out.println("����");			

				break;
			default:
				break;
			}

		}

		// insert
		/*
		 * String user = "�ۼ���"; String pw = "pw";
		 * 
		 * for (int i = 0; i < 10; i++) { BoardVO board = new BoardVO();
		 * board.setBoard_title("����"+i); board.setBoard_contents("����");
		 * board.setBoard_writer(user); board.setBoard_password(pw);
		 * board.setBoard_image("images/logo" + i + ".png"); int res =
		 * boardDAO.insertBoard(board); BoardView.display(res > 0 ? "����" : "����"); }
		 */

		// show
		// BoardView.display(boardDAO.viewBoard());

		// ����
		// BoardVO board = new BoardVO(1218, "����", "������ ��", "who", null, 0, "0000",
		// "©");
		// BoardView.display(boardDAO.boardUpdate(board) + "�� ����");

		// select
		// BoardView.display(boardDAO.selectBoard(1218));

		// delete
		// BoardView.display(boardDAO.boardDelete(1218, "0000") + "�� ����");

	}
}
