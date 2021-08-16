<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>


    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 화면</title>

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
	margin-top : 20px;
	width : 1000px; 
	border-collapse: collapse;
}
th, td { 
	border: 1px solid black;
	padding : 5px;
	height : 50px;
	padding : 5px;
}
th { background-color : #7f8c8d;}
.input1 {width : 98%;height : 25px;}
textarea {width : 98%;height : 70px;}
button { 
	font-size:9pt;
	padding : 3px;
	width : 100px;
	background-color : 7f8c8d;
	border-radius: 5px;
	font-weight: bold;
}
.Detail_btn_area{
	display: flex;
	justify-content: space-between;
}
.btn_delete{
	background-color: #fc5c65;
	color : white;
}
.btn_modify{
	background-color: #2d98da;
	color : white;
}
.btn_list{
	background-color: #4b6584;
	color : white;
}
</style>

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
				<th width="15%">제목</th>
				<td width="85%">${boardVO.title }</td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td>${boardVO.name }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${boardVO.hits }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td height="150">
				${boardVO.content }
				</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>
				${boardVO.rdate }
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align : center; border : none;">
				<div class="Detail_btn_area">
					<div>
						<button type="button" onclick="location='boardWrite.do' ">글쓰기</button>
						<button type="button" class="btn_modify" onclick="location='boardModify.do?unq=${boardVO.unq}' ">수정</button>
						<button type="button" class="btn_delete" onclick="location='passWrite.do?unq=${boardVO.unq}' ">삭제</button>
					</div>
					
					<div>
						<button type="button" class="btn_list">목록</button>
					</div>
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