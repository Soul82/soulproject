<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.boo4tstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://api.mobilis.co.kr/webfonts/css/?fontface=NanumGothicWeb" />
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Sansita+One" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<head>
<style>
body {
	font-family: 'NanumGothicWeb';
}

#reg_form {
	padding-left: 2em;
	background: #f2f2f2;
	border: 1px solid #dcdcdc;
}

#reg h2 {
	font-family: 'Sansita One', cursive;
}

#reg input:not([type=checkbox]){
	width: 13em;
	border: 1px solid #cdcdcd;
	padding: 1em 0.5em 0.5em 1.5em;
	border-radius: 5px;
}

#reg input:not([type=checkbox]):focus{
	width : 15em;
	background-color: #fff;
	border-color: #7ccbe8;
}


</style>
</head>

<body>

<div id="reg" align="center">
	<img src="/image/logo.png" style="width: 30%" />


	<form id="reg_form" style="width: 50%; border: black solid 1px; border-radius: 1em" action="/member/joinConfirm">
		<h2 align="left">Registration</h2>
		<div align="left">
			<p>
				<label>사진</label> <input type="text" id="id" name="id" placeholder="사진대체" required />
			</p>
			<p>
				<label>아이디</label> <input type="text" id="img" name="img" placeholder="6~20자로 입력" required />
			</p>
			<p>
				<label>비밀번호</label> 
				<input type="password" id="pass" name="pass" placeholder="비밀번호" required /> 
				<input type="password" id="pass2" placeholder="비밀번호확인" required />
			</p>
			<p>
				<label>이름</label> 
				<input type="text" id="name" name="name" placeholder="한글, 영문 2~15자" required />
			</p>
			<p>
				<label>성별</label> 
				<input type="radio" name="gender" id="genderM" class="input_check"> 
				<label for="genderM" class="label_check"><span class="icon"></span>남자</label> 
				<input type="radio" name="gender" id="genderW" class="input_check">
				<label for="genderW" class="label_check"><span class="icon"></span>여자</label>
			</p>
			<p>
				<label>생년월일</label>
				<input type="text" id="birthYear" name="birthYear" style="width: 80px;" maxlength="4"><span class="txt">년</span> 
				<input type="text" id="birthMonth" name="birthMonth" style="width: 35px;" maxlength="2"><span class="txt">월</span>
				<input type="text" id="birthDay" name="birthDay" style="width: 35px;" maxlength="2"><span class="txt">일</span>
			</p>
			<p>
				<label>이메일</label>
				<input type="email" id="mail" name="mail" placeholder="E-mail 입력" required />
			</p>
			<!-- 
			<p id="accept">
			<input id="accept_terms" name="accept_terms" type="checkbox" />
			<label for="accept_terms">
				<strong>
				<a href="#" rel="external" target="_blank">서비스 이용 약관</a>, 
				<a href="#" rel="external" target="_blank">개인 정보 수집 이용</a>에 동의</strong>합니다.
			</label>
			</p>
			-->			 
		</div>
		<p>
			<input type="submit" value="회원가입"/>
		</p>
	</form>

</div>
</body>
</html>