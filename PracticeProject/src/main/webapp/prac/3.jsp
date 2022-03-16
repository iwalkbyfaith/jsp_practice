<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	Date returnDate = null;
	Date returnSchedule = null;
	try {
		returnDate = df.parse(request.getParameter("returndate"));
		returnSchedule = df.parse(request.getParameter("returnschedule"));
		System.out.println("-------------------------------------");
		System.out.println("리턴 데이트-> " + returnDate);
		System.out.println("리턴 스케쥴-> " + returnSchedule);
		
		int a = returnDate.compareTo(returnSchedule);
		System.out.println("a의 값은 -> " + a);
		System.out.println("-------------------------------------");
		
	} catch (ParseException e) {
		e.printStackTrace();
	}
	
	// 



%>


</body>
</html>