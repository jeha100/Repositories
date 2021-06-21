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
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++){
				out.println(cookies[i].getName() + "<br />");
				out.println(cookies[i].getValue() + "<br />");
			}
		}
	%>
	<!-- 쿠키객체가 null이아니면 for문이용해 모둔 쿠키의 namevalue를 찍는다
	coockeN이없어야 겠죠 --> 
	
	<!--Q. 쿠키를 만들고 속성을 부여해서 결과값 찍어보기 -->
</body>
</html>