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
<!-- 변수 선언하는방법  JSP의 setAttribute()와 같은 역할을 한다!!!-->
<c:set var="sum" value="0" /> 

<!-- if문 사용하는 방법 -->

<!-- 반복문 -->

<c:forEach var="i" begin="1" end="10" step="${i=i+2 }">


<c:set var="sum" value="${sum=sum+i}"/>


</c:forEach>


${sum }

</body>
</html>