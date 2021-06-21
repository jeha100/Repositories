<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


당신의 아이디는 ${param.id} 패스워드는 ${param.password }입니다.
<!-- request.getParameter에 있는 아이디 속성명 -->
<!-- 그러므로 EL 표기법은 파라미터데이터 바로갖고와서 화면에 출력할때 참 편하고 좋습니다. 세션 세션스콥 request application도 쓸수있음. -->
<%
String id=request.getParameter("id");
%>
</body>
</html>