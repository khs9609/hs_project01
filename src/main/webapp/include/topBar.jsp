<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 	<script src="/hs_project01/script/jquery-1.12.4.js"></script>
	<script src="/hs_project01/script/jquery-ui.js"></script>
</head>
<script>
	
	$(function(){
		
		$("#logout_link").click(function(){
			if(confirm("정말로 로그아웃하시겠습니까?") ){
				location="logout.do";
			}
		});
	});
		
</script>
<body>

<%

String USERID = (String) session.getAttribute("SessionUserId");

%>
	<div class="top_bar">
		<div class="top_bar_menu">
			<a href="#">welcome</a>
		</div>
		
		<div class="top_bar_login">
			<%
			if(USERID == null) {
			%>
			<a href="loginWrite.do">로그인</a>
			<a href="memberWrite.do">회원가입</a>
			<%
			}else{ 
			%>
			<a href="#">회원정보수정</a>
			<a href="#" id="logout_link">로그아웃</a>
			<% 
			} 
			%>
		</div>
	</div>
</body>
</html>