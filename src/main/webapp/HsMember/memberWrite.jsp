<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지 화면</title>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
	
 	<script>
	
	$( function() {
	    $( "#birth" ).datepicker({
	      changeMonth: true,
	      changeYear: true
	    });
	} );
	
	
	
	$( function(){
		
		
		/*  아이디 체크 버튼 클릭 시... */
		$("#btn_idcheck").click( function() {
			
			var userid = $.trim($("#userid").val());
			
			if(userid == ""){
				alert("아이디를 입력해주세요.");
				$("#userid").focus();
				return false;
			}
			
			//idcheck.do
				$.ajax({
					type : "POST",
					data : "userid="+userid, //json타입
					url : "idcheck.do",
					dataType : "text",
					success : function(result){
						if(result == "ok"){
							alert("사용가능한 아이디입니다.");
						}else{
							alert("사용할 수 없는 아이디입니다.");
						}
					},
					error : function(){
						alert("오류발생");
					}
					
					
				});
			
		});
		
		
		/* 가입 버튼을 클릭했을 시... */
	    $("#btn_submit").click(function() {
	    	
			var userid = $("#userid").val();
			var pass = $("#pass").val();
			var name = $("#name").val();
	    	userid = $.trim(userid);
	    	pass = $.trim(pass);
	    	name = $.trim(name);
	    	if(userid == ""){
	    		alert("아이디를 입력해주세요");
	    		$("#userid").focus();
	    		return false;
	    	}
	    	if(pass == ""){
	    		alert("패스워드를 입력해주세요");
	    		$("#pass").focus();
	    		return false;
	    	}
	    	if(name == ""){
	    		alert("이름을 입력해주세요");
	    		$("#name").focus();
	    		return false;
	    	}
	    	
	    	$("#userid").val(userid);
	      	$("#pass").val(pass);
	      	$("#name").val(name);
	      	
	      	//회원가입 처리를 위한 ajax
	      	
	      	var formData = $("#frm").serialize();
	      	
	      	$.ajax({
	      		type : "POST",
	      		data : formData,
	      		url : "memberWriteSave.do",
	      		dataType : "text",
	      		success : function(result){ //성공했을 경우
	      			if(result == "ok"){
	      				alert("가입완료");
	      				location : "loginWrite.do" ;
	      			}else{
	      				alert("가입 실패 \n 관리자에게 문의주세요");
	      			}
	      		},
	      	
	      		error : function() {
	      			alert("오류가 발생했습니다. 관리자에게 문의 혹은 잠시 후에 시도해주세요");
	      		}
	      	});
	    	
	    });
		
	});
	
	</script> 

</head>
<link type="text/css" rel="stylesheet" href="css/headerStyle.css" />
<style>
	table {
	    margin-left:auto; 
	    margin-right:auto;
		border-collapse: collapse;
		margin-top : 20px;
		width:800px;
	}
	table caption {
		font-size: 20px;
		margin : 15px 0px;
		font-weight: bold;
		color : #84817a;
	}
	th, td {border : 1px solid black;padding : 5px;font-size : 15px;line-height: 1.9}
	th { background-color : #7f8c8d;}	
	.main_td_title{
		font-size : 26px;
		font-weight: bold;
		color:#2d98da;
		text-align:center;
		letter-spacing: -1px;
	}
	.main_td_content{color : #84817a;font-size : 16px;}
	.div_button{text-align : center;margin-top : 10px;}
	.btn1 { 
		font-size:9pt;
		padding : 3px;
		width : 100px;
		background-color : 7f8c8d;
		border-radius: 5px;
	}
	.btn2 { 
		font-size:9pt;
		padding : 3px;
		margin : 0px 10px;
		width : 100px;
		background-color : 7f8c8d;
		border-radius: 5px;
	}

</style>
<body>
<div class="wrapper">


	<%@ include file="../include/topBar.jsp" %>
	
	
	<header>
	<%@ include file="../include//header.jsp" %>
	</header>
	
<section>
<form id="frm" name="frm">
	<table>
		<caption>회원가입</caption>
		
		<tr>
			<th>아이디</th>
			<td>
			<input type="text" name="userid" id="userid">
			<button type="button" class="btn1" id="btn_idcheck">아이디중복체크</button>
			</td>
		</tr>
		
		<tr>
			<th>패스워드</th>
			<td><input type="password" name="pass" id="pass"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" id="name"></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
			<input type="radio" name="gender" id="gender" value="M">남
			<input type="radio" name="gender" id="gender" value="F">여
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input type="text" name="birth" id="birth"></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" name="phone" id="phone"> (예)010-1234-1234</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td>
			<input type="text" name="zipcode" id="zipcode">
			<button type="button" class="btn1" id="btn_zipcode">우편번호검색</button>
			<br>
			<input type="text" name="address" id="address">
			</td>
		</tr>
		<tr>
			<td colspan="2" style="border : none;">
			<div class="div_button">
				<button type="button" class="btn2">저장</button>
				<button type="reset" class="btn2">취소</button>
			</div>
			</td>
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
