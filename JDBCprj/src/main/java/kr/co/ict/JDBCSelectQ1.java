/* 실습) 데이터베이스와 java 연결

	
	* 데이터베이스와 JAVA의 연결 순서
	
	1. JDBC 드라이버 로드.
	2. 데이터베이스 Connection 객체 생성.
	3. 쿼리문 실행을 위한 Statement 객체 생성.
	4. 쿼리문을 실행.
	5. ResultSet 객체를 통해 쿼리문 실행 결과값을 소비.
	6. Statement 객체 종료.
	7. 데이터베이스 Connection 객체 종료.

 
 */





package kr.co.ict;

import java.sql.*;
import java.sql.DriverManager;
import java.util.Scanner;

public class JDBCSelectQ1 {

	public static void main(String[] args) {
		// Scanner를 이용해 uid를 입력 받은 다음
		// 방금한 SELECT 구문을 응용해서
		// WHERE uid = 입력 받은 아이디
		// 형식으로 내가 조회한 아이디의 정보만 콘솔에 찍히도록 로직을 작성해주세요.
		
		// WHERE uid = '아이디명'이므로 (홑따옴표임을 주의)
		// 아이디명 앞 뒤로 작은 따옴표가 들어갈 수 있도록
		// 전달 쿼리문을 신경써서 작성해주세요.
		// 힌트 : uid='" + 변수명 + "'" 
		// (X) "~uid=" + id; (<= 이렇게 하면 개발자가 편하겠지만, 사용자가 홑따옴표를 같이 적어주기를 기대하지 말고 개발자가 미리 짜놔야함)
		
		
		
		// uid가 프라이머리키이기 때문에 하나만 나오거나, 안나오거나 할 것임.

		// Q) where절로 id를 쓰는 이유는? 
		// A) Primary key이기 때문
			// PK는 1)중복이 불가하고 2) 모든 계정이 다 소유하는 키이다.
		
		try {
			
			Scanner scan = new Scanner(System.in);
			System.out.println("아이디를 입력하세요.");
			String id = scan.nextLine();
			
			// 1.
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 2.
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac1", 
														 "root",   								 
														 "mysql");
			// 3.
			Statement stmt = con.createStatement();
			
			
			// 4.
			// 이거 올릴때 데이터가 네모에 들어가는거 그려서 올리자
			// 헷갈렸던 점.
			// Q) rs.next()는 바로 다음 숫자로 가는 것인데 id를 칠때마다 나온다면 -1에서 1, 3 이런 식으로 가는 것인가?
			// A) 노노. where로 데이터를 가져오면 특정한 '한 개'의 row만 가져온다. (아까처럼 row가 4개가 생기는 것이 아님<-헷갈렸던 이유)
			//    그림으로 표현한다면 사각형 한개만 있고, 그 사각형에 uname, uid, upw, uemail이 존재하는 것.
			//    그럼 그 row가 0번이 될 것이고 rs.next()를 했을때 -1번에서 0번으로 이동하니까 데이터가 나오는 것임.
			ResultSet rs = stmt.executeQuery("SELECT * FROM userinfo WHERE uid='"+ id + "'");
			// "select * from userinfo where uid='" + id119 + "'";
			
			// 5.
			// 하나만 받아오려면 while 아니고 if써도 됨. 오히려 if가 더 정확하겠지
			if(rs.next()) {
				System.out.println("이름 : " + rs.getString(1));
				System.out.println("비밀번호 : " + rs.getString(3));
				System.out.println("이메일 : " + rs.getString(4));
			}
			
			
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
