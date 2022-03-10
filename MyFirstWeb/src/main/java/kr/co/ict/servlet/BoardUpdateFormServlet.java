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
 * Servlet implementation class BoardUpdateFormServlet
 */
@WebServlet("/boardUpdateForm")
public class BoardUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. boarddetail.jsp에 목적지를 현재 서블릿으로 하는 form(post)과 submit 버튼 '수정하기'를 만들어주세요
		// 2. doPost에서 실제로 '수정하기'를 눌렀을 때 반응이 있는지 체크해주세요.
		// 3. 해당 글 번호에 저장된 정보로 수정페이지를 채워야 하니, 글 번호도 같이 넘겨지는지 체크해주세요.
		
		System.out.println("post로 접속 완료");
		
		String strBoardNum = request.getParameter("board_num");
		int boardNum = Integer.parseInt(strBoardNum);
		
		System.out.println("들어온 게시판 번호 : " + boardNum);
		
		
		// 수정 버튼을 눌렀을 때, 글제목 / 글내용 / 글쓴이 등이 기입된 상태로 수정창이 열려야 함.
		// 기입된 상태가 되려면 먼저 입력된 글 번호에 해당하는 글 정보를 DB에서 자바로 가져와야 합니다.
		// 글 번호 입력시 해당 번호 글의 정보를 가져오는 로직은 BoardDAO의 getBoardDetail(int)에 작성되어 있습니다.
		
			// 다오 생성
			BoardDAO dao = BoardDAO.getInstance();
			
			// 메서드 호출
			BoardVO board = dao.getBoardDetail(boardNum);
			
			// 바인딩
			request.setAttribute("board", board);
			
			// 주소지
			RequestDispatcher dp = request.getRequestDispatcher("/board/boardUpdateForm.jsp");
			
			// 포워딩
			dp.forward(request, response);
		
	}

}
