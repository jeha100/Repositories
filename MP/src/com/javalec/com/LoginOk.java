package com.javalec.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginOk")
public class LoginOk extends HttpServlet {
	private Connection con;
	private Statement stmt;
	private ResultSet rs;

	private String name, id, pw, phone1, phone2, phone3, gender;

	public LoginOk() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	public void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		id = request.getParameter("id");
		pw = request.getParameter("pw");

		String query = "select*from member where id='"+id+"'and pw = '"+pw+"'";
	try {
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger" );
		stmt = con.createStatement();
		rs= stmt.executeQuery(query);

		while (rs.next()) {
			name = rs.getString("name");
			id = rs.getString("id");
			pw = rs.getString("pw");
			phone1 = rs.getString("phone1");
			phone2  = rs.getString("phone2 ");
			phone3  = rs.getString("phone3 ");
			gender  = rs.getString("gender ");
		}
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("name", name);
		httpSession.setAttribute("id", id);
		httpSession.setAttribute("pw", pw);
		
		response.sendRedirect("loginResult.jsp");
	
	}catch (Exception e) {
		e.printStackTrace();// TODO: handle exception
	}finally {
		try {
		if(rs!=null)
				rs.close();
		if(stmt!=null)stmt.close();
		if(con!=null)con.close();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	}

}
