//package com.javalec.ex;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
///**
// * Servlet implementation class LoginOk
// */
//@WebServlet("/LoginOk")
//public class LoginOk extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public LoginOk() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}
package com.javalec.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//로그인html에서 정보를 가져와서 회원인증을 해야한다. db접근->멤버테이블->로그인html id 가 테이블에있는지확인-> id의 pw 맞는지 확인->회원인지 아닌지에따라 페이지이동
/**
 * Servlet implementation class LogInOk
 */
@WebServlet("/LogInOk")
public class LoginOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Connection connection; //디비접속위해서 
	private Statement stmt;
	private ResultSet resultSet;
	
	private String name, id, pw, phone1, phone2, phone3, gender;
       
    public LoginOk() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		id = request.getParameter("id");//사용자가입력한id pw받아오기
		pw = request.getParameter("pw");
		
		String query = "select * from member where id = '" + id + "' and pw = '" + pw + "'";
		//멤버테이블에서 id가 사용자id와 같느냐 && 그 값을 가져오기
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "scott" , "tiger");
			stmt = connection.createStatement();
			 resultSet =  stmt.executeQuery(query);//전역으로 빼고 선언만해주면된다.
			//드라이버 로드하고 connection객체 statemetn객체 구하고 resultset객체로 반환됨 
			
			
			while (resultSet.next()) { //객체로반환해서 데이터가존재한다면 1개 존재하니 while문 한번돈다
				name = resultSet.getString("name");
				id = resultSet.getString("id");
				pw = resultSet.getString("pw");
				phone1 = resultSet.getString("phone1");
				phone2 = resultSet.getString("phone2");
				phone3 = resultSet.getString("phone3");
				gender = resultSet.getString("gender");
			}
			//브라우저하나당 하나의 세션이있다.
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("name", name);
			httpSession.setAttribute("id", id);
			httpSession.setAttribute("pw", pw);
			
			response.sendRedirect("loginResult.jsp");
			
		} catch (Exception e) { //예외페이지 에러발생시
			e.printStackTrace();
		} finally {//자원해제
			try {
				if(resultSet != null) resultSet.close();//자원해제
				if(stmt != null) stmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();//예외처리
			}
		}
		
	}

}
