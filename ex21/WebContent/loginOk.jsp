<%@page import="com.javalec.ex.MemberDto"%>
<%@page import="com.javalec.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    
  <!-- id pw �������� getinstance�ϰ� usercheck�Ѵ�. -->  
<%
	request.setCharacterEncoding("EUC-KR");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDao dao = MemberDao.getInstance();
	int checkNum = dao.userCheck(id, pw);
	//-1 0 1 
	if(checkNum == -1) {
%>
		<script language="javascript">
			alert("���̵� �������� �ʽ��ϴ�.");
			history.go(-1);
		</script>
<%
	} else if(checkNum == 0) {
%>
		<script language="javascript">
			alert("��й�ȣ�� Ʋ���ϴ�.");
			history.go(-1);
		</script>
<%
	} else if(checkNum == 1) {
		MemberDto dto = dao.getMember(id); //�������������ΰ�쿡 ȸ�������� ���������
		
		if(dto == null) { //�ѹ��� ����  �������԰ų� ����ó����� �ڷκ�����.
%>
		<script language="javascript">
			alert("�������� �ʴ� ȸ�� �Դϴ�.");
			history.go(-1);
		</script>
<%
		} else { //�����̸� ȸ���� name �����´�. ���ǿ� id name �Ӽ� �ְ� main.jsp�� ������.
			String name = dto.getName();
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("ValidMem", "yes");
			response.sendRedirect("main.jsp");
			//������ ��� �������ش�. ->main.jsp
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