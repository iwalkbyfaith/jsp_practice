package kr.co.daeun.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class servlet1
 */
@WebServlet("/servlet1")
public class servlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
			
			System.out.println("a의 값이 -1이면 returnDate(전) / returnSchedule(후) => 정상 반납");
			System.out.println("a의 값이  0이면 returnDate    = returnSchedule     => 정상 반납");  
			System.out.println("a의 값이  1이면 returnDate(후) / returnSchedule(전) => 연체");
			
			
			System.out.println("-------------------------------------");
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		
	}

}
