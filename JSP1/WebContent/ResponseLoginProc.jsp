<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<h2>로그인 처리페이지</h2><!-- responseSendRedirect를 만드는순간 윗줄의 버퍼 내용이 사라지게만들어짐 jsp종특  -->
<%
	request.setCharacterEncoding("EUC-KR");
	//임의적으로 id와 pass를 설정
	String dbid ="aaaa";
	String dbpass="1111";
	
	//사용자로부터 넘어온 데이터를 입력받아줌
	String id= request.getParameter("id");
	String pass= request.getParameter("pass");
	
	if(dbid.equals(id) && dbpass.equals(pass)){
		
		//아이디와 패스워드가 일치 하니까 메인 페이지를 보어주어야 합니다.
		response.sendRedirect("ResponseMain.jsp?id="+id);//파라미터측에서 전달 이게 get방식 
	}else{
%>
		<script>
			alert("아이디와 패스워드가 일치 하지 않습니다.");
			history.go(-1);
		</script>
<%
	}
	
	%>

</body>
</html>