<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
	
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
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					
					
					<c:choose>
						<c:when test="${sessionScope.userId eq null }">
					
						<ul class="nav navbar-nav navbar-right">
							<li><a class="page-scroll" href="/">About</a></li>
							<li><a class="page-scroll" href="#music">Music</a></li>
							<li><a class="page-scroll" href="#musicchart">MusicChart</a></li>
							<li><a id="myBtn">Login</a></li>
						</ul>
						</c:when>
						
						<c:otherwise>
							<ul class="nav navbar-nav navbar-right">
							<li><a class="page-scroll" href="/">About</a></li>
							<li><a class="page-scroll" href="#music">Music</a></li>
							<li><a class="page-scroll" href="#musicchart">MusicChart</a></li>
							<li><a class="page-scroll" href="#chat">Chat</a></li>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">MORE <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/qna/qnaList?page=1">질문게시판</a></li>
									<li><a href="#">리뷰게시판</a></li>
								</ul>
							</li>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">내정보 <span class="caret"></span></a>
								<ul class="dropdown-menu">
										<li><a href="/board/review">리뷰 작성</a></li>
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
	     <div class="modal-header" style="padding:35px 50px;">
	       <button type="button" class="close" data-dismiss="modal">&times;</button>
	       <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
	     </div>
	     <div class="modal-body" style="padding:40px 50px;">
	     
	        <form action="/member/login">
	          <div class="form-group">
	            <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
	            <input type="text" class="form-control" id="id" name="id" placeholder="Enter your id" required="required">
	          </div>
	          <div class="form-group">
	            <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
	            <input type="password" class="form-control" id="pass" name="pass" placeholder="Enter password" required="required">
	          </div>
	          <div class="checkbox">
	            <label><input type="checkbox" value="" checked>Remember me</label>
	          </div>
	            <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
	        </form>
	        
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
	        <p>아직 회원이 아니신가요? <a href="/member/joinPage">Sign Up</a></p>
	        <p>Forgot <a href="#">Password?</a></p>
	      </div>
	    </div>
	  </div>
	</div>
		
		
<script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});
</script>