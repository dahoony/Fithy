package fithy.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fithy.project.dto.Board;
import fithy.project.util.DBUtil;

public class BoardDAO {

	// 싱글턴 패턴 --------------------------------
	private static BoardDAO dao = new BoardDAO();
	
	private BoardDAO() {}
	
	public static BoardDAO getInstance() {
		return dao;
	}
	// --------------------------------------------
	

	// 게시물 리스트-----------------------------------
	public ArrayList<Board> boardSelectAll() {
		System.out.println("BoardDAO selectAll()");
		
		Connection con = null;
		con = DBUtil.getConnect();
		
		PreparedStatement pState = null;
		ResultSet rs = null;
		
		ArrayList<Board> boardArray = new ArrayList<>();
		
		String sql = "select b_num,b_title,u_id,b_date from board, personal_user where board.u_code = personal_user.u_code order by b_num asc";
		
		try {
			pState = con.prepareStatement(sql);			
			rs = pState.executeQuery();
			
			while(rs.next()) {
				boardArray.add(new Board(rs.getString("b_num"),rs.getString("b_title"),rs.getString("u_id"),rs.getDate("b_date")));
			}
			return boardArray;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
			
		} finally {
			DBUtil.close(con, pState, rs);
		}
	}

	
	// 게시물 쓰기-----------------------------------
	public int boardInsert(String uCode, String bTitle, String bContent) {
		System.out.println("BoardDAO boardInsert()");
		
		Connection con = null;
		con = DBUtil.getConnect();
		
		PreparedStatement pState = null;
		
		String sql = "insert into board values('B'||lpad(b_num_seq.nextval,5,'0'),?,?,?,default)";
		
		try {
			pState = con.prepareStatement(sql);
			
			pState.setString(1, uCode);
			pState.setString(2, bTitle);
			pState.setString(3, bContent);
			
			int result = pState.executeUpdate();
			System.out.println(result);
			return result;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		
		} finally {
			DBUtil.close(con, pState);
		}
	}
	
//	// 게시물 번호 업데이트-----------------------------------
//	public int updateReadCount(String count) {
//		System.out.println("updateReadCount()");
//		
//		Connection con = null;
//		con = DBUtil.getConnect();
//		PreparedStatement pState = null;
//		
//		String sql = "update board set b_readcount=b_readcount+1 where b_num = ?";
//		
//		try {
//			pState = con.prepareStatement(sql);
//			pState.setString(1, count);
//			
//			int result = pState.executeUpdate();
//			return result;
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return 0;
//			
//		} finally {
//			DBUtil.close(con, pState);
//		}
//	}

	
	// 게시글 상세보기(게시물 번호로 조회)-----------------------------------
	public Board boardDetail(String b_num) {
		System.out.println("BoardDAO boardDetail()");
		
		Connection con = null;
		con = DBUtil.getConnect();
		
		PreparedStatement pState = null;
		ResultSet rs = null;
		
		Board board = null;
		
		System.out.println("boardDetail : " + b_num);
		String sql = "select * from board where b_num = ?";
		
		try {
			pState = con.prepareStatement(sql);
			pState.setString(1, b_num);
			
			rs = pState.executeQuery();
			
			while(rs.next()) {
				board = new Board(rs.getString("b_num"),rs.getString("b_title"),rs.getString("b_content"),
						rs.getString("u_id"),rs.getDate("b_date"));
			}
			return board;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
			
		} finally {
			DBUtil.close(con, pState, rs);
		}
	}



	// 게시물 삭제-----------------------------------	
	public int boardDelete(String bNum) {
		System.out.println("BoardDAO boardDelete()");
		
		Connection con = null;
		con = DBUtil.getConnect();
		
		PreparedStatement pState = null;
		
		String sql = "delete board where b_num = ?";
		
		try {
			pState = con.prepareStatement(sql);
			
			pState.setString(1, bNum);
			
			int result = pState.executeUpdate();
			return result;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			DBUtil.close(con, pState);
			return 0;
		
		} finally {
			DBUtil.close(con, pState);
		}
	}
	
	

	// 게시물 수정-----------------------------------	
	public int boardUpdate(String usCode, String boardTitle, String boardContent) {
		System.out.println("BoardDAO boardUpdate()");
		
		Connection con = null;
		con = DBUtil.getConnect();
		
		PreparedStatement pState = null;
		
		String sql = "update board set b_title=?, b_content=? where b_num=?)";
		
		try {
			pState = con.prepareStatement(sql);
			
			pState.setString(1, usCode);
			pState.setString(2, boardTitle);
			pState.setString(3, boardContent);
			
			int result = pState.executeUpdate();
			return result;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;

		} finally {
			DBUtil.close(con, pState);
		}
	}
	
}
