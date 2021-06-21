<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%!
		Connection connection;
		PreparedStatement preparedStatement; //��������
		ResultSet resultSet;
	
		String driver = "oracle.jdbc.driver.OracleDriver";//�ε�
		String url = "jdbc:oracle:thin:@localhost:1521:xe";//��ġ 1521�� xe���
		String uid = "scott";
		String upw = "tiger";
	%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
		try{
			//�ε��ϰ� Ŀ�ؼǰ�ü����� ��������� prepared query �־��ְ� 1,2,3,4 �� �ְ� execute�ߴ� ���ϰ� ������ �� 1,2,3,4 �ݺ��� �־��ټ��̵�.
			//��Ȱ�� ��� ���� update�ϰ� ��Ȱ�� �ݺ� memberforpre db����� �����ϰڴ�.
			//create table memberforpre() �� string���� �Ѵ�.
			Class.forName(driver);
			connection = DriverManager.getConnection(url, uid, upw);
			int n;
			String query = "insert into memberforpre (id, pw, name, phone) values (?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, "abc");
			preparedStatement.setString(2, "123");
			preparedStatement.setString(3, "ȫ�浿");
			preparedStatement.setString(4, "010-1234-5678");
			n = preparedStatement.executeUpdate();
			
			preparedStatement.setString(1, "def");
			preparedStatement.setString(2, "456");
			preparedStatement.setString(3, "ȫ����");
			preparedStatement.setString(4, "010-9012-3456");
			n = preparedStatement.executeUpdate();
			
			preparedStatement.setString(1, "ghi");
			preparedStatement.setString(2, "789");
			preparedStatement.setString(3, "ȫ���");
			preparedStatement.setString(4, "010-7890-1234");
			n = preparedStatement.executeUpdate();
			
			preparedStatement.setString(1, "AAA");
			preparedStatement.setString(2, "111");
			preparedStatement.setString(3, "�̱浿");
			preparedStatement.setString(4, "010-1234-1111");
			n = preparedStatement.executeUpdate();
			
			if(n == 1) {
				out.println("insert success");
			} else { 
				out.println("insert fail");
			}
			
		} catch(Exception e) {
				e.printStackTrace();
		} finally {
			try{
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch(Exception e){}
		}
	%>
	<br />
	<a href="memberDataView.jsp">ȸ������ ����</a>
	
</body>
</html>