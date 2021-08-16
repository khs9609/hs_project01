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
	width : 1000px; 
	border-collapse: collapse;
	margin-top : 20px;
}
th, td { 
	border: 1px solid black;
	padding : 5px;
	color : 84817a;
	height : 50px;
	padding : 5px;
}
th { 
	background-color : #7f8c8d;
}
.input1 {
	width : 98%;
	height : 25px;
}
textarea {
	width : 98%;
	height : 70px;
}
button { 
font-size:9pt;
padding : 3px;
width : 100px;
background-color : 7f8c8d;
border-radius: 5px;
}
</style>


<script>
function fn_submit() {
	
	if($.trim( $("#title").val()) == "") {
		alert("제목을 입력해주세요");
		$("#title").focus();
		return false;
	}
	
	if($.trim( $("#pass").val()) == "") {
		alert("제목을 입력해주세요");
		$("#pass").focus();
		return false;
	}
	
	var formData = $("#frm").serialize();
	
	// 비동기 전송방식의 기능을 가지고 있는 jquery의 함수
	$.ajax({
		type : "POST",
		data : formData,
		url : "boardWriteSave.do", // 실제경로 , 저장주소
		dataType : "text", //리턴 타입
		success : function(data){ //성공했을 경우  //controller -> "ok","fail"
			if(data == "ok") {
				alert("저장완료");
				location="boardList.do";
			} else {
				alert("저장실패");				
			}
		},
		error : function() { // 실패했을 경우
			alert("오류발생"); //여기서의 오류가 뜬다면 거의 시스템 오류일 것이다.(장애발생)
		}
	});
}
</script>

<body>
<div class="wrapper">
	<%@ include file="../include/topBar.jsp" %>
	<header>
	<%@ include file="../include/header.jsp" %>
	</header>
	
	<section>
	
	<form name="frm" id="frm">
		<table>
		<caption>게시글 작성하기</caption>
			<tr>
				<th width="20%">제목</th>
				<td width="80%"><input type="text" id="title" name="title" class="input1"></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" id="pass" name="pass" class="input1"></td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td><input type="text" id="name" name="name" style="height:25px;"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
				<textarea name="content" id="content" ></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align : center; border : none;">
				<button type="submit" onclick="fn_submit();return false;">등록</button>
				<button type="reset">취소</button>
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