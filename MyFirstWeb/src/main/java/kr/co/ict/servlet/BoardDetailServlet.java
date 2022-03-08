package kr.co.ict.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

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
		
		// request.getParameter를 이용해 글번호부터 가져옵니다.
		// board_num으로 가져옵니다. int로 자료형도 바꿔주세요.
			// Q) 파라미터 값으로 어떤 것을 넣어주어야 할지 고민
			//	 A) ★ 일단 자기가 원하는 이름(board_num)을 넣고, 서블릿을 실행하면 주소가 이런식으로 나온다.
			//      http://localhost:8181/MyFirstWeb/boarddetail
			//      어떤 값도 없기 때문에 당연히 페이지는 500에러가 뜬다.(캡쳐) java.lang.NumberFormatException: null
			//      그럼 주소 뒤에 물음표(?)를 넣어주고 board_num = 값 을 적어주면 get방식으로 보내기 완료
		    //      http://localhost:8181/MyFirstWeb/boarddetail?board_num=1
		
		// 게시판 번호 가져오기
		String str_board_num = request.getParameter("board_num");
		int board_num = Integer.parseInt(str_board_num);
		
			// (디버깅) 게시판 번호
			System.out.println("페이지에 입력된 게시판 번호 : " + board_num);
		
		// DAO 생성
		BoardDAO dao = BoardDAO.getInstance();
		
		// VO 생성 (SELECT니까 받아줘야)
		BoardVO detailBoard = dao.getBoardDetail(board_num);
		
			// (디버깅) VO
			System.out.println(detailBoard);
		
		// 바인딩
		request.setAttribute("detailBoard", detailBoard);

		// 주소지
		RequestDispatcher dp = request.getRequestDispatcher("/board/boarddetail.jsp");
		
		// 포워딩
		dp.forward(request, response);
		
		
		
	}

}
