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
				<label>����</label> <input type="text" id="id" name="id" placeholder="������ü" required />
			</p>
			<p>
				<label>���̵�</label> <input type="text" id="img" name="img" placeholder="6~20�ڷ� �Է�" required />
			</p>
			<p>
				<label>��й�ȣ</label> 
				<input type="password" id="pass" name="pass" placeholder="��й�ȣ" required /> 
				<input type="password" id="pass2" placeholder="��й�ȣȮ��" required />
			</p>
			<p>
				<label>�̸�</label> 
				<input type="text" id="name" name="name" placeholder="�ѱ�, ���� 2~15��" required />
			</p>
			<p>
				<label>����</label> 
				<input type="radio" name="gender" id="genderM" class="input_check"> 
				<label for="genderM" class="label_check"><span class="icon"></span>����</label> 
				<input type="radio" name="gender" id="genderW" class="input_check">
				<label for="genderW" class="label_check"><span class="icon"></span>����</label>
			</p>
			<p>
				<label>�������</label>
				<input type="text" id="birthYear" name="birthYear" style="width: 80px;" maxlength="4"><span class="txt">��</span> 
				<input type="text" id="birthMonth" name="birthMonth" style="width: 35px;" maxlength="2"><span class="txt">��</span>
				<input type="text" id="birthDay" name="birthDay" style="width: 35px;" maxlength="2"><span class="txt">��</span>
			</p>
			<p>
				<label>�̸���</label>
				<input type="email" id="mail" name="mail" placeholder="E-mail �Է�" required />
			</p>
			<!-- 
			<p id="accept">
			<input id="accept_terms" name="accept_terms" type="checkbox" />
			<label for="accept_terms">
				<strong>
				<a href="#" rel="external" target="_blank">���� �̿� ���</a>, 
				<a href="#" rel="external" target="_blank">���� ���� ���� �̿�</a>�� ����</strong>�մϴ�.
			</label>
			</p>
			-->			 
		</div>
		<p>
			<input type="submit" value="ȸ������"/>
		</p>
	</form>

</div>
</body>
</html>