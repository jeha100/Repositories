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
@WebServlet("/HelloWorld")//HelloWorld��� �ּ� url�� ǥ�����־�� �� ����Ŭ������ �����
public class HelloWorld extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	reqPro(request, response);
	}

	//���۸޼ҵ带 ����������.
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//ȭ�鿡 Helloworld��� ����� �ϰ� �;��. jsp������ �Ѱ��� �����͸� ����
		String msg ="Hello World~�ȳ��ϼ���";
		Integer data=12;
		//jsp������ �����͸� request�� �����Ͽ� �Ѱ���
		request.setAttribute("msg", msg);
		request.setAttribute("data", data);
		
		//db�� req�� ��������..
		
		
		
		//�������� jsp�� ȣ���ϸ鼭 �����͸� ���� �Ѱ��ִ� ��ü�� ����
		RequestDispatcher rd=request.getRequestDispatcher("HelloWorld.jsp"); //JSP���ϸ������
		rd.forward(request, response);
	}
}
//���� get������� ������. ��Ļ������ �޼ҵ带 ¥�� ����.