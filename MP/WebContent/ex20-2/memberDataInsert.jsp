<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%!Connection con;
	PreparedStatement pst;
	ResultSet rs;

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oralce:thin:@localhost:1521:xe";
	String uid = "scott";
	String upw = "tiger";%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
try{
	Class.forName(driver);
	con=DriverManager.getConnection(url,uid,upw);
	int n;
	String query="insert into memberforpre(id,pw,name,phone) values(?,?,?,?)";
	pst = con.prepareStatement(query);
	
	pst.setString(1,"aa");
	pst.setString(2,"111");
	pst.setString(3,"하지은");
	pst.setString(4,"010-555-5555");
	n= pst.executeUpdate();
	
	if(n == 1){
		out.println("insert success");
	}else{
		out.println("fail");
	}
}catch(Exception e){
	e.printStackTrace();
	
}finally{
	try{
		if(rs != null) rs.close();
		if(pst != null) pst.close();
		if(con != null) con.close();
	} catch(Exception e){}
}
%>
<br/>
<a href="memberDataView.jsp">회원정보 보기</a>

</body>
</html>