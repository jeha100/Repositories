<%@page import="java.sql.Timestamp"%>
<%@page import="com.javalec.ex.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="dto" class="com.javalec.ex.MemberDto"/>
<jsp:setProperty name="dto" property="*" /><!-- 내가사용하려는 빈에 모든 속성을set하겠다  -->

<!-- dto속성변수명들과 joinform에있는 input태그의 이름들과 같으면 *를 찍으면 set이된다. -->
<%
		dto.setrDate(new Timestamp(System.currentTimeMillis()));
		MemberDao dao = MemberDao.getInstance();
		if(dao.confirmId(dto.getId()) == MemberDao.MEMBER_EXISTENT) { //1이면 경고
%>
		<script language="javascript">
			alert("아이디가 이미 존재 합니다.");
			history.back(); //자바스크립트 창 history.back
		</script>
<%
		} else {//0이면 else . 객체로부터 회원정보를 db에 insert한다.
			int ri = dao.insertMember(dto); //1과같으면 session속성으로 저장
			if(ri == MemberDao.MEMBER_JOIN_SUCCESS) {
				session.setAttribute("id", dto.getId());
%>
			<script language="javascript">
				alert("회원가입을 축하 합니다.");
				document.location.href="login.jsp";
			</script>
<%
			} else {
%>
			<script language="javascript">
				alert("회원가입에 실패했습니다.");
				document.location.href="login.jsp";
			</script>
<%
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