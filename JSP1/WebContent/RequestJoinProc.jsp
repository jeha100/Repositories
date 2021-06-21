<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
	<h2>회원 정보 보기</h2>
	
<%
	//post방식으로 데이터가 넘어올때 한글이 깨질수있기에
/*  	request.setCharacterEncoding("EUC-KR");*/
	//각종 사용자로부터 넘어온 데이터를 저장해줌
	String id = request.getParameter("id");
	String pass1 = request.getParameter("pass1");
	String pass2 = request.getParameter("pass2");
	String email = request.getParameter("email");
	String tell = request.getParameter("tell");
	
	//[]열 타입으로 리턴  체크박스의 이름! hobby를 넣으된다.
	String[] hobby = request.getParameterValues("hobby");
	String job = request.getParameter("job");
	String age = request.getParameter("age");
	String info = request.getParameter("info");
	

	if(!pass1.equals(pass2)){
		
		
%>
	<script type="text/javascript">
	 alert("비밀번호가 틀립니다.");//경고창
	history.go(-1);//이전페이지 이동
</script>
<%
	}
	 %>
<table width="500" border="1">
	<tr height="50">
		<td width="150" align="center"> 아이디</td>
		<td width="350" align="center">  <%=id %>
		</td>
	<tr height="50">
		<td width="150" align="center"> 이메일</td>
		<td width="350" align="center"> <%=email %>
		</td>
	<tr height="50">
		<td width="150" align="center"> 전화번호</td>
		<td width="350" align="center"> <%=tell %>
		</td>
		
	<tr height="50">
		<td width="150" align="center"> 당신의 관심분야</td>
		<td width="350" align="center"> 
		</td>
		<%
		 for(int i=0;i<hobby.length; i++){
			 out.write(hobby[i]+" ");
		 }
		
		%>
	<tr height="50">
		<td width="150" align="center"> 직업은</td>
		<td width="350" align="center"> <%=job %>
		</td>
	<tr height="50">
		<td width="150" align="center"> 연령</td>
		<td width="350" align="center"> <%=age %>
		</td>
		
	<tr height="50">
		<td width="150" align="center"> 하고픈말</td>
		<td width="350" align="center"> <%=info %>
		</td>
		
</table>


</center>
</body>
</html>