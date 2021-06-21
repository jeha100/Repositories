<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- request.getcokkies로 받음 받고 for문 돈다 속성변경후에는 다시 response.addCookie한다 -->
	<%
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++) {
			String str = cookies[i].getName();
			if(str.equals("cookieN")) {
				out.println("name : " + cookies[i].getName() + "<br />");
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
	%>
	<!-- cookies[i].setMaxAge(0); 쿠키 삭제 -->
	<a href="cookietest.jsp">쿠키확인</a>
</body>
</html>