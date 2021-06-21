package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class LoginProc
 */
@WebServlet("/LoginProc.do")//어노테이션기능이다 중요. formaction쪽과 /밑에 같은이름으로 해야한다.
public class LoginProc extends HttpServlet {
	
	//JSp는 내장객체로HttpServletRequest있지만   자바는 없음 자바는 httpServlet을상속받아야 doget 쓸수있음
	//httpservlet을 상속받았기때문에 서블릿클래스라고 명명한다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);

	}

	//get post방식상관없이 얘까 처리해주게한다.
	public void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
//		System.out.println("id="+id);
		
		request.setAttribute("id", id);//request 객체에 데이터를 저장 얜그담페이지까지만/세션에다가 해도됨
		request.setAttribute("pass",pass);
		//
		RequestDispatcher dis = request.getRequestDispatcher("LoginProc.jsp");
		dis.forward(request, response);
	}
	
}
