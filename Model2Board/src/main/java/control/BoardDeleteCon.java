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
 * Servlet implementation class BoardDeleteCon
 */
@WebServlet("/BoardDeleteCon.do")
public class BoardDeleteCon extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("UTF-8");
		
		//해당 번호
		int num = 	Integer.parseInt(request.getParameter("num"));
		
		//데이터 베이스에서 하나의 게시글에 대한 정보를 리턴 메소드 호출 
		BoardDAO bdao = new BoardDAO();
		BoardBean bean = bdao.getOneUpdateBoard(num);

		request.setAttribute("bean", bean);
		
		RequestDispatcher dis = request.getRequestDispatcher("BoardDeleteForm.jsp");
		dis.forward(request ,response);
	}

}