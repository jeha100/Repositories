<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
<%@ page import="db.CarListBean"%>
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
	<!-- ROWNUM ORDER BY VIEW�̿��ؼ� 3�� �����͵��� Ȥ�� ORDERBY �ؼ�
 �ڽ� �� ������ ���� ���� �� �θ� �ȴ� IF 3���� �ݺ��� �׸����ÿ�.
 ������ Ȥ�� ���α׷��������� �Ǵ��� ���ϴ´�� ����ȴ�. ������ SQL���� ����-->


	<!--������ ���̽��� �����Ͽ� �ֽż� �ڵ��� 3�븸 �ѷ��ִ� �����͸� ������   -->
	<%
	RentcarDAO rdao = new RentcarDAO(); //�迭(������Ʈ�ιްų� ī����Ʈ������ �ްų�)�̳� ���ͻ�밡��
	//
	
	//����(����)�� �̿��Ͽ� �ڵ����� ���� 
	Vector <CarListBean> v = rdao.getSelectCar();
	//����ͼ� �Ʒ� ȭ�鿡 �Ѹ����ڵ�
	%>
<table	width ="1000" border="1">
				<tr height="100">
					<td align="center"colspan="3">
						<font size="7" color="gray">�ֽ��� �ڵ���</font>
					</td>
				</tr>
				
	<%		for(int i = 0;i<v.size();i++){ 
					CarListBean bean = v.get(i);
		%>
					<td width="333" align="center" border="1">
						<a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
							<img alt="" src="images/<%=bean.getImg()%>" width="300" height="200">
						</a><p>
						�������� : <%=bean.getName()%>
					</td>		
		<% 			
			}
		%>
			</table>
			
			<p>
			<font size ="4" color="gray"><b>���� �˻� �ϱ�</b></font><br><br>
			<form action="RentcarMain.jsp?center=CarCategoryList.jsp" method="post">
			<font size ="3" color="gray"><b>���� �˻� �ϱ�</b></font>&nbsp;&nbsp;
			
			<select name="category">
				<option value="1">����</option>
				<option value="2">����</option>
				<option value="3">����</option>
			</select>
			<input type="submit" value="�˻� ">&nbsp;&nbsp;
			
			</form>
			<button onclick="location.href='RentcarMain.jsp?center=CarAllList.jsp'">��ü �˻�</button>	
</table>
</center>
</body>
</html>