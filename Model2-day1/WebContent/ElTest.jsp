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
	int i = 3;

	out.print("i="+i);
	
	request.setAttribute("ia", 3); 
%>
	<p>
	i= <%=i %>
	<p>
	i=${ia }
<!-- attribute 나 param 이용해야 출력가능 request나 session객체에 담아놓고 쓸때만 사용가능하지 변수다이렉트로 못쓴다.  -->
</body>
</html>