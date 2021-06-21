package com.javalec.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ModifyOk")
public class ModifyOk extends HttpServlet {
	private Connection con;
	private Statement stmt;
	private String name, id, pw, phone1, phone2, phone3, gender;

	HttpSession httpSession;

	public ModifyOk() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request,response);
	}

	public void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		httpSession = request.getSession();
		
		name = request.getParameter("name");
		id = (String)httpSession.getAttribute("id");
		pw = request.getParameter("pw");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		gender = request.getParameter("gender");
		//joinOK from 과 비슷하다.
		if(pwConfirm()) {
			System.out.println("OK");
			
			String query = "UPDATE member SET NAME='" + name + "', PHONE1='" + phone1 + "', PHONE2='" + phone2 + "', PHONE3='" + phone3 + "', GENDER='" + gender + "' WHERE ID='" + id + "'"; 

		
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "scott" , "tiger");
				stmt= con.createStatement();
				
				int i = stmt.executeUpdate(query);
				if(i==1) {
					System.out.println("update scuccess");
					response.sendRedirect("modifyResult.jsp");
				}else {
					System.out.println("update fail");
					response.sendRedirect("modify.jsp");
				
				
				}
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(stmt != null) stmt.close();
					if(con!= null) con.close();
				} catch (Exception e) {}
			}
			
		} else {
			System.out.println("NG");
		}
			
}
		
		private boolean pwConfirm() {
			boolean rs = false;
			
			String sessionPw = (String)httpSession.getAttribute("pw");
		
			if(sessionPw.equals(pw)) {
				rs=true;
			}else {
				rs=false;
			}
			return rs;
		
	}
}
