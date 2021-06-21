<%@page import="model.BoardDAO"%>
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
		request.setCharacterEncoding("UTF-8");
	%>
	<!--데이터를 한번에 받아오는 빈클래스를 사용하도록  -->
	<jsp:useBean id = "boardbean" class= "model.BoardBean">
		<jsp:setProperty name="boardbean" property = "*" />
	</jsp:useBean>

	<% 
		//데이터 베이스 객체 생성
		BoardDAO bdao = new BoardDAO();
		bdao.reWriteBoard(boardbean);
		
		response.sendRedirect("BoardList.jsp");
		
	%>
</body>
</html>