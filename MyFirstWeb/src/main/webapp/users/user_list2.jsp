<!-- 전체 유저 목록 가져오기2 (VO 사용) 

	아까 user_list1.jsp에서 발생했던 rs.close() 실행 문제로 인해
	DB에 있는 자료를 꺼냈을때, 곧바로 java 데이터로 받아오는 작업을 수행한 다음 rs.close()를 하면 문제가 없습니다.
	
	따라서 SELECT 구문의 결과(SQL데이터)를 자바 형식으로 담을 클래스가 필요하고 이를 VO(Value Object)라고 부릅니다.
	(굉장히 많이 사용하는 방식. 게시판을 만들거나 나중에 스프링 넘어가도 사용함.)
	
	VO는 클래스이기 때문에 src/main/java에 클래스를 선언 및 정의합니다.
	UserVO.class를 만들어보겠습니다.

	자바 변수에 rs의 내용을 다 얻어놓고 연결을 끊어도 사용할 수 있도록 만드는 것.
	
	스크립트릿 자체가 메서드처럼 사용되기 때문에
		스크립트릿이 가장 상위 지역 (1.의 선언된 변수들도 가장 상위 지역에 선언됨)
		try, catch, finally가 하위 지역이 되고 상위지역인 1.의 변수들을 사용할 수 있는 것.
		
	코드를 실행했을때 uId=shiLee, uName=2si19bun, uPw=qwer1234, 이런식으로 자세하게 나옴.
		만약 toString()을 주석처리하면 그냥 kr.co.ict.UserVO@30d297db 이런식으로 주소만 나옴.
		toString의 역할은 우리가 콘솔이나 화면에 UserVO를 찍었을 때, 주소 대신 내부 데이터가 나오도록 해주는 것이다.
		따라서 무조건 적혀있어야 기능이 들어가는 것은 아니지만(toString이 없어도 주소가 연결된 것을 확인할 수 있기 때문에)
		개발자의 편의성을 위해서 쓰는 것은 아닐런쥐,, 데이터가 들어오는지 안 들어오는지 디버깅을 하려면 무조건 쓰는게 좋지 않을까?
		
	그림판 설명, 동영상 시간 10:35 ~ ??
		실행을 하는 순간 변수 rs에 DB의 전체 데이터가 저장됨. (인덱스 0 ~ n 번까지 한 개씩 row들이 들어감)
		-1(가상번호)번에 포인터로 가리키고 있는 상태
		rs.next()를 실행하면 다음 데이터가 존재하기 때문에 true이고, 포인터가 -1번에서 0번으로 이동한다.
		0번의 데이터(uname, uid, upw, uemail)를 String으로 만든 변수들에 저장해줌.
		89번 우항에서, 생성자로 데이터를 받아서 UserVO(UserVO.java로 이동) 내부에다가 this.uName:0번데이터, this.uId:0번데이터 ... 넣어준다.
		호출이 끝나면 다시 돌아와서 89번의 좌항인 userData 내부에 넣어준다.
		.add를 이용해서 userList라는 arrayList의 0번 인덱스에 넣어준다.
		while의 닫는 부분을 만나면 다시 위로 올라가서 또 rs.next()를 반복 ..
		마지막 번호(n)를 끝내고 그 다음 번호로 가면(n+1, 가상번호) 아무 데이터도 없기 때문에 rs.next()가 false가 되고 while문이 끝난다. 
		 
	서버 날렸다가 살리기 동영상 시간 (필기로 정리하자)
		12:31~12:32
		


-->

<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.ict.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 1. DB접속 및 변수 생성
	String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
				
	
				
					
	// ★ ArrayList<UserVO> 자료형을 이용해 한 줄 한 줄 단위로 여러 row를 저장합니다.
		// list, uservo, arraylist 셋 다 import함!
		// UserVO를 여러개 담을 수 있는 리스트가 생성이 되는 것.
		List<UserVO> userList = new ArrayList<>();
				
				
				
				
	try{
		// 2. 연결
		Class.forName(dbType);
		con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		// 3. SELECT * FROM userinfo 실행 및 ResultSet에 저장
		String sql = "SELECT * FROM userinfo";
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		// 테이블에 저장된 데이터를 자바로 옮기기 위해서 UserVO를 선언했습니다.
		// UserVO 하나 생성으로 몇 row에 해당하는 데이터를 받아올 수 있을까요? => 1개
		
		while(rs.next()){
			// 1. ResultSet에서 데이터 가져오기
				String uName = rs.getString("uname");
				String uId = rs.getString("uid");
				String uPw = rs.getString("upw");
				String uEmail = rs.getString("uemail");
			
			// 2. ★ 하나의 userData 생성 (생성자로 받아온 데이터를 userData에 넣어줌)
			UserVO userData = new UserVO(uName, uId, uPw, uEmail);
			
			// 3. ★ 생성된 userData를 list에 넣어주기
			userList.add(userData);
		}
		
		// 4. userList에 데이터 잘 들어왔나 확인
			// 이 데이터들은 이제 DB에 있는 것이 아니라, '자바 내부'에 들어온 것.
			// 따라서 이제 rs에 의존할 필요가 없음. => finally에서 .close()해도 상관없음(에러 안남)
			//System.out.println(userList);
			//out.println(userList + "<br/>");
			
	}catch(Exception e){
		e.printStackTrace();
		
	}finally{
		// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		// 이 영역에서 바로 .close()를 쓰고도 데이터를 body 태그 내에서 쓰려면
		// .close() 이전에 DB에 있던 데이터를 모조리 자바로 옮겨야 합니다.
			// 자원 회수
			con.close();
			pstmt.close();
			rs.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 향상된 for문을 이용해서 userList 내부의 데이터를 Table 형태로 user_list1과 동일한 양식으로 화면에 출력해주세요. 
		 힌트 : 표현식 내에 getter를 씁니다.
		 
		 userList(ArrayList)에는 인덱스 하나하나에 UserVO가 하나씩 들어있으므로 향상된 for문에서 UserVO로 받아주어야한다.
		 
		 (문제) 코드 제대로 쳤는데 결과 페이지에 이름과 아이디가 바뀌어서 나타나는 현상이 있었음.
		 (해결) UserVO.java의 생성자에 String uId, String uName, .. 라고 적혀있어서 데이터가 그렇게 들어왔던 것.
		       String uName, String uId .. 순서로 바꾸니 해결
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
		<tbody>
			<% for(UserVO user : userList){%>
				<tr>
					<td><%=user.getuName()%></td>
					<td><%=user.getuId()%></td>
					<td><%=user.getuPw()%></td>
					<td><%=user.getuEmail()%></td>
				<tr>
			<% }%>
		</tbody>
	
	
	
</body>
</html>







