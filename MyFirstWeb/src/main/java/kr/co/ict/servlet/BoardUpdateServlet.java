package kr.co.ict.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/boardUpdate")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("/boardUpdate 진입 완료");
		System.out.println("수정 창에서 -> 수정 로직 진입 완료");
		
		request.setCharacterEncoding("utf-8");
		
		String strBoardNum = request.getParameter("board_num");
		int boardNum = Integer.parseInt(strBoardNum);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// 다오 생성
		BoardDAO dao = BoardDAO.getInstance();
		
		// 메서드 호출 ( mDate도 같이 바뀜 )
		dao.updateBoard(title, content, boardNum);
		
		// 디테일 페이지로 리다이렉트
		response.sendRedirect("http://localhost:8181/MyFirstWeb/boarddetail?board_num=" + boardNum);
				
		
		
		// 1. BoardDAO에 updateBoard() 메서드를 생성해주세요
		// 2. 1의 메서드에 들어갈 쿼리문은 아래와 같습니다.
		//
		
	}

}
