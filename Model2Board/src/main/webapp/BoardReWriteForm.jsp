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
	<h2>�亯�� �Է��ϱ�</h2>
	<form action="BoardReWriteProcCon.do" method="post">
		<table width="600" border="1" bordercolor="gray" >
			<tr height = "40">
				<td width="150" align="center"> �ۼ���</td>
				<td width="450"><input type ="text" name="write" size ="60"></td>
			</tr>
			
			<tr height = "40">
				<td width="150" align="center">����</td>
				<td width="450"><input type ="text" name="subject"  value ="[�亯]" size ="60"></td>
			</tr>
			
			<tr height = "40">
				<td width="150" align="center">�̸���</td>
				<td width="450"><input type ="email" name="email" size ="60"></td>
			</tr>
			
			<tr height = "40">
				<td width="150" align="center">��� ��ȣ</td>
				<td width="450"><input type ="password" name="password" size ="60"></td>
			</tr>
		
			<tr height = "40">
				<td width="150" align="center">�� ����</td>
				<td width="450"><textarea rows="10" cols="60" name="content"></textarea></td>
			</tr>
			
			<!--form���� ����ڷκ��� �Է¹��� �ʰ� �����͸� �ѱ� -->
			<tr height ="40">
				<td align ="center" colspan="2">
					<input type="hidden" name ="ref" value="${ref}">
					<input type="hidden" name ="re_step" value="${re_step}">
					<input type="hidden" name ="re_level" value="${re_level}">
					<input type="submit" value="��� ���� �Ϸ�">&nbsp;&nbsp;
					<input type="reset" value="���">
					<input type="button" onclick="location.href='BoardListCon.do'" value="��ü�ۺ���">
				</td>
			</tr>
		</table>
	</form>
	</center>
</body>
</html>