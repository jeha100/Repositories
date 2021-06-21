 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>



<!-- 쿠키 배열로 받고 for문으로 쿠키의 length값동안 i가 돕니다. -->
	<%
		Cookie[] cookies = request.getCookies();
	
		for(int i=0; i<cookies.length; i++) {
			String str = cookies[i].getName();
			if(str.equals("cookieN")) {
				out.println("cookies[" + i + "] name : " + cookies[i].getName() + "<br />");
				out.println("cookies[" + i + "] value : " + cookies[i].getValue() + "<br />");
				out.println("=====================<br />");
			}
		}
	%>
<!--request로 쿠키를받았다-->
<a href="cookiedel.jsp">cookie delete</a>
</body>
</html>