<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.boo4tstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<form action="/member/joinConfirm">
<div align="center" class="container">
	<table border="1" style="width: 50%; border-radius: 1em;">
		<caption>
			<img src="/image/logo.png" style="width: 40%" />
		</caption>
		<colgroup>
			<col style="width: 94px">
			<col>
		</colgroup>
		<tbody>

			<tr>
				<th scope="row"><div class="wrap">아이디</div></th>
				<td>
					<div class="wrap">
						<div id="memberId_tr" class="wrap_input_info05 d_input_write"
							style="width: 331px;">
							<div class="wrap_input">
								<input type="text" id="id" name="id" title="아이디 입력 편집창" placeholder="6~30자로 입력" class="text53" style="width: 276px;">
								<input type="text" id="img" name="img" title="아이디 입력 편집창" placeholder="img문자로 임시 대체" class="text53" style="width: 276px;">
							</div>
							<div class="wrap_input_check">
								<a href="#" class="btn_input_check d_input_del"
									style="display: none;">삭제</a>
							</div>
						</div>
						<p id="memberId_msg" class="txt_error03" style="display: none;"></p>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row"><div class="wrap">비밀번호</div></th>
				<td>
					<div class="wrap">
						<div id="memberPwd1_tr"
							class="wrap_input_info04 wrap_input_pw d_input_write"
							style="width: 331px;">
							<div class="wrap_input">
								<input type="password" id="pass" name="pass"
									title="비밀번호 입력 편집창" placeholder="비밀번호 입력"
									class="text53 d_input_key" style="width: 212px;"> <label
									for="pass" class="pw_label">비밀번호 입력</label>
							</div>
							<div class="wrap_input" style="display: none;">
								<input type="text" id="pass2" title="비밀번호 입력 편집창"
									placeholder="비밀번호 입력" class="text53 d_input_key"
									style="width: 212px;">
							</div>
							<div class="wrap_input_check">
								<a href="#" class="btn_input_check d_input_del"
									style="display: none;">삭제</a> <a href="#"
									class="btn_pw_view d_input_pw" style="display: block;"><span>보기</span></a>
								<a href="#" class="btn_pw_hide d_input_pw"
									style="display: none;"><span>숨김</span></a>
							</div>
						</div>
						<p id="memberPwd1_usemsg" class="txt_input_info">8자 ~ 20자, 영문,
							숫자, 특수문자 사용</p>
						<p id="memberPwd1_level" class="txt_level_pwd high"
							style="display: none">
							안전도 : <span id="memberPwd1_levelmsg" class="level">높음</span> <span
								id="memberPwd1_successmsg">예측이 어려운 강력한 비밀번호 입니다.</span>
						</p>
						<p id="memberPwd1_msg" class="txt_error03" style="display: none;"></p>
						<div id="memberPwd2_tr"
							class="wrap_input_info04 wrap_input_pw d_input_write mt12"
							style="width: 331px;">
							<div class="wrap_input" style="display: block;">
								<input type="password" id="pass2" name="memberPwd2"
									title="비밀번호 확인 편집창" placeholder="비밀번호 확인"
									class="text53 d_input_key" style="width: 212px;"> <label
									for="pass2" class="pw_label">비밀번호 확인</label>
							</div>
							<div class="wrap_input" style="display: none;">
								<input type="text" id="memberPwd22" title="비밀번호 입력 편집창"
									placeholder="비밀번호 확인" class="text53 d_input_key"
									style="width: 212px;">
							</div>
							<div class="wrap_input_check">
								<a href="#" class="btn_input_check d_input_del"
									style="display: none;">삭제</a> <a href="#"
									class="btn_pw_view d_input_pw" style="display: block;"><span>보기</span></a>
								<a href="#" class="btn_pw_hide d_input_pw"
									style="display: none;"><span>숨김</span></a>
							</div>
						</div>
						<p id="memberPwd2_msg" class="txt_error03" style="display: none;"></p>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row"><div class="wrap">이름</div></th>
				<td>
					<div class="wrap">
						<div id="memberNick_tr" class="wrap_input_info04 d_input_write"
							style="width: 331px;">
							<div class="wrap_input">
								<input type="text" id="img" name="name"
									title="닉네임 입력 편집창" placeholder="한글, 영문 2~15자" class="text53"
									style="width: 276px;">
							</div>
							<div class="wrap_input_check">
								<a href="#" class="btn_input_check d_input_del"
									style="display: none;">삭제</a>
							</div>
						</div>
						<p id="memberNick_msg" class="txt_error03" style="display: none;"></p>
					</div>
				</td>
			</tr>
			<tr class="tr_type01">
				<th scope="row"><div class="wrap">성별</div></th>
				<td>
					<div class="wrap">
						<div class="box_select_gender">
							<ul class="wrap_list_radio">
								<li class="d_input_check">
									<div class="box_check_radio">
										<input type="radio" name="gender" id="genderM"
											class="input_check"> <label for="genderM"
											class="label_check"><span class="icon"></span>남자</label>
									</div>
								</li>
								<li class="d_input_check">
									<div class="box_check_radio">
										<input type="radio" name="gender" id="genderW"
											class="input_check"> <label for="genderW"
											class="label_check"><span class="icon"></span>여자</label>
									</div>
								</li>
							</ul>
						</div>
						<p id="memberGender_msg" class="txt_error03"
							style="display: none;"></p>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row"><div class="wrap">생년월일</div></th>
				<td>
					<div class="wrap">
						<div class="box_birth_input">
							<div id="birthYear_tr" class="wrap_input_info05 d_input_write"
								style="width: 129px;">
								<div class="wrap_input">
									<input type="text" id="birthYear" name="birthYear"
										title="생년월일 년 입력 편집창" placeholder="" class="text53"
										style="width: 80px;" maxlength="4"><span class="txt">년</span>
								</div>
							</div>

							<div id="birthMonth_tr" class="wrap_input_info05 d_input_write"
								style="width: 81px;">
								<div class="wrap_input">
									<input type="text" id="birthMonth" name="birthMonth"
										title="생년월일 월 입력 편집창" placeholder="" class="text53"
										style="width: 35px;" maxlength="2"><span class="txt">월</span>
								</div>
							</div>

							<div id="birthDay_tr" class="wrap_input_info05 d_input_write mr0"
								style="width: 81px;">
								<div class="wrap_input">
									<input type="text" id="birthDay" name="birthDay"
										title="생년월일 일 입력 편집창" placeholder="" class="text53"
										style="width: 35px;" maxlength="2"><span class="txt">일</span>
								</div>
							</div>
						</div>
						<p id="parentAgree_msg" class="txt_input_info02"
							style="display: none;">만 14세 미만인 경우 보호자(법정대리인)동의가 필요합니다.</p>
						<p id="birth_msg" class="txt_error03" style="display: none;"></p>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row"><div class="wrap">이메일</div></th>
				<td>
					<div class="wrap">



						<div class="box_email_input">
							<div id="email_tr" class="wrap_input_info04 d_input_write"
								style="width: 169px">
								<div class="wrap_input">
									<input id="mail" name="mail" type="text" title="이메일 입력 편집창"
										placeholder="이메일 입력" class="text53" style="width: 116px;">
								</div>
								<div class="wrap_input_check">
									<a href="#" class="btn_input_check d_input_del"
										style="display: none;">삭제</a>
								</div>
							</div>
							<!--select box-->
							<div id="mailDomain_tr" class="select_wrap">
								<select id="mailDomain" name="mailDomain" title="연락처 정보 선택"
									style="width: 95px; height: 31px; display: none;"
									class="d_selectbox2" data-class="select_type04"
									data-type="email">
									<option value="" selected>선택</option>

									<option value="nate.com">nate.com</option>

									<option value="naver.com">naver.com</option>

									<option value="daum.net">daum.net</option>

									<option value="gmail.com">gmail.com</option>

									<option value="hanmail.net">hanmail.net</option>

									<option value="yahoo.com">yahoo.com</option>

									<option value="lycos.co.kr">lycos.co.kr</option>

									<option value="cyworld.com">cyworld.com</option>

									<option value="paran.com">paran.com</option>

									<option value="empal.com">empal.com</option>

									<option value="dreamwiz.com">dreamwiz.com</option>

									<option value="korea.com">korea.com</option>

									<option value="hanmir.com">hanmir.com</option>

									<option value="hitel.net">hitel.net</option>

									<option value="freechal.com">freechal.com</option>

								</select>

							</div>
							<!--//select box-->
						</div>


						<p class="txt_input_info">중요한 알림이 이메일을 통해 안내됩니다.</p>
						<p id="email_msg" class="txt_error03" style="display: none;"></p>
					</div>
				</td>
			</tr>
		</tbody>
	 </table>
</div>
<div align="center">
	<input type="submit" value="회원가입"/>
</div>
</form>