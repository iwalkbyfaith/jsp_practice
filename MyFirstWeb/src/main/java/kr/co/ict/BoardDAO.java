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
	
	public List<BoardVO> getAllBoardList2(){
		
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
	
	
	
	
	// 03.18 페이징 처리를 위해 원래 메서드를 2로 만들고(원본 남겨두기 위해) 새로 만듦
	// 페이징 처리를 위해서 페이지 번호를 추가로 입력 받습니다.
	public List<BoardVO> getAllBoardList(int pageNum){
		
		Connection con= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<BoardVO> boardList = new ArrayList<>();
	
	try {			
		con = ds.getConnection();
		// 쿼리문 내부에서 계산하니까 rs = null로 나와서 새로운 변수를 만들어 미리 계산해서 넣어줌 (이렇게 하니까 됨)
		int limitNum = ((pageNum-1) * 10);
		
		String sql = "SELECT * FROM boardinfo ORDER BY board_num DESC limit ?, 10";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, limitNum);
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
		
		// 메서드 내부에서 메서드 호출할 수 있음
			// 조회수를 올리는 로직을 실행한 다음 글 정보 불러오게 처리
			upHit(board_num);
	
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

			;
			
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
	
	
	
	// 03.18 uphit() 없는 버전
	public BoardVO getBoardDetail2(int board_num){
		
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

			;
			
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
	
	
	
	// 03.10 추가
	// deleteBoard() 메서드를 만들어서 삭제처리가 되게 만들어주시고
	// 서블릿에서 해당 메서드를 호출해 실제로 삭제 버튼을 누르면 DB에서 해당 번호 글이 삭제 되게 해주세요
	
	public void deleteBoard(int boardNum) {
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			
			String sql = "DELETE FROM boardinfo WHERE board_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
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
	
	
	//03.10 추가
	// update 구문
	
	public void updateBoard(String title, String content, int boardNum) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			
			String sql = "UPDATE boardinfo SET title=?, content=?, mdate=now() WHERE board_num = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, boardNum);
			
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
	
	
	
	// 서비스가 아닌 getBoardDetail 실행시 자동으로 같이 실행되도록 처리하겠습니다.
	// 글 제목을 클릭할때마다 조회수를 상승시키는 메서드
	// private으로 한 이유는 외부에서 호출할 수 없게 (내부적으로만 호출할 수 있는 메서드)
		// 문제점) getboarddetial()을 글 조회/ 글 수정할 때 사용함. (내가 질문한거)
		//   해결 방법 1) getboarddetial()를 복붙해서 getboarddetial2()를 만들어서 둘 중 하나만 포함하게 만들고 상황에 따라서 쓰면 됨.
		//   해결 방법 2) uphit()을 퍼블릭으로 바꾸고 두 번 호출하면 됨
	
		private void upHit(int strBId) {
			System.out.println("현재 조회된 글 번호 : " + strBId);
			
			Connection con = null;
			PreparedStatement pstmt = null;
	
			
			// UPDATE문에 맞는 접속 로직을 작성해주세요.
			// 그 다음에 조회수를 1 올려주는 로직을 구현하면 됨.
			try {
				con = ds.getConnection();
				String sql = "UPDATE boardinfo SET hit = (hit+1) WHERE board_num=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, strBId);
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
	
	
	
	
	
	
	
	
}
