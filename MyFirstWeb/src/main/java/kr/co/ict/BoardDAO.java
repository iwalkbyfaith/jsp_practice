package kr.co.ict;

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

	// DAO 코드 재활용하기
		// 1. UserDAO에서 주석 처리가 안 된 부분만 getInstance() 메서드까지 가져옴
		// 2. ~~~DAO로 되어 있는 부분을 전부 현재 DAO 클래스 명으로 변경
			// 2-1) UserDAO -> BoardDAO
	
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
	public static BoardDAO getInstance() {
		if(dao == null) {
			dao = new BoardDAO();
		}
		return dao;
	}
	
	
	
	// getAllBoardList() 만들기 (다른 코드 복붙해서 수정하기)
		// 게시판 글 전체 목록 가져오기 (회원 전체 목록 가져오기를 이용하여 수정)
	
	public List<BoardVO> getAllBoardList(){
		
			Connection con= null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			List<BoardVO> boardList = new ArrayList<>();
		
		try {			
			con = ds.getConnection();
			String sql = "SELECT * FROM boardinfo";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// BoardVO ArrayList에 rs에 든 모든 자료를 저장해주세요
			while(rs.next()) {
				int boardNum = rs.getInt("board_num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				Date bDate = rs.getDate("bdate");
				Date mDate = rs.getDate("mdate");
				int hit = rs.getInt("hit");
				
				
				BoardVO boardData = new BoardVO(boardNum, title, content, writer, bDate, mDate, hit);

				boardList.add(boardData);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			
			try {
				con.close();
				pstmt.close();
				rs.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
		
		return boardList;
	}
	
	
	
	
	
	
	
	
}
