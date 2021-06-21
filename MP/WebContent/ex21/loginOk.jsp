	<%@page import="com.javalec.ex21.MemberDto"%>
<%@page import="com.javalec.ex21.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
		pageEncoding="EUC-KR"%>
	
<%
	  request.setCharacterEncoding("EUC-KR");
	  String id = request.getParameter("id");
	  String pw = request.getParameter("pw");
	  
	  MemberDao dao=MemberDao.getInstance();
	  int checkNum = dao.userCheck(id,pw);
	  if(checkNum == -1){
 %>
	<script language="javascript">
		alert("아이디가 존재하지 않습니다.");
		history.go(-1);
	</script>
<%
	  }else if(checkNum==0){
%>
	
		<script language="javascript">
			alert("비밀번호가 틀립니다.");
			history.go(-1);
		</script>
<%
	} else if(checkNum == 1) {
		MemberDto dto = dao.getMember(id); //가입이정상적인경우에 회원정보를 가져오고요
		
		if(dto == null) { //한번더 검증  못가져왔거나 예외처리라면 뒤로보낸다.
%>
		<script language="javascript">
			alert("존재하지 않는 회원 입니다.");
			history.go(-1);
		</script>
	
	<%
	  }else{
		  String name = dto.getName();
		  session.setAttribute("id",id);
		  session.setAttribute("name",name);
		  session.setAttribute("ValidMem","yes");
		  response.sendRedirect("main.jsp");
	  }
	}
	  	%>
	
	
	
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	</head>
	<body>
	
	</body>
	</html>