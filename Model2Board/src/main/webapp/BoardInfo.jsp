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
		<h2>�Խñ� ����</h2>
		<table width="600" border="1">
			<tr height="40">
				<td width="100" align="center">�۹�ȣ</td>
				<td width="180" align="left">${bean.num}</td>
				<td width="120" align="center">��ȸ��</td>
				<td width="180" align="center">${bean.readcount}</td>
			</tr>

			<tr height="40">
				<td width="100" align="center">�ۼ���</td>
				<td width="180" align="left">${bean.write}</td>
				<td width="120" align="center">�ۼ���</td>
				<td width="180" align="center">${bean.reg_date}</td>
			</tr>

			<tr height="40">
				<td width="120" align="center">�̸���</td>
				<td colspan="3" align="center">${bean.email}</td>
			</tr>

			<tr height="40">
				<td width="120" align="center">����</td>
				<td colspan="3" align="center">${bean.subject}</td>
			</tr>

			<tr height="80">
				<td width="120" align="center">�� ����</td>
				<td colspan="3" align="center">${bean.content}</td>
			</tr>

			<tr height="40">
				<td align="center" colspan="4"><input type="button"
					value="��۾���"
					onclick="location.href='BoardReWriteCon.do?num=${bean.num}&ref=${bean.ref}&re_stop=${bean.re_step}&re_level=${bean.re_level}'">
					<input type="button" value="�����ϱ�"
					onclick="location.href='BoardUpdateCon.do?num=${bean.num}'">
					<input type="button" value="�����ϱ�"
					onclick="location.href='BoardDeleteCon.do?num=${bean.num}'">
					<input type="button" value="��Ϻ���"
					onclick="location.href='BoardListCon.do'"></td>
			</tr>
		</table>
	</center>
</body>
</html>