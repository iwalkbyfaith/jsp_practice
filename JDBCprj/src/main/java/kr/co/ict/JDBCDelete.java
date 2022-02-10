/* 실습) statement, .executeUpdate()를 사용하여 자바에서 DB로 delete하기*/


package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCDelete {

	public static void main(String[] args) {
		// 사용자가 스캐너로 아이디를 입력하면
		// 해당 아이디 정보가 DB에서 삭제되도록 로직을 작성해보세요
		// 역시 .executeUpdate("실행문");으로 실행됩니다.
		// 제가 Insert에서 시범 보여드렸듯 실행 전에 콘솔을 이용해서
		// 쿼리문이 제대로 작성되었는지 확인할 수 있도록 보여주는 코드도 같이 작성해주세요.
		
		// 접속용 DB종류, 주소, id, pw는 변수로 관리해도 됩니다.
			String dbType ="com.mysql.cj.jdbc.Driver";
			String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
			String dbId = "root";
			String dbPw = "mysql";
		
		
		try {
			
			Scanner scan = new Scanner(System.in);
			System.out.println("삭제할 아이디를 입력하세요");
			String id = scan.nextLine();
			
			// DB종류 지정
			Class.forName(dbType);
			// DB서버와 자바간 연결
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			// 쿼리문 발송 준비
			Statement stmt = con.createStatement();
			
			// 콘솔에서 조회하기
			// DELETE FROM userinfo WHERE uid='id';
			System.out.println("쿼리문은 이렇게 입력됩니다.");
			System.out.println("DELETE FROM userinfo WHERE uid='" + id + "'");
			
			
			
//			// 삭제 전/후 데이터 가져오는 것은 그냥 내가 만든것
//			// 삭제 전 데이터
//			System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
//			System.out.println("삭제 전 데이터");
//			System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
//			ResultSet rs = stmt.executeQuery("SELECT * FROM userinfo");
//			while(rs.next()) {
//				System.out.println("이름 : " + rs.getString("uname"));
//				System.out.println("아이디 : " + rs.getString(2));
//				System.out.println("비밀번호 : " + rs.getString(3));
//				System.out.println("이메일 : " + rs.getString("uemail"));
//				System.out.println("================");
//			}
//			
			
			
			// 쿼리문 넣기.
			stmt.executeUpdate("DELETE FROM userinfo WHERE uid='" + id + "'");
			
			
//			// 삭제 후 데이터
//			System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
//			System.out.println("삭제 후 데이터");
//			System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
//			rs = stmt.executeQuery("SELECT * FROM userinfo");
//			while(rs.next()) {
//				System.out.println("이름 : " + rs.getString("uname"));
//				System.out.println("아이디 : " + rs.getString(2));
//				System.out.println("비밀번호 : " + rs.getString(3));
//				System.out.println("이메일 : " + rs.getString("uemail"));
//				System.out.println("================");
//			}
			
			
			scan.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
