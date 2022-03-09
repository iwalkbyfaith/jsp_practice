package kr.co.daeun.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.daeun.BoardDAO;
import kr.co.daeun.BoardVO;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/boardlist")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 다오 생성
		BoardDAO dao = BoardDAO.getInstance();
		
		// 메서드 실행하여 리스트에 넣어줌
		List<BoardVO> allBoardList = dao.getAllBoardList();
		
		// 바인딩
		request.setAttribute("allBoardList", allBoardList);
		
		// 주소지 입력
		RequestDispatcher dp = request.getRequestDispatcher("/board/allboardlist.jsp");
		
		// 포워딩
		dp.forward(request, response);
		
		
		
		
	}

}
