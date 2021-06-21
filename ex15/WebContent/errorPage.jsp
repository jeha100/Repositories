<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page isErrorPage="true" %>
<!-- 예외처리하는페이지입니다.true이면 exceptionㄱ객체참고해서사용할수있다. -->
<% response.setStatus(200); %>
<!-- page의status값을 200으로 지정해줘야한다 안하면 500 내부서버오류 딱딱한 페이지가 나타남 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	에러 발생<br />
	<%= exception.getMessage() %>
</body>
</html>