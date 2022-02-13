/* 실습) Statement 대신, PreparedStatement를 사용해서 select 하기

 		- 유지/보수 측면에서 preparedstatement가 더 좋음
 * */

package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class JDBC_pstmt_select {
	public static void main(String[] args) {
		// DB지정, 연결까지 직접 해보세요.
		// DB종류, 스키마주소, 계정명, 비번은 변수로 관리합니다.
		
		// 변수로 관리
			String dbType = "com.mysql.cj.jdbc.Driver";
			String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
			String dbId = "root";
			String dbPw = "mysql";
		
		try {
			// 0. 사용자에게 조회할 아이디 입력 받기
			Scanner scan = new Scanner(System.in);
			System.out.println("조회하고 싶은 아이디를 입력해주세요");
			String id = scan.nextLine();
			
			// 1. DB 종류 지정
			Class.forName(dbType);
			
			// 2. DB연결
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			// 3. PreparedStatement 구문은 순서가 다름(반대)
				// 3-1 먼저 SQL 쿼리문을 만들어 놓고 적용합니다.
				// 중간에 사용자 입력 정보를 받는 부분을 전부 ?로만 치환해서 처리합니다.
				// 두 개 이상인 경우에도 사용할 수 있습니다.
				String sql = "SELECT * FROM userinfo WHERE uid=?";
					// (해석) uid를 넣는 부분이 아직 확정이 안 되어있다
				
				// 3-2 pstmt 변수를 만들어 세팅합니다.
				// 왼쪽은 prepare'd'이고 오른쪽은 그냥 prepare임을 주의!
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				// 3-3 ?(물음표)에 들어갈 자료를 정의해줍니다.
				pstmt.setString(1, id); 
					// (해석) 1번(물음표중의 첫 번째)의 ?(물음표) 자리에 id를 넣어주겠다는 의미
					// setString으로 하는 경우는 자동으로 '' 따옴표를 붙여줌
					// setInt 같은 경우는 안 붙이겠지?
			
			// 4. 쿼리문 실행 (SELECT 구문의 결과는 ResultSet으로 받는다)
				ResultSet rs = pstmt.executeQuery();
				// ()괄호의 안에 아무것도 넣지 않아도 됨. 위에서 구문을 다 처리했기 때문에
			
				if(rs.next()) {
					System.out.println(rs.getString(1));
					System.out.println(rs.getString(2));
					System.out.println(rs.getString(3));
					System.out.println(rs.getString(4));
				}
				
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
