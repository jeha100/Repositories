<%@page import="model.BoardDAO"%>
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
		request.setCharacterEncoding("EUC-KR");
	%>
	
	<!--�����͸� �ѹ��� �޾ƿ��� ��Ŭ������ ����ϵ���  -->
	<jsp:useBean id = "boardbean" class= "model.BoardBean">
		<jsp:setProperty name="boardbean" property = "*" />
	</jsp:useBean>
	
	<% 
		//������ ���̽��� ���� 
		BoardDAO bdao = new BoardDAO();
		
		//�ش� �Խñ��� �н����� ���� ����
		String pass = bdao.getPass(boardbean.getNum());
		
		//���� �н����� ���� update�� �ۼ��ߴ� pass���� ������ �� 
		if(pass.equals(boardbean.getPasword())){
			//������ �����ϴ� �޼ҵ� ȣ��
			bdao.updateBoard(boardbean);
			//������ �Ϸ�Ǹ� ��ü �Խñ� ���� 
			response.sendRedirect("BoardList.jsp");
		}else{//�н����尡 Ʋ���ٸ� 
	%>			
		<script type="text/javascript">	
			alert("�н����尡 ��ġ���� �ʽ��ϴ�. �ٽ� Ȯ���� ������ �ּ��� ");
			history.go(-1);
		</script>
	<% 		
		}
	%>
</body>
</html>