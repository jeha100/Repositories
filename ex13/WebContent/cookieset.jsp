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
		Cookie cookie = new Cookie("cookieN", "cookieV");
		cookie.setMaxAge(60*60);	//1시간
		response.addCookie(cookie);
		//클라이언트에게전달 response헤더에 심어지는형태
		//쿠키가 전달되면저장 
		//쿠키읽으려면 request.getCookies(); 배열로 읽는다.
	%> 
	<!-- 내가만든쿠키가 get
	주는쪽이라 response객체에담는다
	추후 웹브라우저가서 쿠키 저장되는로직이실행 -->
	
	<a href="cookieget.jsp">cookie get</a>
	
</body>
</html>