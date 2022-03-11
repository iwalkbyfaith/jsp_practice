/* 서블릿 : 보드 리스트에서 '글쓰기' 버튼을 눌렀을때 글쓰기 폼으로 이동하는 서블릿(InsertBoardServlet과 구분 !!!) */

package kr.co.ict.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardInsertFormServlet
 */
@WebServlet("/boardInsertForm")
public class BoardInsertFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 리다이렉트 하니까 주소가 노출되서 포워딩을 해야함
		// response.sendRedirect("http://localhost:8181/MyFirstWeb/board/insertBoardForm.jsp");
		
		// 포워딩 (받은 값은 없지만 포워딩 가능)
			// 여태까지는 서블릿 주소로 리다이렉트해서 주소가 노출되지 않았지만 위와같이 보내면 주소가 노출됨.
			// 어차피 나중에 포워딩을 해야한다고 하심 : 그 이유는 나중에 로그인한 아이이디를 보내줘야하기 때문에(리다이렉트로는 못 보내니까) (이해 몬함)
		RequestDispatcher dp = request.getRequestDispatcher("/board/insertBoardForm.jsp");
		dp.forward(request, response);
		
	}

}
