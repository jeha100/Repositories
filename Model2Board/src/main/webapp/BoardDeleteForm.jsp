<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
	<form action = "BoardDeleteProCon.do" method="post">
		<table width = "600" border = "1">
			<tr height= "40">
				<td width="120" align="center">�н�����</td>
				<td width="480" colspan="3">&nbsp;<input type="password" name="pass" size="60"></td>
			</tr>
					
			<tr height="40">
				<td align ="center" colspan="4">
					<input type ="hidden" name ="num" value="${bean.num}">
					<input type ="hidden" name ="password" value="${bean.password}">
					
					<input type ="submit" value="�ۻ���">&nbsp;&nbsp;
					<input type ="button" onclick="location.href='BoardListCon.do'"value="��Ϻ��� ">
				</td>
			</tr>
		</table>
	</form>
</center>
</body>
</html>