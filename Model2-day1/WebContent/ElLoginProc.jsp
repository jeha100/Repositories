<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


����� ���̵�� ${param.id} �н������ ${param.password }�Դϴ�.
<!-- request.getParameter�� �ִ� ���̵� �Ӽ��� -->
<!-- �׷��Ƿ� EL ǥ����� �Ķ���͵����� �ٷΰ���ͼ� ȭ�鿡 ����Ҷ� �� ���ϰ� �����ϴ�. ���� ���ǽ��� request application�� ��������. -->
<%
String id=request.getParameter("id");
%>
</body>
</html>