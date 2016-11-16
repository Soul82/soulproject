<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<div class="container" >
	<h2>감성팔이</h2></a>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid" align="center">
			<div class="navbar-header" >
				<a class="navbar-brand" href="/index">Home</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="/member/joinPage">회원가입</a></li>
				<li><a href="/chat/page">위치</a></li>
				<li class="dropdown">
				    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
				      게시판 <span class="caret"></span>
				    </a>
					<ul class="dropdown-menu">
					   <li><a href="/qna/qnaList?page=1">질문게시판</a></li>
					   <li><a href="#">리뷰게시판</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
</div>   
