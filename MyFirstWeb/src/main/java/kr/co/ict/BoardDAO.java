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
			String sql = "SELECT * FROM boardinfo ORDER BY board_num DESC";
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
	
		
	// 03.07추가
	// insertBoard 내부 쿼리문 실행시 필요한 3개의 요소인 글제목, 본문, 글쓴이를 입력해야만 실행할 수 있게 설계
	public void insertBoard(String title, String content, String writer) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			
			con = ds.getConnection();
			
			// insert의 경우 두 가지 유형이 있음
				// 1) 전체 컬럼 요소 다 넣기 = INSERT INTO boardinfo VALUES(null, ?, ?, ?, now(), now(), 0)
					// 사용자가 직접 입력하는 경우만 뚫어주기
				// 2) 일부 요소만 넣기(추천, 이것 사용) = INSERT INTO boardinfo(title, content, writer) VALUES (?, ?, ?) 
			
			String sql = "INSERT INTO boardinfo(title, content, writer) VALUES (?, ?, ?)";
			pstmt = con.prepareStatement(sql);

			// 실행 전 상단 쿼리문의 물음표(?) 채워넣기
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);

			// 실행하기
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				con.close();
				pstmt.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
	
	// 03.08 추가
	// 상세 글 페이지를 보여주는 메서드
	
		// int인데 String으로 해도 문제가 없음(왜냐면 http에서 날아올 때 String으로 바뀌기도 하기 떄문)
	public BoardVO getBoardDetail(int board_num){
		
		Connection con= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO boarddetail = null;
		
		
	
	try {			
		con = ds.getConnection();
		String sql = "SELECT * FROM boardinfo WHERE board_num = ? ";
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
			
			
			boarddetail = new BoardVO(boardNum, title, content, writer, bDate, mDate, hit);

			
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
	
	return boarddetail;
}
	
	
	
	
	
	
	
	
	
	
}
