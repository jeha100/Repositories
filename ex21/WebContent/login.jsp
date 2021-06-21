<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <!-- 이미 로그인 해서 유효한 멤버이면 로그인 할필요없이 forward한다. main.jsp로 -->
<% if(session.getAttribute("ValidMem")!= null) { %>
	<jsp:forward page="main.jsp"></jsp:forward>
<% } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- login.jsp->member.js-> loginOK ->join.jsp->joinOk-->
	<form action="loginOk.jsp" method="post">
	<!-- 세션에 아이디값이 있으면 out뿌려주고 아니면 안뿌리는코드 아래 -->
		아이디 : <input type="text" name="id" value="<% if(session.getAttribute("id") != null) out.println(session.getAttribute("id")); %>"> <br />
		비밀번호 : <input type="password" name="pw"><br />
		<!-- submit하면 loingOk.jsp로가서 인증 -->
		<input type="submit" value="로그인"> &nbsp;&nbsp; <input type="button" value="회원가입" onclick="javascript:window.location='join.jsp'">
		<!-- 자바스크립트 언어: 회원가입 버튼 눌렀을때 window 객체의 loacation을 join.jsp로 가라 -->
	</form>

</body>
</html>