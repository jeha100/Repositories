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
		Cookie cookie = new Cookie("cookieN", "cookieV");
		cookie.setMaxAge(60*60);	//1�ð�
		response.addCookie(cookie);
		//Ŭ���̾�Ʈ�������� response����� �ɾ���������
		//��Ű�� ���޵Ǹ����� 
		//��Ű�������� request.getCookies(); �迭�� �д´�.
	%> 
	<!-- ����������Ű�� get
	�ִ����̶� response��ü����´�
	���� ������������ ��Ű ����Ǵ·����̽��� -->
	
	<a href="cookieget.jsp">cookie get</a>
	
</body>
</html>