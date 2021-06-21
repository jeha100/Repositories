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
	<!-- session내부객체 jsp컨테이너에서 서블릿만들때 자동객체생성됨
	속성 이름 값 -->
	<a href="sessionget.jsp">session get</a>

</body>
</html>