/* 인터페이스 IBoardService 생성

	다형성 원리를 이용해 프론트 컨트롤러가 수행할 명령들을 하나의 타입으로 실행할 수 있도록 도와준다.

*/


package kr.co.ict.servlet.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public interface IBoardService {
	// 서블릿 내부 메서드와 마찬가지로 request, response를 사용할 수 있도록 메서드 정의
		// 반드시 타입이 HttpServletRequest, HttpServletResponse 이어야함.
		// 커맨드 패턴 서블릿을 보면 그 안에랑 구조가 똑같음.
		void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException ;
		
	
	
	
	
	
}
