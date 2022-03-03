package kr.co.ict.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletCustom
 */
@WebServlet("/banana")
public class ServletCustom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCustom() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    // 최초 주소 접속시 딱 한 번
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("/banana 최초 접속");
	}

	
	// 서버가 종료될 때 실행되는 메서드 소멸자
		// 서버 종료 버튼(Servers 탭의 빨간 네모 버튼)을 누르면 꺼진다.
	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		System.out.println("/banana 접속시 생성된 객체는 서버 종료로 인해 파기됩니다.");
	}

	
	// get방식으로 해당 주소에 접속할때마다 실행해주는 메서드 (여러번 실행하면 여러번 나옴)
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/banana 주소 접속 확인");
		// request.getParameter()를 이용해 "jsp", "boot"라는 이름으로 들어온 요소를 콘솔에 찍도록 아래 코드를 작성하고
		// doGet 메서드를 복사해서 보내주세요 (선생님은 따로 변수 만드심)
			// 내 답
			//System.out.println(request.getParameter("jsp"));
			//System.out.println(request.getParameter("boot"));
		
		String jsp = request.getParameter("jsp");
		String boot = request.getParameter("boot");
		
		// 확인하는 방법은 ?jsp=값1&boot=값2를 주소 뒤에 붙입니다.
		
		String jpa = request.getParameter("jpa");
		System.out.println("get 방식으로 들어온 값 : " + jsp + ", " + boot + ", " + jpa);
		
		// bananaResult.jsp(결과 페이지)로 리다이렉트 -> (문제)만들어진 변수를 전달하지 않는다.
			//response.sendRedirect("http://localhost:8181/MyFirstWeb/servletForm/bananaResult.jsp");
		
		// (해결★) 상단 변수를 함께 전달하기 위해 forward를 대신 사용한다.
			// 순서 1) request에 setAttribute()를 이용해 데이터를 저장
				// request.setAttribute("보낼이름", "자료");
			// 순서 2) 여기로 보낼거에요(알려줌)
				// RequestDispatcher dp = request.getRequestDispatcher("목적지");
			// 순서 3) 실행
				// dp.forward(request, response);
			
			request.setAttribute("jsp",jsp);
			request.setAttribute("boot", boot);
			request.setAttribute("jpa", jpa);
			
			RequestDispatcher dp = request.getRequestDispatcher("/servletForm/bananaResult.jsp");
			dp.forward(request, response);
	}
	
	
	
	// form에서 post 방식으로 submit해야만 doPost()로 간주가 됨 (나머지는 일반적으로 doGet()이라고 보면 된다)
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doPost는 현재까지 배운 내용만 보고 봤을때는(현재 스프링, rest 개발 아직 안배움) 
		// form에서 post 방식으로 제출될 때 호출됩니다.
		System.out.println("/banana 주소 post 방식으로 접속함");
		
		// bananaForm에 있던 목적지는 그대로 두시고 전송 방식만 post 방식으로.
		// 대신 post 방식으로 전송됨을 구분하기 위해서
		// System.out.println("post 방식 : " + 변수명);
		request.setCharacterEncoding("utf-8");
		
		String jsp = request.getParameter("jsp");
		String boot = request.getParameter("boot");
		String jpa = request.getParameter("jpa");
		System.out.println("post 방식 => jsp :" + jsp + ", boot :" + boot + ", jpa :" + jpa);
		
		// bananaResult.jsp(결과 페이지)로 리다이렉트 -> (문제)만들어진 변수를 전달하지 않는다.
			//response.sendRedirect("/servletForm/bananaResult.jsp");
		
		// (해결★) 상단 변수를 함께 전달하기 위해 forward를 대신 사용한다.
		
		// (실습) 위의 redirect방식 대신, bananaPostResult.jsp를 생성해주신다음
		// post 방식 처리시 포워딩으로 jsp, boot, jpa 변수가 화면에 표출되도록 해주세요
		
			// 1. request.setAttribute()를 사용해 포워딩 목적지로 보낼 데이터 바인딩(저장)
			request.setAttribute("jsp",jsp);
			request.setAttribute("boot", boot);
			request.setAttribute("jpa", jpa);
			
			// 2. 목적지 설정 및 RequestDispatcher 생성
			RequestDispatcher dp = request.getRequestDispatcher("/servletForm/bananaPostResult.jsp");
			
			// 3. 실행
			dp.forward(request, response);
		
	}

}
