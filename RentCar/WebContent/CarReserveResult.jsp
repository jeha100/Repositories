<%@page import="db.CarListBean"%>
<%@page import="db.RentcarDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
		request.setCharacterEncoding("UTF-8");
	%>
	
	<jsp:useBean id ="rbean" class="db.CarReserveBean">
		<jsp:setProperty name ="rbean" property="*" />
	</jsp:useBean>
	
	<% 
		String id = (String)session.getAttribute("id");
		if(id==null){
	%>	
		<script>
			alert("�α����� ������ �����մϴ�.");
			location.href="RentcarMain.jsp?center=MemberLogin.jsp";
		</script>	
	<% 	
		}
		//���� �� util��Ű�� dateŬ����
		Date d1 = new Date();//��ü����- simpledateformatŬ�����̿�
		Date d2 = new Date();
		//��¥�� 2016-4-4 ����(��ȯ) ���ִ� Ŭ���� ����		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		d1 = sdf.parse(rbean.getRday());//stringŸ������ ������ parsing�ؼ�  "yyyy-MM-dd"�������� �ٲ�
		d2 = sdf.parse(sdf.format(d2));
		//��¥ �� �żҵ带 ���
		
		int compare = d1.compareTo(d2); //������¥�� d1 ���纸�� ũ�ٸ�d2
		//���� �Ϸ��� ��¥���� ���� ��¥��  ũ�ٸ� -1 
		//�����Ϸ��� ��¥�� ���� ��¥�� ���ٸ� 0
		//�����Ϸ��� ��¥�� �� ũ�ٸ� 1�� ���� 
		System.out.println(compare);
		
		if(compare < 0){//���ú��� ���� ��¥ ���ý� ���� �Ұ�ǥ�� ��ũ��Ʈ
			
	%>	
			<script>
				alert("���� �ý��� ��¥���� ���� ��¥�� �����Ҽ� ����");
				history.go(-1);//���ܰ��
			</script>	
	<% 	
		}
		//��������� �ƹ� ������ ���ٸ� �����͸� ������ ��� ������ �����ֱ� 
		//���̵� ���� ��Ŭ������ ���⿡ 
		String id1 = (String)session.getAttribute("id");
		rbean.setId(id1);//������;���
		
		//������ ���̽��� �� Ŭ������ ���� 
		RentcarDAO rdao = new RentcarDAO();//�����Ͱ�ü�������� �ʾ� ��ü����
		rdao.setReserveCar(rbean);//�޼ҵ常�������ֶ�
		
		//���� ���� ������ 
		CarListBean cbean = rdao.getOneCar(rbean.getNo());
		
		//���� �� �ݾ�
		int totalcar = cbean.getPrice()*rbean.getQty()*rbean.getDday();
		//�ɼ� �ݾ�
		int usein = 0;
		if(rbean.getUsein()==1){usein=10000;}
		int usewifi =  0;
		if(rbean.getUsein()==1){usewifi=10000;}
		int useseat =  0;
		if(rbean.getUsein()==1){useseat=10000;}		
		int totaloption = (rbean.getQty()*rbean.getDday())*(usein+usewifi+useseat);
	%>
	
	<center>
		<table width="1000">
			<tr height="100">
				<td align="center">
					<font size="6" color="gray">���� ���� �Ϸ� ȭ��</font>
				</td>
			</tr>
			
			<tr height="100">
				<td align="center">
					<img alt="" src="img/<%=cbean.getImg()%>"  width="470">
				</td>
			</tr>
			
			<tr height="50">
				<td align="center">
					<font size="5" color="red">���� �ѿ��� �ݾ�<%=totalcar%>�� </font>
				</td>
			</tr>
			
			<tr height="50">
				<td align="center">
					<font size="5" color="red">���� �ѿɼ� �ݾ�<%=totaloption %>�� </font>
				</td>
			</tr>
			
			<tr height="50">
				<td align="center">
					<font size="5" color="red">���� �� �ݾ�<%=totaloption+totalcar%>�� </font>
				</td>
			</tr>
		</table>
	</center>

</body>
</html>