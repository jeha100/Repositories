<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
    <%!
    	String name, id, pw;
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
		name = (String)session.getAttribute("name");//session의반환값을 object이므로 캐스팅
		id = (String)session.getAttribute("id");
		pw = (String)session.getAttribute("pw");
	%>
		
	<%= name %>님 안녕하세요 <br />
	<a href="modify.jsp">회원정보 수정</a>
	
</body>
</html>