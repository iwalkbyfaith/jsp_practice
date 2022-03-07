/* 서블릿 : 게시판의 리스트를 추가해줌

	이동 경로
	insertBoardForm.jsp(폼) 
		-> insertBoardServlet.java(폼에서 날아온 내용 DB에 적재) 
		-> (리다이렉트로 이동)BoardListServlet.java(DB에 적재된 게시판 리스트를 가져옴)
		-> (포워딩으로 이동) boardlist.jsp(리스트를 화면에 보여줌)
		
	사용자 입장에서는 자기가 글을 쓰고 나서 작성완료 버튼을 눌렀을때, 게시글 목록을 확인할 수 있는 것!
 

 
 
 */


package kr.co.ict.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;

/**
 * Servlet implementation class InsertBoardServlet
 */
@WebServlet("/insertboard")
public class InsertBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 기본적으로 SELECT를 제외한 쿼리문 호출은 POST로만 접근할 수 있게 합니다.
		// INSERT로 하면 DB에 적재된 데이터 목록이 바뀌기 때문에, 오로지 폼을 통해서만 넘어올 수 있게 한다.
		
		// DAO 생성
		BoardDAO dao = BoardDAO.getInstance();
		
		// INSERT 로직 호출 (필요 파라미터는 폼에서 날아온다고 가정하고 입력해주세요)
		// 폼에서 날아올때 사용하는 name은 title, content, writer입니다.
		
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		dao.insertBoard(title, content, writer);
		
		// 다 끝났다면, 리다이렉트 방식으로 서블릿 주소 boardlist로 이동시킵니다.
		response.sendRedirect("http://localhost:8181/MyFirstWeb/boardlist");
		
		// (insertBoardForm.jsp를 만들어서 폼을 생성.
		// 폼의 목적지는 http://localhost:8181/MyFirstWeb/insertboard 이 서블릿이고
		// 받아온 데이터를 DAO의 insertBoard 메서드롤 넣고나서, boardlist 서블릿으로 리다이렉트한다.
		// 그럼 넣어진 데이터를 바로 페이지에서 확인할 수 있음.
		
	}

}
