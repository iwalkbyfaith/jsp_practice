/* DAO(Data Access Object) 클래스

	DAO 클래스는 DB 연동을 전담하여 처리합니다.

	어려워서 이해가 안되면 밑의 코드를 복붙하면 됨(dbUrl에서 주소는 수정해야함)


*/

package kr.co.ict;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
	
	// DB접속에 필요한 변수들을 아래에 선언합니다. (private을 걸어줌)
		private String dbType = "com.mysql.cj.jdbc.Driver";
		private String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
		private String dbId = "root";
		private String dbPw = "mysql";
		
	// 생성자를 이용해 생성할 때 자동으로 Class.forName()을 실행하게 만듭니다.	
		// 어떤 쿼리문을 실행하더라도 공통적으로 활용하는 부분
		public UserDAO() {
			try {
				Class.forName(dbType);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

	// 사용하기 위해 user_list2-1.jsp를 만들어서 코드 로직을 대체해보자
		// user_list2-1.jsp에서 전체 유저 목록을 필요로하기 때문에 실행결과로 'List<UserVO>'를 리턴해줘야합니다.
		// 역시 SELECT 구문을 실행할때에는 리턴자료가 필요하고 (=>List<UserVO)
		// 데이터가 한개만 나오는 경우는 리턴 자료를 UserVO로 넣는다.
		// INSERT, DELETE, UPDATE 구문을 실행할때는 리턴자료가 void입니다.
		// ■■■■■ SELECT * FROM userinfo; ■■■■■
		public List<UserVO> getAllUserList(){
			
			// try블럭 진입 전에 ArrayList 선언
			// Connection, PreparedStatement, ResultSet을 선언합니다.
				Connection con= null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				List<UserVO> userList = new ArrayList<>();
			
			try {
				// 변수에 값 넣기, sql구문, ResultSet에 저장까지
				con = DriverManager.getConnection(dbUrl, dbId, dbPw);
				String sql = "SELECT * FROM userinfo";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				// UserVO ArrayList에 rs에 든 모든 자료를 저장해주세요
				while(rs.next()) {
					String uName = rs.getString("uname");
					String uId = rs.getString("uid");
					String uPw = rs.getString("upw");
					String uEmail = rs.getString("uemail");
					
					UserVO userData = new UserVO(uName, uId, uPw, uEmail);
	
					userList.add(userData);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				// 그냥 작성하면 에러남 => Unhandled exception type SQLException
				// 메인 메서드가 아니라서 처리를 제대로 못해주고 있으니까 try~catch 또 사용
				// close()로 반드시 자원회수 해준다.
				try {
					con.close();
					pstmt.close();
					rs.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			}
			// getAll~에 에러 뜨는거 보기 싫어서 잠깐 만든 코드
			//return null; 
			
			return userList;
		}
		
		
		
		// login_update.jsp의 경우 로그인한 유저 한 명의 데이터만 DB에서 얻어옵니다.
		// 따라서 그 한 명의 유저 데이터만을 이용해 SELECT 구문을 써야합니다.
		// login_update.jsp 상단의 sId 변수에 들어있는 유저명을 이용해 유저 데이터를 얻어옵니다. (return값은 그 유저의 데이터 목록 name, id, ..)
		// ■■■■■ SELECT * FROM userinfo WHERE uid=? ■■■■■
		public UserVO getUserData(String sId) {
			// 접속 로직은 getAllUserList()와 큰 차이가 없고 쿼리문만 좀 다릅니다.
			
			// 1. Connection, PreparedStatement, ResultSet, UserVO 변수 선언만 해주세요
			//    try 지역 외부에서 써야하는 변수들입니다. (= 가장 상위에 선언해줌) 
			String newId = sId;
			Connection con= null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			UserVO user = null;
			
			// 2. try 블럭 내부에서 DB 연결을 해주세요.
			//    필요한 URL, ID, PW는 상단에 멤버 변수로 이미 존재합니다.
			try {
				con = DriverManager.getConnection(dbUrl, dbId, dbPw);
				// 3. 쿼리문을 날려서 rs에 DB에서 가져온 정보를 받아주세요.
				String sql = "SELECT * FROM userinfo WHERE uid =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, newId);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					String uName = rs.getString("uname");
					String uId = rs.getString("uid");
					String uPw = rs.getString("upw");
					String uEmail = rs.getString("uemail");
					// 4. user 변수에 rs에 저장된 데이터를d 담습니다.
					user = new UserVO(uName, uId, uPw, uEmail);
	
				}
			// 5. catch, finally 블럭을 작성해주시고, finally에서 자원회수까지 마쳐주세요.
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				// .close()는 무조건 try 블럭에 있어야 하기 때문에 finally 내부에서 추가로 try블럭 설정
				try {
					con.close();
					pstmt.close();
					rs.close();
				}catch(SQLException se) { // 그냥 Exception e로 해도 됨(지금 단계에서는. 많이 배우면 너무 복잡하니까)
					se.printStackTrace();
				}
			}
			
			
			
			//DB에서 UserVO에 데이터를 받아주신 다음 null 대신 받아온 데이터를 리턴하세요.
			return user;
		}
		
		
		
		// 22.02.19 혼자 INSERT 구문 적용해보기
		public void insertUserDate(String fName, String fId, String fPw, String fEmail) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = DriverManager.getConnection(dbUrl, dbId, dbPw);
				
				String sql = "INSERT INTO userinfo VALUES(?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, fName);
				pstmt.setString(2, fId);
				pstmt.setString(3, fPw);
				pstmt.setString(4, fEmail);
				
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