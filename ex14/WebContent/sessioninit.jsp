<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
			session.setAttribute("mySessionName", "mySessionData");
		 	session.setAttribute("myNum", 12345);
	 %>
	<!-- session���ΰ�ü jsp�����̳ʿ��� �������鶧 �ڵ���ü������
	�Ӽ� �̸� �� -->
	<a href="sessionget.jsp">session get</a>

</body>
</html>