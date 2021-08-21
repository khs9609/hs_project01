<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지 화면</title>
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
	th, td {
		padding : 5px;
		font-size : 15px;
	}
	
	.main_td_title{
		font-size : 26px;
		font-weight: bold;
		color:#2d98da;
		text-align:center;
		letter-spacing: -1px;
	}
	.main_td_content{
		color : #84817a;
		font-size : 16px;
	}

</style>
<body>
<div class="wrapper">


	<%@ include file="../include/topBar.jsp" %>
	
	
	<header>
	<%@ include file="../include//header.jsp" %>
	</header>
	
	<section>
	<br><br>
	<!-- S 메인 세션 테이블 구간입니다.  -->
		<div>
			<table>
				<tr>
					<td>
						<div class="main_td_title" >
						자바 과정을 수료하고 만들어보는 게시판 페이지입니다.
						</div>
						
						
						<div style="text-align: center;font-size:13px;letter-spacing: 2px;">
						Please click the Menu for move the site.
						</div>
						<br><br><br>
						
						<div class="main_td_content">
						(2021-08-13)<br>
						게시판 쓰기,목록,상세보기,수정하기,삭제하기가 현재 구현되어 있습니다.
						<br><br><br>
						(2021-08-17)<br>
						회원가입 및 로그인 기능을 업데이트 했습니다.<br>
						회원가입에서 아이디중복체크와 우편번호 검색, jQueryUI를 통해 구현된 생년월일 선택이 구현되어 있습니다.
						<br><br><br>
	
						
						</div>
					</td>
				</tr>
			</table>
		</div>
	<!-- E 메인 세션 테이블 구간입니다.  -->			
	
	</section>
	
	<footer>
		(2021) copyright 김효섭 [ 울산광역시 남구 무거동 인근 ] <br>
		Tel. 010-0000-0000
	</footer>

</div>
</body>
</html>
