<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h2>ȭ�鿡 �������� ����Ͻÿ�</h2>


<%
	for(int i=2 ; i<10 ; i++){
		for(int j=1 ; j<10 ; j++){
	%>
	<%=i %> * <%=j %>=<%=i*j %> &nbsp;&nbsp;
<%
		}/*  System.out.println(i+"*"+j+"="+i*j);
*/ %>	
			 <br/>
<%	
		}
		%>
		<!--  System.out.println();
	-->
	}
 
%>




</body>
</html>