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
		
		
		// uid가 프라이머리키이기 때문에 하나만 나오거나, 안나오거나 할 것임.

		try {
			
			Scanner scan = new Scanner(System.in);
			System.out.println("아이디를 입력하세요.");
			String id = scan.nextLine();
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac1", 
														 "root",   								 
														 "mysql");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM userinfo WHERE uid='"+ id + "'");
			// "select * from userinfo where uid='" + id119 + "'";
			
			while(rs.next()) {
				System.out.println("이름 : " + rs.getString(1));
				System.out.println("비밀번호 : " + rs.getString(3));
				System.out.println("이메일 : " + rs.getString(4));
			}
			
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
