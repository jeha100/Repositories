<%@page import="db.RentcarDAO"%>
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
		String id = request.getParameter("id");
		String rday = request.getParameter("rday");
		
		RentcarDAO rdao =new RentcarDAO();
		
		//예약 삭제 메소드 호출 
		rdao.carRemoveReserve(id, rday);
		 
		response.sendRedirect("RentcarMain.jsp");
	%>
</body>
</html>