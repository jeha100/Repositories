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
		<h2> 계산기 </h2>
		<form action="ElCulProc.jsp"method="post"> 
		<table width="400">
			<tr height="40">
				<td align="center" width="100"><input type="text" name="exp1"> </td>
				<td align="center" width="100"><select name="exp2"> 
											<option value="+">+</option> 
											<option value="-">-</option> 
											<option value="*">*</option> 
											<option value="/">/</option> 
											

				</select> </td>
				<td align="center" width="100"><input type="text" name="exp3"> </td>
				<td align="center" width="100"><input type="submit" value="결과보기"> </td>
							
					
		
		
		</table>
		
		</form>
		
		
		
		
	</center>
</body>
</html>