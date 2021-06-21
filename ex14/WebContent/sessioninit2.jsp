<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- sessioninti-> sessionget-->
	<%
		session.setAttribute("mySessionName", "mySessinData");
		session.setAttribute("myNum", 12345);
	%>
	<a href = "sessionget2.jsp">
</body>
</html>