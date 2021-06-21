<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2> 세션 연습 </h2>
<!-- 세션도 내장객체이기때문에 스크립트릿 안에서만 사용이가능하다 -->
<%
	String name="shin";
	//세션을 이용하여 데이터를 유지 
	session.setAttribute("name1", name); /* 세션스콥:세션은 브라우저에서 모두 공유된다. */
	//세션 유지시간
	session.setMaxInactiveInterval(10); //10초가 세션을 유지

%>
	<a href="SessionName.jsp"> 세션네임페이지로 이동</a>

</body>
</html>