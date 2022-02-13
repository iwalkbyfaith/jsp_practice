/* 실습) Statement 대신, PreparedStatement를 사용해서 update 하기 
 	
 	- .close()와 finally 사용
 
 * */

package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class JDBC_pstmt_update {

	public static void main(String[] args) {
		// UPDATE 구문을 Scanner로 입력받은 자료를 토대로 실행하는 로직을 작성해주세요.
		// 변수로 접속 정보를 관리합니다.
		
		// 접속정보
			String dbType = "com.mysql.cj.jdbc.Driver";
			String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
			String dbId = "root";
			String dbPw = "mysql";
			
			
		try {
			
			Scanner scan = new Scanner(System.in);
			
			System.out.println("수정할 계정의 아이디를 입력하세요.");
			String id = scan.nextLine();
			
			System.out.println("수정할 이름을 입력하세요.");
			String name = scan.nextLine();
			
			System.out.println("수정할 비밀번호를 입력하세요.");
			String pw = scan.nextLine();
			
			System.out.println("수정할 이메일을 입력하세요.");
			String email = scan.nextLine();
			
			
			// DB연결
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			// 쿼리문
			String sql = "UPDATE userinfo SET uname=?, upw=?, uemail=? WHERE uid=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// 물음표 채우기
			pstmt.setString(1, name);
			pstmt.setString(2, pw);
			pstmt.setString(3, email);
			pstmt.setString(4, id);
			
			// 실행
			pstmt.executeUpdate();
			
			//.close()로 열린 자료 닫기 ( ← NEW ! )
			// 일반 자바 코드는 어차피 코드 실행이 끝나면 프로그램이 강제로 종료되지만,
			// 웹서버의 경우는 코드 실행이 끝나도 서버가 계속 돌아가 자원회수를 안 해주면 점점 시스템에 부하가 걸릴 수도 있음.
			// 이를 막기 위해 호출이 끝난 자원은 .close()로 사용해제를 해 줘야 함.
			con.close();
			pstmt.close();
			scan.close(); // 웹에서는 스캐너가 아닌, 폼으로 데이터를 입력 받을 것.
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally { // ( ← NEW ! )
			// 종료 안내 구문
			System.out.println("수정로직 실행 완료");
		}

	}

}
