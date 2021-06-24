package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/BoardReWriteCon.do")
public class BoardReWriteCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("UTF-8");
		
		//num는 num의 seq가 자동부여 되서 필요없다.
		int ref = 	Integer.parseInt(request.getParameter("ref"));
		int re_step = 	Integer.parseInt(request.getParameter("re_stop"));
		int re_level = 	Integer.parseInt(request.getParameter("re_level"));
		
		request.setAttribute("ref", ref);
		request.setAttribute("re_step", re_step);
		request.setAttribute("re_level", re_level);

		//jsp로 넘겨준다
		RequestDispatcher dis = request.getRequestDispatcher("BoardReWriteForm.jsp");
		dis.forward(request ,response);
	}

}
