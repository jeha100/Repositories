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
			alert("로그인후 예약이 가능합니다.");
			location.href="RentcarMain.jsp?center=MemberLogin.jsp";
		</script>	
	<% 	
		}
		//날찌 비교 util패키지 date클래스
		Date d1 = new Date();//객체생성- simpledateformat클래스이용
		Date d2 = new Date();
		//날짜를 2016-4-4 포멧(변환) 해주는 클래스 선언		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		d1 = sdf.parse(rbean.getRday());//string타입으로 나오니 parsing해서  "yyyy-MM-dd"패턴으로 바뀜
		d2 = sdf.parse(sdf.format(d2));
		//날짜 비교 매소드를 사용
		
		int compare = d1.compareTo(d2); //기존날짜가 d1 현재보다 크다면d2
		//에약 하려는 날짜보다 현재 날짜가  크다면 -1 
		//예약하려는 날짜와 현재 날짜가 같다면 0
		//예약하려는 날짜가 더 크다면 1을 리턴 
		System.out.println(compare);
		
		if(compare < 0){//오늘보다 이전 날짜 선택시 예약 불가표시 스크립트
			
	%>	
			<script>
				alert("현재 시스템 날짜보다 이전 날짜는 선택할수 없음");
				history.go(-1);//전단계로
			</script>	
	<% 	
		}
		//결과적으로 아무 문제가 없다면 데이터를 저장후 결과 페이지 보여주기 
		//아이디 값이 빈클래스에 없기에 
		String id1 = (String)session.getAttribute("id");
		rbean.setId(id1);//가지고와야함
		
		//데이터 베이스에 빈 클래스를 저장 
		RentcarDAO rdao = new RentcarDAO();//데이터객체생성하지 않아 객체생성
		rdao.setReserveCar(rbean);//메소드만들어집어넣라
		
		//차량 정보 얻어오기 
		CarListBean cbean = rdao.getOneCar(rbean.getNo());
		
		//차량 총 금액
		int totalcar = cbean.getPrice()*rbean.getQty()*rbean.getDday();
		//옵션 금액
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
					<font size="6" color="gray">차량 예약 완료 화면</font>
				</td>
			</tr>
			
			<tr height="100">
				<td align="center">
					<img alt="" src="img/<%=cbean.getImg()%>"  width="470">
				</td>
			</tr>
			
			<tr height="50">
				<td align="center">
					<font size="5" color="red">차량 총예약 금액<%=totalcar%>원 </font>
				</td>
			</tr>
			
			<tr height="50">
				<td align="center">
					<font size="5" color="red">차량 총옵션 금액<%=totaloption %>원 </font>
				</td>
			</tr>
			
			<tr height="50">
				<td align="center">
					<font size="5" color="red">차량 총 금액<%=totaloption+totalcar%>원 </font>
				</td>
			</tr>
		</table>
	</center>

</body>
</html>