package com.javalec.fc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class FrontCon252 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontCon252() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("actionDo");

		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);
		String conPath = request.getContextPath();
		System.out.println("conPath : " + conPath);
		String command = uri.substring(conPath.length());
		System.out.println("command : " + command);

		if (command.equals("/insert.do")) {
			System.out.println("insert");
			System.out.println("----------");
		} else if (command.equals("/update.do")) {
			System.out.println("update");
			System.out.println("----------");
		} else if (command.equals("/select.do")) {
			System.out.println("select");
			System.out.println("----------");
		} else if (command.equals("/delete.do")) {
			System.out.println("delete");
			System.out.println("----------------");

		}
	}

}
