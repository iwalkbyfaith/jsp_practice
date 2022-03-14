package kr.co.ict.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CommandPatternServlet
 */
@WebServlet("*.test")
public class CommandPatternServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommandPatternServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("*.text 패턴으로 접속 감지됨");
		
		// .test 앞에 들어오는 문자가 뭔지 감지해야 사용자의 요청을 파악할 수 있음. ★★★
		String uri = request.getRequestURI();
		System.out.println(uri);
			// equals로 비교해서 ...,,,
			// 다음시간에는 전부 하나의 서블릿에 몰아 넣는 작업을 할 것
			// 그 후에 페이징처리(10개씩 끊어서 처리하는 것)랑 글 조회수 올라가는 것 배울듯
		
		
		// uri라는 변수에 뭐가 담길지는 모르지만 
		// 콘솔창에 뜬 것처럼 equals에 *.test 패턴을 사용해서 거기로 이동시키거나 하면 됨
		
		if(uri.equals("/MyFirstWeb/boardlist.test")) {
			System.out.println("게시판 목록으로 이동합니다.");
			response.sendRedirect("http://localhost:8181/MyFirstWeb/boardlist");
			
			// 선생님이 우리가 하는 프로젝트에는 폼으로 이동하는 것도 서블릿 처리해야한다고 하심.
		}else if(uri.equals("/MyFirstWeb/login.test")) {
			System.out.println("로그인 폼으로 이동합니다.");
			response.sendRedirect("http://localhost:8181/MyFirstWeb/users/login_form.jsp");
			
		}else if(uri.equals("/MyFirstWeb/main.test")){
			System.out.println("메인 페이지로 이동합니다.");
			response.sendRedirect("http://localhost:8181/MyFirstWeb/");
			
		}else{ // 이상한 주소(없는 패턴) 들어오면 강제로 메인 페이지로 보냄(다른데로 보내도 됨)
			System.out.println("메인 페이지로 이동합니다.");
			response.sendRedirect("http://localhost:8181/MyFirstWeb/");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
