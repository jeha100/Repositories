package com.jun.ex;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JoinOOK
 */
@WebServlet("/JoinOK")
public class JoinOK extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private Statement stmt;
	
	private String name, id, pw, phone1, phone2, phone3, gender;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinOK() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("doGet");
		actionDo(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		System.out.println("doPost");
		actionDo(request,response);
		
	}
private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
	// TODO Auto-generated method stub
	request.setCharacterEncoding("EUC-KR");
	
	name=request.getParameter("name");
	id=request.getParameter("id");
	pw=request.getParameter("pw");
	phone1=request.getParameter("phone1");
	phone2=request.getParameter("phone2");
	phone3=request.getParameter("phone3");
	gender=request.getParameter("gender");
	
	String query="insert into member values('" + name + "', '" + id + "', '" + pw + "', '" + phone1 + "', '" + phone2 + "', '"+ phone3 + "', '" + gender + "')";
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "scott" , "tiger");
	stmt = connection.createStatement();
	int i = stmt.executeUpdate(query);//executeUpdate ?????? 1 
	if(i == 1){
		System.out.println("insert success");
		response.sendRedirect("joinResult.jsp");
	} else {
		System.out.println("insert fail");
		response.sendRedirect("join.html");
	}
}catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
//	System.out.println("insert fail");
//	response.sendRedirect("join.html");
} finally {
	try {
		if(stmt != null) stmt.close();
		if(connection != null) connection.close();
	} catch (Exception e) {}
}
}

}