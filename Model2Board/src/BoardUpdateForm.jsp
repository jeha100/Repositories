<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<center>
	<h2> �Խñ� ����</h2>
	<form action="BoardUpdateProcCon.do" method ="post">
		<table width = "600" border = "1">
			<tr height= "40">
				<td width="120" align="center">�ۼ���</td>
				<td width="180" align="center">${bean.write}</td>
				<td width="120" align="center">�ۼ���</td>
				<td width="180" align="center">${bean.reg_date}</td>
			</tr>
			
			<tr height= "40">
				<td width="120" align="center">����</td>
				<td width="480" colspan="3">&nbsp;<input type="text" name="subject" value="${bean.subject}" size="60"></td>
			</tr>
			
			<tr height= "40">
				<td width="120" align="center">�н�����</td>
				<td width="480" colspan="3">&nbsp;<input type="pasword" name="pass" size="60"></td>
			</tr>
			
			<tr height= "40">
				<td width="120" align="center">�۳���</td>
				<td width="480" colspan="3"><textarea rows="10" cols="60" name="content" align="left">${bean.content}</textarea></td>
			</tr>
			
			<tr height= "40">
				<td colspan="4" align="center">
					<input type="hidden" name="num" value="${bean.num}">
					<input type="hidden" name="pasword" value="${bean.pasword}">
					
					<input type="submit" value="�ۼ���">&nbsp;&nbsp;
					<input type="button" onclick = "location.href='BoardListCon.do'" value="��ü �� ����">
				</td>
			</tr>
		</table>
	</form>
</center>
</body>
</html>