<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- jsp������������ ����ϴ� ���尴ü�̸� �����ͳ����� ȭ�鿡 ����ϱ����� �����ϴ� out��ü�̴�. -->
<%
	String name ="�˸��� ����";


%>

��ũ��Ʈ�� ǥ���� <%=name %>�� ȭ�鿡 ���

<p>
<%
	out.print(name+"�� ȭ�鿡 ���");
%>


</body>
</html>