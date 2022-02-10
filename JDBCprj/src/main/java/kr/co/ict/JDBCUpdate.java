/* 실습) statement, .executeUpdate()를 사용하여 자바에서 DB로 update하기
 * 
 * 	JDBC 프로그래밍 순서
 * 		1. DB종류 인식
 * 		2. 연결하기(스키마주소, 아이디, 비밀번호)
 *   	3. 쿼리문 발송 준비
 *   	4. 쿼리문 발송 전 콘솔에 찍어서 체크하기(필수 아님)
 *      5. 쿼리문 발송 후 변경내역이 DB에 반영되었는지 체크 
 * 
 * */

package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCUpdate {

	public static void main(String[] args) {
		
		// UPDATE 구문도 처리해보세요
		// UPDATE는 id는 변경하지 않습니다.
		// 어떤 아이디의 pw, name, email을 변경할지 조회하기 위해
		// 먼저 id를 받고, 그 다음 pw, name, email을 받아서
		// UPDATE 구문에서 조건절에 id를 넣어 타겟을 정하고
		// 나머지 항목만 수정되도록 처리해주세요.
		
		
		// 접속용 DB종류, 주소, id, pw를 변수로 관리하기(변수로 안 만들어도 실행 가능함. 권장사항)
			String dbType ="com.mysql.cj.jdbc.Driver";
			String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
			String dbId = "root";
			String dbPw = "mysql";
		
		
		try {
			
			// 4번에서 활용할 변수들을 Scanner로 입력 받기
			Scanner scan = new Scanner(System.in);
			System.out.println("아이디를 입력하세요");
			String id = scan.nextLine();
			
			System.out.println("수정할 비밀번호를 입력하세요");
			String pw = scan.nextLine();
			
			System.out.println("수정할 이름을 입력하세요");
			String name = scan.nextLine();
			
			System.out.println("수정할 이메일을 입력하세요");
			String email = scan.nextLine();
			
			// 1. 사용 DB지정
			Class.forName(dbType);
			
			// 2. JAVA와 DB 연동하기
				// 2번까지 코드를 짜고 실행해봤을때 콘솔에 에러가 뜨면 -> 연결X, 아무것도 안뜨면 ->연결O
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			// 3. 쿼리문 발송 준비
			Statement stmt = con.createStatement();
			
			// 4. 실행 전, 콘솔로 확인
			System.out.println("입력된 쿼리문");
			System.out.println("UPDATE userinfo SET uname ='" + name +"', upw='"+ pw + "', uemail='" + email + "' WHERE uid='" + id + "'");
			
			// 5. 쿼리문 발송
			stmt.executeUpdate("UPDATE userinfo SET uname ='" + name +"', upw='"+ pw + "', uemail='" + email + "' WHERE uid='" + id + "'");
			
			// UPDATE userinfo SET uname ='name', upw='pw', uemail='email' WHERE uid='id';
			// "UPDATE userinfo SET uname ='"+ name +', upw='" + pw + "', uemail='" + email + "' WHERE uid='" + id + "'"
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

}
