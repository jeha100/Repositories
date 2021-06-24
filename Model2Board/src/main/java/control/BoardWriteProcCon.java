package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardBean;
import model.BoardDAO;

/**
 * Servlet implementation class BoardWriteProcCon
 */
@WebServlet("/BoardWriteProcCon.do")
public class BoardWriteProcCon extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("UTF-8");
		
		//빈클래스로 데이터를 읽어 드림
		BoardBean bean = new BoardBean();
		bean.setWriter(request.getParameter("writer"));
		bean.setSubject(request.getParameter("subject"));
		bean.setEmail(request.getParameter("email"));
		bean.setPasword(request.getParameter("password"));
		bean.setContent(request.getParameter("content"));
		
		//데이터 베이스 쪽으로 빈 클래스를 넘겨줌
		BoardDAO bdao = new BoardDAO();
	
		//데이터 저장 메소드를 호출
		bdao.insertBoard(bean);
		
		RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
		dis.forward(request ,response);
	}
}
