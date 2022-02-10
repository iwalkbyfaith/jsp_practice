/* 실습) statement, .executeUpdate()를 사용하여 자바에서 DB로 insert하기*/

package kr.co.ict;

import java.sql.*;
import java.util.Scanner;

public class JDBCInsert {

	public static void main(String[] args) {
		// Scanner로 id, pw, name, email을 입력 받아
		// INSERT INTO 구문을 이용해 DB에 데이터를 적재하도록 만들어보겠습니다.
		
		// SELECT Q1처럼 작성해주시되 (입력받기, DB연결, 쿼리문실행 등 ..)
		// SELECT 구문을 제외한 나머지 INSERT, DELETE, UPDATE 구문은 
		// 결과로 받아올 데이터가 없기 때문에 실행했을때 에러가 나지 않는다면 우선 실행된 것으로 볼 수 있고,
		// 실행이 된 다음 워크벤치에서 데이터가 들어갔는지 확인해주시면 됩니다.
		
		// 쿼리문 실행시 SELECT 구문은 excuteQuery(구문);을 호출했지만,
		// SELECT 이외 구문은 executeUadate(구문);을 호출합니다.

		
		try {
			
			Scanner scan = new Scanner(System.in);
			System.out.println("이름을 입력하세요");
			String name = scan.nextLine();
			
			System.out.println("아이디를 입력하세요");
			String id = scan.nextLine();
			
			System.out.println("비밀번호를 입력하세요");
			String password = scan.nextLine();
			
			System.out.println("이메일을 입력하세요");
			String email = scan.nextLine();
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac1", "root","mysql");
			Statement stmt = con.createStatement();
			
			// .executeUpdate를 이용하여 INSERT 구문 넣기.
			// ★★★★★★★선생님은 int rows = <= 없이 그냥 stmt.~ 이렇게 쓰심.★★★★★★★
			// .executeUadate에 마우스를 올려서 설명을 보면 아래와 같다.
			// Executes the given SQL statement, which may be an INSERT, UPDATE, or DELETE statement or anSQL statement that returns nothing
			// 따라서 내용을 받아올 변수가 필요하지 않다.
			int rows = stmt.executeUpdate("INSERT INTO userinfo VALUES ('" + name + "', '"+ id + "', '" + password + "', '" + email + "')");
			// INSERT INTO userinfo VALUES ('name', 'id', 'password', 'email');
			// ("INSERT INTO userinfo VALUES ('" + name + "', '"+ id + "', '" + password + "', '" + email + "')");
				// ResultSet rs = stmt.executeUpdate~ 로 입력하니까 아래와 같이 에러가 뜸
				// type mismatch: cannot convert from int to resultset
				// 왜 int지? 이해가 안되서 구글링 해보니까 .excuteUadate는 숫자를 반환하나봄.
				// 스택 오버플로우 가서 본 답변 : executeUpdate returns the number of rows affected in the query. 
				// 그래서 int로 바꿔주니까 정상적으로 데이터가 삽입되었다.
				// ★ resultset은 워크벤치의 result grid를 조회하기 위해 사용하는 것이므로 사용하지 않는다.
				// SELECT 구문은 반드시 resultset으로 받아줘야 자바 내에서 확인할 수 있음.
				// 워크벤치에서의 경우도 생각해보면 select한 경우만 결과창을 볼 수 있고, insert나 delete는 아니었음.
			
			// 디버깅을 위해 쿼리문 실행전 콘솔에서 조회하기
			// 그리고 sysout을 추가해주면 굳이 워크벤치에 가지 않아도 잘 되었는지 확인할 수 있다.
			// 45번 코드를 만들기 전에 헷갈리면 미리 해보면 됨
			System.out.println("실행 예정 쿼리문");
			System.out.println("INSERT INTO userinfo VALUES ('" + name + "', '"+ id + "', '" + password + "', '" + email + "')");
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
	}

}
