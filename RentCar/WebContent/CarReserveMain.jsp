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
	<!-- ROWNUM ORDER BY VIEW이용해서 3개 가져와도됨 혹은 ORDERBY 해서
 박스 에 사이즈 개수 제한 을 두면 된다 IF 3개면 반복문 그만도시오.
 쿼리문 혹은 프로그래밍적으로 되느냐 원하는대로 쓰면된다. 성능은 SQL문이 좋다-->


	<!--데이터 베이스에 연결하여 최신순 자동차 3대만 뿌려주는 데이터를 가져옴   -->
	<%
	RentcarDAO rdao = new RentcarDAO(); //배열(오브젝트로받거나 카리스트빈으로 받거나)이나 벡터사용가능
	//
	
	//벡터(가방)를 이용하여 자동차를 결정 
	Vector <CarListBean> v = rdao.getSelectCar();
	//갖고와서 아래 화면에 뿌리는코드
	%>
<table	width ="1000" border="1">
				<tr height="100">
					<td align="center"colspan="3">
						<font size="7" color="gray">최신형 자동차</font>
					</td>
				</tr>
				
	<%		for(int i = 0;i<v.size();i++){ 
					CarListBean bean = v.get(i);
		%>
					<td width="333" align="center" border="1">
						<a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
							<img alt="" src="images/<%=bean.getImg()%>" width="300" height="200">
						</a><p>
						차량명은 : <%=bean.getName()%>
					</td>		
		<% 			
			}
		%>
			</table>
			
			<p>
			<font size ="4" color="gray"><b>차량 검색 하기</b></font><br><br>
			<form action="RentcarMain.jsp?center=CarCategoryList.jsp" method="post">
			<font size ="3" color="gray"><b>차량 검색 하기</b></font>&nbsp;&nbsp;
			
			<select name="category">
				<option value="1">소형</option>
				<option value="2">중형</option>
				<option value="3">대형</option>
			</select>
			<input type="submit" value="검색 ">&nbsp;&nbsp;
			
			</form>
			<button onclick="location.href='RentcarMain.jsp?center=CarAllList.jsp'">전체 검색</button>	
</table>
</center>
</body>
</html>