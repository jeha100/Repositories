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
@WebServlet("/LoginProc.do")//������̼Ǳ���̴� �߿�. formaction�ʰ� /�ؿ� �����̸����� �ؾ��Ѵ�.
public class LoginProc extends HttpServlet {
	
	//JSp�� ���尴ü��HttpServletRequest������   �ڹٴ� ���� �ڹٴ� httpServlet����ӹ޾ƾ� doget ��������
	//httpservlet�� ��ӹ޾ұ⶧���� ����Ŭ������� ����Ѵ�.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);

	}

	//get post��Ļ������ ��� ó�����ְ��Ѵ�.
	public void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
//		System.out.println("id="+id);
		
		request.setAttribute("id", id);//request ��ü�� �����͸� ���� ��״�������������/���ǿ��ٰ� �ص���
		request.setAttribute("pass",pass);
		//
		RequestDispatcher dis = request.getRequestDispatcher("LoginProc.jsp");
		dis.forward(request, response);
	}
	
}
