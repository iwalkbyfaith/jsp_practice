<!-- 전체 유저 목록 가져오기 (VO 없이)

	
	동영상 : 3:07~ 3:19
	
		검색 키워드 : xss 스크립트 공격
			아이디에 꺽쇠를 같이 넣으면 태그로 인식. <a href="#" ~ >을 넣었을시
			
			대응 방안
				방안 1. <> 꺽쇠를 그대로 보내는 것이 아니라 &lt; &gt; 로 바꿔서 보냄
				방안 2. (공격 방어)정규 표현식
					특수문자가 들어오면 제출이 되지 않도록
		
		검색 키워드 : sql 인젝션
			쿼리문을 적을 수 있는 폼 태그에 공격구문을 적어서 보내는 공격
			쿼리문이 공격 구문을 그대로 실행한다.
		
		검색 키워드 : csrf 공격
		
		얘네들은 전부다 스프링 시큐리티를 사용하면 막아진다.
		나중에 보안, 방어하는 방법을 스프링 할 때 가르쳐준다고 하심.
	
 -->


<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	
	// 1. DB 접속 변수 생성
	String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	
	// java.sql 관련 변수들도 앞으로 위에서 미리 선언을 한다.
		Connection con =null;
		PreparedStatement pstmt = null;
		// 다른 스크립트릿에서도 같은 변수를 사용하기 위해서 try지역 밖에다 변수를 선언해줌
		ResultSet rs = null;
	
	try{
		// 2. 연결
		Class.forName(dbType);
		con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		// 3. SELECT * FROM userinfo 실행 및 ResultSet에 저장
		String sql = "SELECT * FROM userinfo";
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		/* 이 코드를 주석처리 하지 않으면 밑의 rs.next()에서 에러가남.
		
		// 4. ResultSet에 저장된 요소들 콘솔에 찍어주기
		while(rs.next()){
			out.println("이름 : " + rs.getString("uname") + "<br/>");
			out.println("아이디 : " + rs.getString("uid") + "<br/>");
			out.println("비밀번호 : " + rs.getString("upw") + "<br/>");
			out.println("이메일 : " + rs.getString("uemail") + "<br/>");
			out.println("=================================" + "<br/>");
		}
		*/
		
		// 여기서 con.close(); 코드를 적으면 에러남
		// 그래서 이제부터는 선언을 try 구문 밖에서 해야함.
		// .close()로 자원 회수 하는 것을 try 내부에 작성시
		// 평상시에는 상관 없지만, 코드가 중간에 에러가 났을때 catch로 넘어가버리면 회수를 못할 수도 있음.
		// 그래서 finally 내부에 넣어주어야 한다.
			// con.close();
			// rs.close();
			// pstmt.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		// finally는 try와 블럭(지역)이 다르기 때문에
		// try 진입 전에 미리 선언해둬야 아래와 같이 .close()구문을 적어둘 수 있습니다.
			//con.close();
			//pstmt.close();
			//rs.close();
				
		// 근데 이렇게 한다고 해도 문제가 있음
		// Q) 왜? 
		// A) 코드는 위에서부터 아래로 내려오기 때문에 지금 여기서 코드를 닫아버리고 밑의 코드에서 조회하려고 하면 안되는 것.
		//    즉, rs.next()가 rs.close()를 한 이후에 배치되어 있기 때문에 에러가 발생하는 것이다.
		// 그렇다고 .close()를 안해주면 자원이 계속해서 낭비가 된다.
		// (해결) user_list2.jsp
	}
	
	
%>

<%!
	// 밑에서 새로운 스크립트릿을 사용하니까 서로 다른 메서드(?)에서 변수 만든 상태가 되어서 선언자에다가 따로 만들어주었음
	// 선생님은 try 들어가기 전에 선언하심. <= 21번 코드에
	// 둘 다 기능상 문제 없이 작동함
		//ResultSet rs;	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 테이블 태그를 생성해주세요. 테이블은 위에 유저이름, 유저 아이디, 유저비번, 유저이메일 
		 두번째 줄부터는 반복문으로 해당 유저 관련 정보가 나오도록 하겠습니다.
		 
		 <thead> <tbody> 헤드와 바디를 구분해주는 태그. 안써도 구현은 되지만 쓰면 좋음
		 
		 ★★★★★★★★★★★ 밑의 <tbody> 선생님 답 ★★★★★★★★
		 while(rs.next()){
		 	<td><= rs.getString(1)%> </td>
		 	<td><= rs.getString(2)%> </td>
		 	<td><= rs.getString("upw")%> </td>
		 	<td><= rs.getString("uemail")%> </td>
		 }
		 ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		 
		 (주의) '<=' 이렇게 쓴거 오타고 원래는 '%='랑 같이 써야되는데 그럼 코드로 인식되어서 안쓴거임
		 이런식으로 코드를 짜면 굳이 String 변수들을 만들지 않아도 바로 사용할 수 있음!
		 (장점) 코드를 간소화할 수 있고 가독성 측면에서 좋다.
	-->
	<table border="1">
		<thead> <!-- 헤드 영역 -->
			<tr>
				<th>유저 이름</th>
				<th>유저 아이디</th>
				<th>유저 비밀번호</th>
				<th>유저 이메일</th>
			</tr>
		</thead>
		
		<tbody>	<!-- 바디 영역 -->
		<!-- 이건 내가 짠 코드. 이거슨,, 초심자 코드,, 선생님이 짜신 코드는 위에 적어놓음. -->
		<% while(rs.next()){ 
			String uName = rs.getString("uname");
			String uId = rs.getString("uid");
			String uPw = rs.getString("upw");
			String uEmail = rs.getString("uemail");	%>
			<tr>
				<td><%=uName %></td>
				<td><%=uId %></td>
				<td><%=uPw %></td>
				<td><%=uEmail %></td>
			</tr>
		<%} %>
		</tbody>
		
	</table>
	
</body>
</html>






