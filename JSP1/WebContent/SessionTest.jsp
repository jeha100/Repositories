<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2> ���� ���� </h2>
<!-- ���ǵ� ���尴ü�̱⶧���� ��ũ��Ʈ�� �ȿ����� ����̰����ϴ� -->
<%
	String name="shin";
	//������ �̿��Ͽ� �����͸� ���� 
	session.setAttribute("name1", name); /* ���ǽ���:������ ���������� ��� �����ȴ�. */
	//���� �����ð�
	session.setMaxInactiveInterval(10); //10�ʰ� ������ ����

%>
	<a href="SessionName.jsp"> ���ǳ����������� �̵�</a>

</body>
</html>