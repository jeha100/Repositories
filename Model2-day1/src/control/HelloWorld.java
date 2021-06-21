package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloWorld
 */
@WebServlet("/HelloWorld")//HelloWorld라고 주소 url에 표시해주어야 이 서블릿클래스가 실행됩
public class HelloWorld extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	reqPro(request, response);
	}

	//슈퍼메소드를 만들어놓았지.
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//화면에 Helloworld라고 출력을 하고 싶어요. jsp쪽으로 넘겨질 데이터를 설정
		String msg ="Hello World~안녕하세요";
		Integer data=12;
		//jsp쪽으로 데이터를 request에 부착하여 넘겨줌
		request.setAttribute("msg", msg);
		request.setAttribute("data", data);
		
		//db도 req로 부착가능..
		
		
		
		//서블릿에서 jsp를 호출하면서 데이터를 같이 넘겨주는 객체를 선언
		RequestDispatcher rd=request.getRequestDispatcher("HelloWorld.jsp"); //JSP파일명을기술
		rd.forward(request, response);
	}
}
//보통 get방식으로 들어오죠. 방식상관없는 메소드를 짜면 좋다.