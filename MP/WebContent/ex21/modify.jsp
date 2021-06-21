<%@page import="com.javalec.ex21.MemberDto" %>
<%@page import="com.javalec.ex21.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
    request.setCharacterEncoding("EUC-KR");
    %>
<%
	String id = (String)session.getAttribute("id");//세션으로부터 가져온 회원마다고유한 id
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.getMember(id);//dao 겟맴버 멤버의 정보를 다가져와서해주어서 dto 객체로 반환해주죠! 아래서 dto.getadrress 쓴다.
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- dto객체로부터 하나 가져오고  -->
<form action="modifyOk.jsp" method="post" name="reg_frm">
		아이디 : <%= dto.getId() %><br /> 
		비밀번호 : <input type="password" name="pw" size="20"><br />
		비밀번호 확인 : <input type="password" name="pw_check" size="20"><br />
		이름 : <%= dto.getName() %><br />
		메일 : <input type="text" name="eMail" size="20" value="<%= dto.geteMail() %>"><br />
		주소 : <input type="text" name="address" size="50" value="<%= dto.getAddress() %>"><br />
		<input type="button" value="수정" onclick="updateInfoConfirm()">&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="javascript:window.location='login.jsp'">
	</form>
</body>
</html>