<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="student2" class="com.javalec.ex.Student2" scope="page"></jsp:useBean>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:setProperty name="student2" property="name" value="ȫ�浿"/>
	<jsp:setProperty name="student2" property="age" value="11"/>
	<jsp:setProperty name="student2" property="name" value="3"/>
	<jsp:setProperty name="student2" property="name" value="28"/>
	
	
	�̸�:<jsp:getProperty name="student2" property="name" /><br />
	����:<jsp:getProperty name="student2" property="age" /><br />
	�г�<jsp:getProperty name="student2" property="grade" /><br />
	��ȣ:<jsp:getProperty name="student2" property="studentNum" />


</body>
</html>