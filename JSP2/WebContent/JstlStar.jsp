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

	�� for�� 3�� �ʿ�

	 -->
<!-- 5���� �ݺ��������� �ϴ� outer for ���� -->
<c:forEach var="i" begin="1" end="5">

	<!-- ������ ����ϴ� �ݺ����� �ۼ� -->
	<c:forEach var = "j" begin="i+1" end = "5">
	
		&nbsp;	
	
	
	</c:forEach>

</c:forEach>

</body>
</html>