<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 선언문 객체들 초기화시키고  -->
<!-- 객체 선언문 String값으로 미리 준다. 실제 db는 try문으로 감쌌다  -->
<%!
	Connection connection;
	Statement statement;
	ResultSet resultSet;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String uid="scott";
	String upw="tiger";
	String query="select*from member2";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	
	<%
			try {
				Class.forName(driver);
				connection = DriverManager.getConnection(url, uid, upw);
				statement = connection.createStatement();
				resultSet = statement.executeQuery(query);

				while (resultSet.next()) {
					String id = resultSet.getString("id");//  컬럼명
					String pw = resultSet.getString("pw");
					String name = resultSet.getString("name");
					String phone = resultSet.getString("phone");

					out.println("아이디:" + id + ",비밀번호" + pw + ",이름:" + name + ",전화번호" + phone + "<br />");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (resultSet != null)
				resultSet.close();
					if (statement != null)
				resultSet.close();
					if (connection != null)
				connection.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			%> 
	
 	
</body>
</html>
