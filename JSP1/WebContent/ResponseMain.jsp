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
	request.setCharacterEncoding("EUC-KR");//post�� �Ƚᵵ �ȴ�. ������ get����̶� �Ƚᵵ �ȴ�. �ѱ۱�������

%>

	<h2><%= request.getParameter("id") %>�� �ݰ����ϴ�.</h2>
</body>
</html>