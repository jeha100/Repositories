<%@page import="db.CarViewBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- �α��εǾ��ִ��� Ȯ�� -->
	<% 
	
		String id  =(String)session.getAttribute("id");
		
		if(id ==null){		
	%>  
	<script>
		alert("�α����� ���� ���ּ���");
		location.href = 'RentcarMain.jsp?center=MemberLogin.jsp';
	</script>
	<% 
		}
		//�α��� �Ǿ��ִ� ���̵� �о�� ���������ؼ�
		RentcarDAO rdao = new RentcarDAO(); //id���� ���������� 
		Vector<CarViewBean> v = rdao.getAllReserve(id); //�������������Ҽ�����
	%>
	
	<center>
		<table width="1000">
			<tr height="100">
				<td align="center" colspan="11">
					<font size="6" color="gray">���� ���� �Ϸ� ȭ��</font>
				</td>
			</tr>
		</table>
		
		<table width="1000" border="1">
			<tr height="40">
				<td width="150"align="center">�̹��� </td>
				<td width="150"align="center">�̸� </td>
				<td width="150"align="center">�뿩��</td>
				<td width="60"align="center">�뿩�Ⱓ</td>
				<td width="100"align="center">�ݾ�</td>
				<td width="60"align="center">����</td>
				<td width="60"align="center">����</td>
				<td width="60"align="center">wifi����</td>
				<td width="60"align="center">�׺���̼�</td>
				<td width="60"align="center">���̺��Ʈ����</td>
				<td width="90"align="center">����</td>
			</tr>
			
	<% 
			for(int i =0 ; i< v.size() ; i++){			
				CarViewBean bean = v.get(i);
	%>
			<tr height="60">
				<td width="150"align="center"><img alt ="" src="img/<%=bean.getImg()%>"  width="120" height="70"></td>
				<td width="150"align="center"><%=bean.getName()%></td>
				<td width="150"align="center"><%=bean.getDday()%></td>
				<td width="60"align="center"><%=bean.getRday()%></td>
				<td width="100"align="center"><%=bean.getPrice()%></td>
				<td width="60"align="center"><%=bean.getQty()%></td>
				<td width="60"align="center"><%=bean.getUserin()%></td>
				<td width="60"align="center"><%=bean.getUsewifi()%></td>
				<td width="60"align="center"><%=bean.getUsenavi()%></td>
				<td width="60"align="center"><%=bean.getUseseat()%></td>
				<td width="90"align="center"><button onclick="location.href='?id=<%=id%>&rday=<%=bean.getRday()%>'">����</button></td>
			</tr><!-- id rday ������ �Ѱ��ֱ� -->CarReserveDel.jsp
	<% 		
			}
	%>
			</table>
	</center>	
</body>
</html>