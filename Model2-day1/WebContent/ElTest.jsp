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
	int i = 3;

	out.print("i="+i);
	
	request.setAttribute("ia", 3); 
%>
	<p>
	i= <%=i %>
	<p>
	i=${ia }
<!-- attribute �� param �̿��ؾ� ��°��� request�� session��ü�� ��Ƴ��� ������ ��밡������ �������̷�Ʈ�� ������.  -->
</body>
</html>