<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지 화면</title>

<script src="/hs_project01/script/jquery-1.12.4.js"></script>
<script src="/hs_project01/script/jquery-ui.js"></script>

</head>
<link type="text/css" rel="stylesheet" href="css/headerStyle.css" />
<style>
table caption {
	font-size: 20px;
	margin : 15px 0px;
	font-weight: bold;
	color : #84817a;
}
table {
    margin-left:auto; 
    margin-right:auto;
	width : 400px; 
	border-collapse: collapse;
	margin-top : 20px;
}
th, td { 
	padding : 5px;
	color : 84817a;
	height : 50px;
	padding : 5px;
	text-align:center;
}
th { 
	background-color : #7f8c8d;
}
.input1 {
	width : 90%;
	height : 45px;
	text-align :center;
}
textarea {
	width : 95%;
	height : 70px;
}
button { 
font-size:9pt;
padding : 3px;
width : 100px;
background-color: #4b6584;
color : white;
border-radius: 5px;
}

.btn_login{
	width : 358px;
	height : 30px;
	background-color: #2d98da;
}
.remember_id {
	text-align : left;
	padding-left : 17px;
	height : 20px;
}
</style>


<script>
$(function(){
	$("#btn_del").click(function(){
			
		var pass = $("#pass").val();
		pass = $.trim(pass);
		
		if(pass == ""){
			alert("패스워드를 입력해주세요!");
			$("#pass").focus();
			return false;
		}
		
		var sendData = "unq=${unq}&pass="+pass;
		
		// 비동기 전송방식의 기능을 가지고 있는 jquery의 함수
		$.ajax({
			type : "POST",
			data : sendData,
			url : "boardDelete.do", // 실제경로 , 저장주소
			dataType : "text", //리턴 타입
			success : function(data){ //성공했을 경우  //controller -> "ok","fail" //변수는 무엇을 넣어도 됌
				if(data == "1") {
					alert("삭제완료");
					location="boardList.do";
				} else if(data == "-1"){
					alert("패스워드가 일치하지 않습니다.");
				}else {
					alert("저장실패");				
				}
			},
			error : function() { // 실패했을 경우
				alert("오류발생"); //여기서의 오류가 뜬다면 거의 시스템 오류일 것이다.(장애발생)
			}
		});
		
	})
}) 
	
	
</script>

<body>
<div class="wrapper">
	<%@ include file="../include/topBar.jsp" %>
	<header>
	<%@ include file="../include/header.jsp" %>
	</header>
	
	<section>
	
	<form id="frm">
		<table>
		<caption>로그인</caption>
			<tr>
				<td><input type="text" id="userid" class="input1"  placeholder="아이디를 입력해주세요"></td>
			</tr>
			<tr>
				<td><input type="password" id="pass" class="input1" placeholder="패스워드를 입력해주세요"></td>
			</tr>
			<tr>
				<td>
					<button type="button" id="btn_login" class="btn_login">로그인</button>
				</td>
			</tr>
			<tr>
				<td class="remember_id"><input type="checkbox" name="remember_id" id="remember_id">아이디 기억하기</td>
			</tr>
		</table>
	</form>
	
	</section>
	
	<footer>
		(2021) copyright 김효섭 [ 울산광역시 남구 무거동 인근 ] <br>
		Tel. 010-0000-0000
	</footer>

</div>
</body>
</html>