<%@page import="java.sql.Timestamp"%>
<%@page import="com.javalec.ex.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="dto" class="com.javalec.ex.MemberDto"/>
<jsp:setProperty name="dto" property="*" /><!-- ��������Ϸ��� �� ��� �Ӽ���set�ϰڴ�  -->

<!-- dto�Ӽ��������� joinform���ִ� input�±��� �̸���� ������ *�� ������ set�̵ȴ�. -->
<%
		dto.setrDate(new Timestamp(System.currentTimeMillis()));
		MemberDao dao = MemberDao.getInstance();
		if(dao.confirmId(dto.getId()) == MemberDao.MEMBER_EXISTENT) { //1�̸� ���
%>
		<script language="javascript">
			alert("���̵� �̹� ���� �մϴ�.");
			history.back(); //�ڹٽ�ũ��Ʈ â history.back
		</script>
<%
		} else {//0�̸� else . ��ü�κ��� ȸ�������� db�� insert�Ѵ�.
			int ri = dao.insertMember(dto); //1�������� session�Ӽ����� ����
			if(ri == MemberDao.MEMBER_JOIN_SUCCESS) {
				session.setAttribute("id", dto.getId());
%>
			<script language="javascript">
				alert("ȸ�������� ���� �մϴ�.");
				document.location.href="login.jsp";
			</script>
<%
			} else {
%>
			<script language="javascript">
				alert("ȸ�����Կ� �����߽��ϴ�.");
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