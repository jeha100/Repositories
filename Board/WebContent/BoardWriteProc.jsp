<%@page import="model.BoardDAO"%>
<%@page import="model.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>

	<%
	request.setCharacterEncoding("euc-kr");
	%>

	<!-- �Խñ� �ۼ��� �����͸� �ѹ��� �о�帲 -->
	<jsp:useBean id="boardbean" class="model.BoardBean">
		<jsp:setProperty name="boardbean" property="*" />
	</jsp:useBean>

	<%
	//������ ���̽� ������ ��Ŭ������ �Ѱ���
	BoardDAO bdao = new BoardDAO();

	//������ ���� �޼ҵ带 ȣ��
	bdao.insertBoard(boardbean);
	
	//�Խñ� ������ ��ü �Խñ� ����
	response.sendRedirect("BoardList.jsp");
	%>
	
	
</body>
</html>