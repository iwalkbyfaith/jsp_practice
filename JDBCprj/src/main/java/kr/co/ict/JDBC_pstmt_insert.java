/* 실습) Statement 대신, PreparedStatement를 사용해서 insert 하기 */

package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class JDBC_pstmt_insert {

	public static void main(String[] args) {
		// INSERT 구문을 작성해주세요.
		// 변수로 접속 정보를 관리합니다.
		
		// 키워드 검색 : 도메인주도개발 (연봉 올리려면 나중에 공부해야할)
		
		// 접속 정보
			String dbType = "com.mysql.cj.jdbc.Driver";
			String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
			String dbId = "root";
			String dbPw = "mysql";
		
		try {
			// 0. Scanner로 INSERT에 필요한 정보들 입력 받기
			Scanner scan = new Scanner(System.in);
			
			System.out.println("이름을 입력하세요");
			String name = scan.nextLine();
			
			System.out.println("아이디를 입력하세요");
			String id = scan.nextLine();
			
			System.out.println("비밀번호를 입력하세요");
			String pw = scan.nextLine();
			
			System.out.println("이메일을 입력하세요");
			String email = scan.nextLine();
			
			
			
			// 1. 접속 정보 정의 및 DB 연결하기
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			
			// 2. 쿼리문 생성
			// INSERT INTO 구문의 경우는 VALUES (?, ?, ?, ?) 와 같이
			// 값이 들어갈 자리를 ,(콤마)로 구분하는 부분까지 문자열로 구현해야함.
			String sql = "INSERT INTO userinfo VALUES (?, ?, ?, ?)";
			
			// 3. pstmt 생성 및 ?에 변수 매칭
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, pw);
			pstmt.setString(4, email);
			
			// 4. 실행
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

}
