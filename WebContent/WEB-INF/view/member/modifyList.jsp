<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<form action="/member/memUp">
<b>ID:${data.ID}</b><br/>
<b>사진:</b><input type="text" name="img" /><br/>
<b>PASS:</b><input type="password"required="required" name="pass" /><br/>
<b>MAIL:</b><input type="email" name="mail"><br/>
<b>이름:${data.NAME}</b><br/>
<b>성별:${data.GENDER}</b><br/>
<b>생년월일:${data.BIRTH}</b><br/>
<input type="submit" value="수정하기">
</form>