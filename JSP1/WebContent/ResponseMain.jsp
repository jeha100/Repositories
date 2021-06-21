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
	request.setCharacterEncoding("EUC-KR");//post라 안써도 된다. 지금은 get방식이라서 안써도 된다. 한글깨짐방지

%>

	<h2><%= request.getParameter("id") %>님 반갑습니다.</h2>
</body>
</html>