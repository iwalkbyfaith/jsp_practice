/* 실습) Statement 대신, PreparedStatement를 사용해서 delete 하기 */

package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class JDBC_pstmt_delete {

	public static void main(String[] args) {
		// DELETE 구문을 실행하는 코드를 작성해보세요
		// 삭제의 기준은 uid가 일치하는 자료를 삭제합니다.
		
		// 작성 순서
			// 1. 스캐너로 삭제할 회원 uid 입력 받기
			// 2. DB와 자바 연결
			// 3. 쿼리문에 ?을 포함해 작성 후 PreparedStatement 객체 생성
			// 4. 실행
		
		// 접속 정보는 변수로 관리 해주세요
			String dbType = "com.mysql.cj.jdbc.Driver";
			String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
			String dbId = "root";
			String dbPw = "mysql";
			
		try {
			
			Scanner scan = new Scanner(System.in);
			System.out.println("삭제할 아이디를 입력하세요.");
			String uId = scan.nextLine();
			
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			// sql 구문
			String sql = "DELETE FROM userinfo WHERE uid=?";
			
			// 객체 생성(sql 구문이 포함된)
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// 물음표에 자료 넣기
			pstmt.setString(1, uId);
			
			// 실행
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		

	}

}
