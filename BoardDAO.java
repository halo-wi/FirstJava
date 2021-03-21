package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import utill.DBUtill;
import view.BoardView;

//DAO (Data Access Object)
public class BoardDAO {
	// CRUD( create:insert, read:select, update, delete )

	public int insertBoard(BoardVO bo) throws SQLException {

		int res = 0;
		String sql = "insert into Board values(board_num.nextval, ?, ?, ?, sysdate, 0, ?, ?)";

		Connection conn = DBUtill.getConnection();
		PreparedStatement ps = null;

		ps = conn.prepareStatement(sql);
		ps.setString(1, bo.getBoard_title());
		ps.setString(2, bo.getBoard_contents());
		ps.setString(3, bo.getBoard_writer());
		ps.setString(4, bo.getBoard_password());
		ps.setString(5, bo.getBoard_image());

		res = ps.executeUpdate();

		DBUtill.dbClose(null, ps, conn);

		return res;

	}

	public List<BoardVO> viewBoard() throws SQLException {

		List<BoardVO> res = new ArrayList<BoardVO>();
		BoardVO bo = new BoardVO();
		Statement st = null;
		ResultSet rs = null;

		String sql = "select * from Board";

		Connection conn = DBUtill.getConnection();
		st = conn.createStatement();
		rs = st.executeQuery(sql);
		while (rs.next()) {
			bo = makeboard(rs);
			res.add(bo);
		}

		DBUtill.dbClose(rs, st, conn);

		return res;
	}

	private BoardVO makeboard(ResultSet rs) throws SQLException {
		// resultset에서 읽어서 vo 객체를 만듬
		BoardVO bo = new BoardVO();
		bo.setBoard_contents(rs.getString("Board_contents"));
		bo.setBoard_date(rs.getDate("Board_date"));
		bo.setBoard_password(rs.getString("Board_password"));
		bo.setBoard_seq(rs.getInt("Board_seq"));
		bo.setBoard_title(rs.getString("Board_title"));
		bo.setBoard_viewcount(rs.getInt("Board_viewcount"));
		bo.setBoard_writer(rs.getString("Board_writer"));
		bo.setBoard_image(rs.getString("Board_image"));

		return bo;
	}

	public BoardVO selectBoard(int boardNO) throws SQLException {

		BoardVO bo = new BoardVO();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select * from Board where board_seq = ?";
		String sql2 = "update board set board_viewcount = board_viewcount + 1 where board_seq = ?";

		Connection conn = DBUtill.getConnection();
		ps = conn.prepareStatement(sql);
		ps.setInt(1, boardNO);
		rs = ps.executeQuery();
		while (rs.next()) {
			bo = makeboard(rs);
			ps = conn.prepareStatement(sql2);
			ps.setInt(1, boardNO);
			int res = ps.executeUpdate();
			BoardView.display(res > 0 ? "조회수 성공" : "조회수 실패");
		}

		DBUtill.dbClose(rs, ps, conn);

		return bo;

	}

	public int boardUpdate(BoardVO board) throws SQLException {
		BoardVO bo = new BoardVO();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int res = 0;

		String sql = "update board "
				+ " set board_title = ?, board_contents = ?, board_date = sysdate, board_password = ?, board_image = ?"
				+ " where board_seq=?";
		Connection conn = DBUtill.getConnection();
		ps = conn.prepareStatement(sql);
		ps.setString(1, board.getBoard_title());
		ps.setString(2, board.getBoard_contents());
		ps.setString(3, board.getBoard_password());
		ps.setString(4, board.getBoard_image());
		ps.setInt(5, board.getBoard_seq());
		res=ps.executeUpdate();
		DBUtill.dbClose(rs, ps, conn);
		return res;	

	}

	public int boardDelete(int boardNo, String pw) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		int res = 0;
		
		BoardVO board = selectBoard(boardNo);
		
		String sql = "delete from board where board_seq = ? and board_password = ?";
		Connection conn = DBUtill.getConnection();
		
		
		ps = conn.prepareStatement(sql);
		ps.setInt(1, boardNo);
		ps.setString(2, pw);
		
		res=ps.executeUpdate();
		DBUtill.dbClose(rs, ps, conn);
		return res;	

	}
	
	
}