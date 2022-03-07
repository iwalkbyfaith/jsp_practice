package kr.co.ict.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

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
		// 1. 접속시 BoardDAO 생성 (싱글턴 패턴)
			// dao는 일종의 기지국이라고 생각하면 됨.
			BoardDAO dao = BoardDAO.getInstance();
			
		// 2. BoardDAO의 getAllBoardList() 호출해 전체 게시물 목록 받아오기
			List<BoardVO> allList = dao.getAllBoardList();
			
		// 3. request.setAttribute로 바인딩하기
			// 내 답
			//for(BoardVO list : allList) {
			//	request.setAttribute("boardNum", list.getBoardNum());
			//	request.setAttribute("title" , list.getTitle());
			//	request.setAttribute("content", list.getContent());
			//	request.setAttribute("writer", list.getWriter());
			//	request.setAttribute("bDate", list.getbDate());
			//	request.setAttribute("mDate", list.getmDate());
			//	request.setAttribute("hit", list.getHit());	
			//	
			//}
			
			// ★ List<BoardVO> boardList를 바로 바인딩할 수도 있다.
				request.setAttribute("allList", allList);	
			
		
		// 4. /board/boardlist.jsp로 포워딩하기
				RequestDispatcher dp = request.getRequestDispatcher("/board/boardlist.jsp");
				dp.forward(request, response);
				
				
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
