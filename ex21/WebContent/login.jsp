<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <!-- �̹� �α��� �ؼ� ��ȿ�� ����̸� �α��� ���ʿ���� forward�Ѵ�. main.jsp�� -->
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
	<!-- ���ǿ� ���̵��� ������ out�ѷ��ְ� �ƴϸ� �ȻѸ����ڵ� �Ʒ� -->
		���̵� : <input type="text" name="id" value="<% if(session.getAttribute("id") != null) out.println(session.getAttribute("id")); %>"> <br />
		��й�ȣ : <input type="password" name="pw"><br />
		<!-- submit�ϸ� loingOk.jsp�ΰ��� ���� -->
		<input type="submit" value="�α���"> &nbsp;&nbsp; <input type="button" value="ȸ������" onclick="javascript:window.location='join.jsp'">
		<!-- �ڹٽ�ũ��Ʈ ���: ȸ������ ��ư �������� window ��ü�� loacation�� join.jsp�� ���� -->
	</form>

</body>
</html>