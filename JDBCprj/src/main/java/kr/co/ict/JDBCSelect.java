/* 자바 파일을 DB와 연결하기 

 데이터베이스와 JAVA의 연결 순서

	1. JDBC 드라이버 로드.
	2. 데이터베이스 Connection 객체 생성.
	3. 쿼리문 실행을 위한 Statement 객체 생성.
	4. 쿼리문을 실행.
	5. ResultSet 객체를 통해 쿼리문 실행 결과값을 소비.
	6. Statement 객체 종료.
	7. 데이터베이스 Connection 객체 종료.

 
*/

package kr.co.ict;

// SQL 관련된 요소는 java.sql.*을 임포트하면 대부분이 다 로드됩니다.
import java.sql.*;

public class JDBCSelect {
	public static void main(String[] args) {
		
	// JDBC 연결 여부 확인
		// 무조건 try 구문 안에 넣어야함.(아니면 에러남)
		// Unhandled exception type ClassNotFoundException => 예외처리를 안했다는 뜻
		
		try {
			// MySQL을 연동할것임을 알리기 위해 forName 내부에 MYSQL용 연동 구문을 적습니다.
			// SQL 연동은 try~catch블럭 내부에 넣도록 강제됨.
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// 커넥션 객체는 연결 여부를 확인합니다.
			// 입력요소는 접속주소, mysql계정명, mysql비밀번호 순으로 입력합니다.
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac1", // 접속url
														 "root",   								  // mysql 아이디
														 "mysql");								  // mysql 비밀번호
			// 오류가 있다면 콘솔창에 에러가 뜨고, 없다면 아무것도 안 뜸
			// 값이 제대로 들어간게 맞는지 확인하기 위해 비밀번호를 바꿔보고 콘솔 실행해보기
		
			
			
			
			// 쿼리문을 연결된 mysql에 날려주기 위해, 쿼리문을 준비합니다.
			// 쿼리문은 Statement 라는 변수에 저장해 날려줍니다.
				Statement stmt = con.createStatement();
			
			// .executeQuery() 내부에 실행할 쿼리문을 매개 변수로 작성합니다.
			// ★ 변수명.executeQuery("실행할 쿼리문"); => SELECT 구문일때 사용
			// ★ 변수명.executeUpdate()는 SELECT 이외의 구문, INSERT와 DELETE, UPDATE를 실행할 때 씁니다.
			// SELECT문을 실행한 결과 자료는 ResultSet이라는 자료로 받을 수 있습니다.
				ResultSet rs = stmt.executeQuery("SELECT * FROM userinfo");
			
				// 없는 테이블 이름을 쓰면? => java.sql.SQLSyntaxErrorException: Table 'jdbcprac1.userinfo1213' doesn't exist
				// 문법을 틀리면?        => java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax;
			
			// ResultSet은 기본적으로 row 개수만큼 내부에 데이터를 저장합니다.
			// ResultSet은 특정 번호를 집어서 조회하는 경우보다는 순차적으로 조회해서 쓰는 경우가 많습니다.
			// rs라는 변수에는 0,1,2,3의 공간에 데이터가 쌓임 (0번에 uname:값, uid:값, upw:값, uemail:값 ...)
			// 맨 처음 ResultSet은 -1번이라는 임시 번호를 타겟으로 잡습니다. (-1이라는 자료가 있다는 것은 아님.)
			// 이 번호를 옮기기 위해 .next()를 호출하면 다음 번호로 넘어갑니다.
				// 실행이 되면 -1번에서 0번으로 넘어가는 것.
				// .next()을 사용하지 않으면 에러 뜸. => java.sql.SQLException: Before start of result set
				// ★★ 또한 bool 자료형이기 때문에 다음 번호가 조회되면 true, 없으면 false
//					rs.next(); 
//				
//				// mysql의 내부에 저장되어 있던 데이터를 자바 내부로 끌고 들어온 것을 확인할 수 있음.
//					// 괄호 안의 번호는 컬럼 넘버
//					// get자료형(인덱스번호<-1부터 시작) or get자료형(컬럼명)을 쓰면 해당 컬럼의 자료를 반환합니다.
//					// 전부 varchar 자료였기 때문에 getString, int자료형이라면 getInt겠지? .. getDouble..
//						System.out.println(rs.getString(1)); // System.out.println(rs.getString(uname)); 이렇게도 가능하다는 것.
//						System.out.println(rs.getString(2));
//						System.out.println(rs.getString(3));
//						System.out.println(rs.getString(4));
				
				// (문제) while문을 이용해서 select 구문의 전체 결과를 콘솔에 찍어주세요
				// 1, 4번 컬럼은 컬럼명으로 출력, 2,3번 컬럼은 인덱스로 출력
					while(rs.next()) {
						System.out.println("이름 : " + rs.getString("uname"));
						System.out.println("아이디 : " + rs.getString(2));
						System.out.println("비밀번호 : " + rs.getString(3));
						System.out.println("이메일 : " + rs.getString("uemail"));
						System.out.println("================");
					}
					// Q) 궁금증. while문 안에 rs.next()를 입력하지 않았는데도 출력이 다 되는데,
					//    조건식 안에 들어있는 것만으로도 다음으로 넘겨주는 효과가 나는 것인지? A) 조건문 내부에서 실행함
					//    (선생님이 그림 그려서 설명해준다고 하심)
					
					// rs.next()는 boolean 자료형이다.
					// rs.next()의 역할은 호출이 되면 먼저 다음 번호로 포인터(↑)를 이동하는 것.
					// 넘어갔을때 자료가 있다면 true를 반환하고 sysout 해줌
					// 마지막으로 포인터가 4번으로 이동하면 rs.next()는 false가 되고, while문을 탈출한다.
				
			
		} catch(Exception e) {
			e.printStackTrace();
		}

	}
}