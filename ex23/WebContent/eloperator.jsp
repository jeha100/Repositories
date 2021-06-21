<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- expression 표기를 el표기로 el표기안에서 연산자 모두 이용 가능  -->
	${ 1+2 } <br />
	${ 1-2 } <br />
	${ 1*2 } <br />
	${ 1/2 } <br />
	${ 1>2 } <br />
	${ 1<2 } <br />
	${ (1>2) ? 1 : 2 } <br />
	${ (1>2) || (1<2) } <br />
	
	<%=  1+2 %>  <br />
	<%= 1-2 %> <br />
	<%= 1*2 %> <br />
	${ 1/2 } <br />
	${ 1>2 } <br />
	${ 1<2 } <br />
	${ (1>2) ? 1 : 2 } <br />
	${ (1>2) || (1<2) } <br />
	
</body>
</html>