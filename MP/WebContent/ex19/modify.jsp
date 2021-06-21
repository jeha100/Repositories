<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%!Connection con;
	Statement stmt;
	ResultSet rs;
	
	String name, id, pw, phone1, phone2, phone3, gender;%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
	id = (String)session.getAttribute("id");

	String query =  "select * from member where id = '" + id + "'";
	
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
	
	%>
	
	
	<form action="ModifyOk" method ="post">
	이름:<input type = "text "name = "name" size="10"><br/>
	아이디: <%= id %> <br/>
	비밀번호:<input type = "password"name = "name" size="10"><br/>
	전화번호:<select name ="phone1">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="017">017</option>
	</select> -
		<input type="text" name="phone2" size="5"> - <input type="text" name="phone3" size="5"> <br />
		성별구분 : <input type="radio" name="gender" value="man" checked="checked">남 &nbsp;<input type="radio" name="gender" value="woman">여 <br />
		
		<input type="submit" value="정보수정"> <input type="reset" value="취소">
	
	</form>

</body>
</html>