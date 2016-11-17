<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> Menu <i
					class="fa fa-bars"></i>
			</button>
			<a class="navbar-brand page-scroll" href="/index">Soul 82</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a class="page-scroll" href="#about">About</a></li>
				<li><a class="page-scroll" href="#music">Music</a></li>
				<li><a class="page-scroll" href="#musicchart">MusicChart</a></li>
				<li><a class="page-scroll" href="#chat">Chat</a></li>
				<li><a href="/member/joinPage">Join</a></li>
				<li><a href="/member/logview">Login</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">MORE <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/qna/qnaList?page=1">질문게시판</a></li>
						<li><a href="#">리뷰게시판</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>

