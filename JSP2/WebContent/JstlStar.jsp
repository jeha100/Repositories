<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- 
	  *
	 ***
    *****
   ******
  *********

	총 for문 3개 필요

	 -->
<!-- 5개의 반복적인일을 하는 outer for 문을 -->
<c:forEach var="i" begin="1" end="5">

	<!-- 공백을 출력하는 반복문을 작성 -->
	<c:forEach var = "j" begin="i+1" end = "5">
	
		&nbsp;	
	
	
	</c:forEach>

</c:forEach>

</body>
</html>