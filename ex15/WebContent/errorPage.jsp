<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page isErrorPage="true" %>
<!-- ����ó���ϴ��������Դϴ�.true�̸� exception����ü�����ؼ�����Ҽ��ִ�. -->
<% response.setStatus(200); %>
<!-- page��status���� 200���� ����������Ѵ� ���ϸ� 500 ���μ������� ������ �������� ��Ÿ�� -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	���� �߻�<br />
	<%= exception.getMessage() %>
</body>
</html>