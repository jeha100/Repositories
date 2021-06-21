package com.newlecture.web.controller;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newlecture.web.entity.Notice;


@WebServlet("/notice/detail")
public class NoticeDetailController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
int id=Integer.parseInt(request.getParameter("id"));

String url="jdbc:oracle:thin:@localhost:1521/xepdb1"; 
String sql="SELECT * FROM NOTICE WHERE ID=?";
	try {
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "scott" , "tiger");
PreparedStatement st = con.prepareStatement(sql);
st.setInt(1, id);

ResultSet rs= st.executeQuery();//sql빼야하므로 ()
 
rs.next();
String title=rs.getString("TITLE");/* title이 모델이된다.*/
String writerId=rs.getString("WRITER_ID"); 
Date regdate=rs.getDate("REGDATE ");
String hit=rs.getString("HIT");
String files=rs.getString("FILES"); 
String content=rs.getString("CONTENT");

//기본생성자말고 오버로드 생성자로 만들어보자.
Notice notice= new Notice(id,title,writerId,
		regdate,
		hit,
		files,
		content
		);

request.setAttribute("n", notice);
//하나의그릇에담아 줄것 notice n이라고 하고 객체를 만들어보자


/*
request.setAttribute("title", title);
request.setAttribute("regdate", regdate);
request.setAttribute("writerId", writerId);
request.setAttribute("hit", hit);
request.setAttribute("files", files);
request.setAttribute("content", content);
*/
rs.close();
st.close();
con.close();
    
	}catch(ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	//서블릿-서블릿 전향할수있는방법 두가지 
	//redirect

	//forward
	request.
	getRequestDispatcher("/notice/detail.jsp")
	.forward(request, response);
	//위에서 담았는걸 detail.jsp로 보냄
	}

}
