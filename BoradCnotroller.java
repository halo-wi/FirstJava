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
			System.out.println("***********선택");
			System.out.println("0. login   1. 목록보기\t 2.번호로 조회\t 3. 추가하기\t 4. 수정하기\t 5. 삭제\t 9. 시스템 종료");
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

				System.out.println("번호입력");
				int boardNo = sc.nextInt();
				BoardView.display(boardDAO.selectBoard(boardNo));
				break;

			case 3:
				if (user == null || pw == null) {
					System.out.println("로그인이 필요합니다.");
					break;
				}
				board = new BoardVO();
				System.out.print("제목 : ");
				board.setBoard_title(sc.next());
				System.out.print("내용 : ");
				board.setBoard_contents(sc.next());
				board.setBoard_writer(user);
				board.setBoard_password(pw);
				System.out.print("이미지");
				board.setBoard_image(sc.next());
				res = boardDAO.insertBoard(board);
				BoardView.display(res > 0 ? "성공" : "실패");

				break;

			case 4:
				if (user == null || pw == null) {
					System.out.println("로그인이 필요합니다.");
					break;
				}
				board = new BoardVO();
				System.out.print("번호?");
				board.setBoard_seq(sc.nextInt());
				System.out.print("제목 : ");
				board.setBoard_title(sc.next());
				System.out.print("내용 : ");
				board.setBoard_contents(sc.next());
				System.out.print("비밀번호 : ");
				pw = sc.next();
				board.setBoard_password(pw);
				System.out.print("이미지");
				board.setBoard_image(sc.next());
				res = boardDAO.insertBoard(board);
				BoardView.display(res > 0 ? "성공" : "실패");

				break;
			case 5:
				if (user == null || pw == null) {
					System.out.println("로그인이 필요합니다.");
					break;
				}
				board = new BoardVO();
				System.out.print("번호? and pw");
				BoardView.display(boardDAO.boardDelete(sc.nextInt(), sc.next()) + "건 삭제");
			case 9:
				al = false;
				System.out.println("종료");			

				break;
			default:
				break;
			}

		}

		// insert
		/*
		 * String user = "작성자"; String pw = "pw";
		 * 
		 * for (int i = 0; i < 10; i++) { BoardVO board = new BoardVO();
		 * board.setBoard_title("제목"+i); board.setBoard_contents("내용");
		 * board.setBoard_writer(user); board.setBoard_password(pw);
		 * board.setBoard_image("images/logo" + i + ".png"); int res =
		 * boardDAO.insertBoard(board); BoardView.display(res > 0 ? "성공" : "실패"); }
		 */

		// show
		// BoardView.display(boardDAO.viewBoard());

		// 수정
		// BoardVO board = new BoardVO(1218, "수정", "내용은 무", "who", null, 0, "0000",
		// "짤");
		// BoardView.display(boardDAO.boardUpdate(board) + "건 수정");

		// select
		// BoardView.display(boardDAO.selectBoard(1218));

		// delete
		// BoardView.display(boardDAO.boardDelete(1218, "0000") + "건 삭제");

	}
}
