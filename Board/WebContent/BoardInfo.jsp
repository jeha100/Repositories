<%@page import="model.BoardBean"%>
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
		int num = Integer.parseInt(request.getParameter("num").trim());//���� ������ ���������� �ٲ�
		
		//������ ���̽� ����
		BoardDAO bdao = new BoardDAO();
		
		//boardbeanŸ������ �ϳ��� �Խñ��� ����
		BoardBean bean  = bdao.getOneBoard(num);
	%>
	
	<center>
		<h2>�Խñ� ����</h2>
			<table width = "600" border = "1" bgcolor="skyblue">
				<tr height = "40">
					<td width = "100" align ="center">�۹�ȣ </td>
					<td width = "180" align ="left"><%=bean.getNum()%></td>
					<td width = "120" align ="center">��ȸ�� </td>
					<td width = "180" align ="center"><%=bean.getReadcount()%> </td>
				</tr>
				
				<tr height = "40">
					<td width = "100" align ="center">�ۼ��� </td>
					<td width = "180" align ="left"><%=bean.getWriter()%></td>
					<td width = "120" align ="center">�ۼ��� </td>
					<td width = "180" align ="center"><%=bean.getReg_date()%> </td>
				</tr>
				
				<tr height = "40">
					<td width = "120" align ="center">�̸��� </td>
					<td colspan = "3" align ="center"><%=bean.getEmail()%></td>
				</tr>
								
				<tr height = "40">
					<td width = "120" align ="center">���� </td>
					<td colspan = "3" align ="center"><%=bean.getSubject()%></td>
				</tr>
				
				<tr height = "80">
					<td width = "120" align ="center">�� ���� </td>
					<td colspan = "3" align ="center"><%=bean.getContent()%></td>
				</tr>
				
				<tr height = "40">
					<td align ="center" colspan = "4">
						<input type="button" value="��۾���" 
						onclick="location.href='BoardReWriteForm.jsp?num=<%=bean.getNum()%>&ref=<%=bean.getRef()%>&re_stop=<%=bean.getRe_step()%>&re_level=<%=bean.getRe_level()%>'">   
						<input type="button" value="�����ϱ�" onclick="location.href='BoardUpdateForm.jsp?num=<%=bean.getNum()%>'"> 
						<input type="button" value="�����ϱ�" onclick="location.href='BoardDeleteForm.jsp?num=<%=bean.getNum()%>'"> 
						<input type="button" value="��Ϻ���" onclick="location.href='BoardList.jsp'">     
					</td>
				</tr>
		</table>
	</center>
</body>
</html>