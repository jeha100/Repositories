<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script language="Javascript" src="members.js"></script>
</head>
<body>
<!-- 항목이 아이디 비밀번호 이름 주소 를 받고있고 joinOK.jsp로 가서 가입인증 -->
	<form action="joinOk.jsp" method="post" name="reg_frm">
		아이디 : <input type="text" name="id" size="20"><br />
		비밀번호 : <input type="password" name="pw" size="20"><br />
		비밀번호 확인 : <input type="password" name="pw_check" size="20"><br />
		이름 : <input type="text" name="name" size="20"><br />
		메일 : <input type="text" name="eMail" size="20"><br />
	 	주소 : <input type="text" name="address" size="50"><br />
		<input type="button" value="회원가입" onclick="infoConfirm()">&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="javascript:window.location='login.jsp'">
	
	<!-- onclick핸들러 infoconfirm실행 자바스크립트 정상적으로 실행되면 ->joinOk.jst로 넘김 --></form> 


</body>
</html>