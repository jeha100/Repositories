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
	<!--�����͸� �ѹ��� �޾ƿ��� ��Ŭ������ ����ϵ���  -->
	<jsp:useBean id = "boardbean" class= "model.BoardBean">
		<jsp:setProperty name="boardbean" property = "*" />
	</jsp:useBean>

	<% 
		//������ ���̽� ��ü ����
		BoardDAO bdao = new BoardDAO();
		bdao.reWriteBoard(boardbean);
		
		response.sendRedirect("BoardList.jsp");
		
	%>
</body>
</html>