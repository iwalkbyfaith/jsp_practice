package kr.co.daeun.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.daeun.BoardDAO;
import kr.co.daeun.BoardVO;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/boarddetail")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// boardlist.jsp에서 get방식으로 넘어온 board_num을 받아줌
		String strBoardNum = request.getParameter("board_num");
		int boardNum = Integer.parseInt(strBoardNum);
		
		// 다오
		BoardDAO dao = BoardDAO.getInstance();
		
		// 메서드
		BoardVO boardDetail = dao.getBoardDetail(boardNum);
		
		// 바인딩
		request.setAttribute("detailBoard", boardDetail);
		
		// 주소지
		RequestDispatcher dp = request.getRequestDispatcher("/board/boarddetail.jsp");
		
		// 포워딩
		dp.forward(request, response);
		
		
		
	}

}
