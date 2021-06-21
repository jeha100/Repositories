<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- jsp페이지내에서 사용하는 내장객체이며 데이터내용을 화면에 출력하기위해 존재하는 out객체이다. -->
<%
	String name ="알리미 어플";


%>

스크립트로 표현시 <%=name %>이 화면에 출력

<p>
<%
	out.print(name+"이 화면에 출력");
%>


</body>
</html>