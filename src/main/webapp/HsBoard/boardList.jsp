<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지 화면</title>
</head>
<link type="text/css" rel="stylesheet" href="css/headerStyle.css" />
<body>
<style>
table {
    margin-left:auto; 
    margin-right:auto;
	width : 1000px; 
	border-collapse: collapse;
	margin-top : 20px;
}
table caption {
	color : #84817a;
}
th, td {
	border : 1px solid #cccccc;
	padding : 5px;
}
th { 
	background-color : #7f8c8d;
}
.boardList_btn_area {width:1000px;margin-left:auto;margin-right:auto;text-align : right;}
.boardList_page {margin-left:auto;margin-right:auto;text-align : center; }
.boardList_page a {text-decoration: none; color:black;padding: 0px 3px;}
.btn_write {
	background-color : #7f8c8d;
	border-radius : 4px;
	width : 100px;
	color : black;
	font-weight: bold;
	padding: 3px;
	margin-top : 10px;
}
.search_area {width:1000px;margin-left : auto;margin-right:auto;text-align : left;}


</style>
<div class="wrapper">


	<%@ include file="../include/topBar.jsp" %>
	
	
	<header>
	<%@ include file="../include//header.jsp" %>
	</header>
	
<section>
	
	<table>
	
	<caption>
			<div style="font-size : 26px;font-weight: bold;">
			게시판 목록 
			</div>
			<br>
			<div style="text-align : left;margin-bottom : 5px;font-weight: bold;">
			Total : ${total }개
			</div>
	</caption>
		<tr>
			<th width="10%" align="center">번호</th>
			<th width="50%">제목</th>
			<th width="15%">글쓴이</th>
			<th width="15%">등록일</th>
			<th width="10%">조회수</th>
		</tr>
		
 	<c:set var="cnt" value="${rowNumber }"/>
		
	<c:forEach var="result" items="${resultList }">
		
		<tr align="center">
			<td>${cnt }</td>
			<td align="left">
				<a href="boardDetail.do?unq=${result.unq }"> ${result.title} </a>
			</td>
			<td>${result.name }</td>
			<td>${result.rdate }</td>
			<td>${result.hits }</td>
		</tr>
		
	<c:set var="cnt" value="${cnt - 1 }" />
	</c:forEach>
	
	</table>
	
	<div class="boardList_page">
		<c:forEach var="i" begin="1" end="${totalPage}">
			<a href="boardList.do?viewPage=${i }">${i }  </a>
		</c:forEach>
	</div>
	
	<div class="boardList_btn_area">
		<button type="button" class="btn_write" onclick=" location='boardWrite.do' ">글쓰기</button>
	</div>
	
	
	<div class="search_area">
		<form name="serachFrm" method="post" action="boardList.do">
			<select name="searchGubun" id="searchGubun">
				<option value="title">제목 </option>
				<option value="name">내용</option>
			</select>
			<input type="text" name="searchText" id="searchText">
			<button type="submit">검색</button>
		</form>
	</div>
			
</section>
	
	<footer>
		(2021) copyright 김효섭 [ 울산광역시 남구 무거동 인근 ] <br>
		Tel. 010-0000-0000
	</footer>

</div>
</body>
</html>