<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<div class="container">
	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand page-scroll" href="/index">Soul 82</a>

			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<c:choose>
					<c:when test="${sessionScope.userId eq null }">
						<ul class="nav navbar-nav navbar-right">
							<li><a class="page-scroll" href="/">About</a></li>
							<li><a class="page-scroll" href="#music">Music</a></li>
							<li><a class="page-scroll" href="#musicchart">MusicChart</a></li>
							<li><a class="page-scroll" href="#album">Album</a></li>
							<li><a id="myBtn">Login</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="nav navbar-nav navbar-right">
							<li><a class="page-scroll" href="/">About</a></li>
							<li><a class="page-scroll" href="#music">Music</a></li>
							<li><a class="page-scroll" href="#musicchart">MusicChart</a></li>
							<li><a class="page-scroll" href="#chat">Chat</a></li>
							<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/qna/qnaList?page=1">질문게시판</a></li>
									<li><a href="#">리뷰게시판</a></li>
								</ul></li>
							<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">내정보 <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/board/review">리뷰 작성</a></li>
									<li><a href="/admin/reg">mp3 등록</a></li>
									<li><a href="/admin/reglist">mp3 list</a></li>
									<li><a href="/mp3/myalbum">내 앨범</a></li>
									<li><a href="/youtube/board">MV 보기</a></li>
									<li><a href="/naver/channelSSK">슈스케</a></li>
									<li><a href="/naver/channelYHY">뉴이얼</a></li>
									<li><a href="/member/modifyPage">내정보수정</a></li>
									<li><a href="/member/logout">로그아웃</a></li>
								</ul>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>

	<!-- Modal효과로 로그인 하기-->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span> Soul82 Login
					</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">

					<form action="/member/login">
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-user"></span> ID</label> <input
								type="text" class="form-control" id="id" name="id"
								placeholder="ID를 입력해주세요!" required="required">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> PASSWORD</label> <input
								type="password" class="form-control" id="pass" name="pass"
								placeholder="비밀번호를 입력해주세요!" required="required">
						</div>
						<div class="checkbox">
							<label><input type="checkbox" value="" checked>나를 기억해줘</label>
						</div>
						<button type="submit" class="btn btn-success btn-block">
							<span class="glyphicon glyphicon-off"></span> Login
						</button>
					</form>

				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger btn-default pull-left"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Cancel
					</button>
					<p>
						지금 소울뮤직의 가족이 되어주세요! <a href="/member/joinPage">Sign Up</a>
					</p>
					<p>
						비밀번호 찾기 <a href="/member/passFindView">Find password</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$("#myBtn").click(function() {
			$("#myModal").modal();
		});
	});
</script>