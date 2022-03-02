package kr.co.ict.servlet;

import java.io.IOException;
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

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("/banana 최초 접속");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
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
		System.out.println(jsp + ", " + boot + ", " + jpa);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
