<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<h2>�α��� ó��������</h2><!-- responseSendRedirect�� ����¼��� ������ ���� ������ ������Ը������ jsp��Ư  -->
<%
	request.setCharacterEncoding("EUC-KR");
	//���������� id�� pass�� ����
	String dbid ="aaaa";
	String dbpass="1111";
	
	//����ڷκ��� �Ѿ�� �����͸� �Է¹޾���
	String id= request.getParameter("id");
	String pass= request.getParameter("pass");
	
	if(dbid.equals(id) && dbpass.equals(pass)){
		
		//���̵�� �н����尡 ��ġ �ϴϱ� ���� �������� �����־�� �մϴ�.
		response.sendRedirect("ResponseMain.jsp?id="+id);//�Ķ���������� ���� �̰� get��� 
	}else{
%>
		<script>
			alert("���̵�� �н����尡 ��ġ ���� �ʽ��ϴ�.");
			history.go(-1);
		</script>
<%
	}
	
	%>

</body>
</html>