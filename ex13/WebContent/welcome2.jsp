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
		Cookie[] cookies = request.getCookies();
	
	for(int i = 0 ; i <cookies.length; i++ ){
		String id = cookies[i].getValue();
		if(id.equals("abc"))out.println(id + "�� �ȳ��ϼ���." + "<br />");
	}
	
	%>	<a href="logout2.jsp">�α׾ƿ�</a>
	
</body>
</html>