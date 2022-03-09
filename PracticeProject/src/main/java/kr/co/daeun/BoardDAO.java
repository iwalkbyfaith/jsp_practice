package kr.co.daeun;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	
	
	private DataSource ds = null;
	private static BoardDAO dao = new BoardDAO();
	
	
	// 생성자
	private BoardDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	// 메서드 getInstance()
	public static BoardDAO getInstance(){
		
		if(dao == null) {
			BoardDAO dao = new BoardDAO();
		}
		
		return dao;	
		
	}
	
	
	// getAllBoardList()
	
	public List<BoardVO> getAllBoardList(){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<BoardVO> boardList = new ArrayList<>();
		
		try {
			
			con = ds.getConnection();
			
			String sql = "SELECT * FROM boardinfo";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int boardNum = rs.getInt("board_num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				Date bDate = rs.getDate("bdate");
				Date mDate = rs.getDate("mdate");
				int hit = rs.getInt("hit");
				
				BoardVO board = new BoardVO(boardNum, title, content, writer, bDate, mDate, hit);
				
				boardList.add(board);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
		
			try {
				con.close();
				pstmt.close();
				rs.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
		return boardList;
		
		
	}
	
	
	// getBoardDetail() 메서드 생성
	public BoardVO getBoardDetail(int board_num) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO boardDetail = null;
		
		
		try {
			
			con = ds.getConnection();
			
			String sql = "SELECT * FROM boardinfo WHERE board_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int boardNum = rs.getInt("board_num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				Date bDate = rs.getDate("bdate");
				Date mDate = rs.getDate("mdate");
				int hit = rs.getInt("hit");
				
				boardDetail = new BoardVO(boardNum, title, content, writer, bDate, mDate, hit);
			}
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();

		}finally {
			try {
				con.close();
				pstmt.close();
				rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return boardDetail;
		
	}
	
	
	
	
	
	

}
