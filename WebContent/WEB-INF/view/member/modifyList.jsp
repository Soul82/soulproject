<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<form action="/member/memUp">
<b>ID:${data.ID}</b><br/>
<b>����:</b><input type="text" name="img" /><br/>
<b>PASS:</b><input type="password"required="required" name="pass" /><br/>
<b>MAIL:</b><input type="email" name="mail"><br/>
<b>�̸�:${data.NAME}</b><br/>
<b>����:${data.GENDER}</b><br/>
<b>�������:${data.BIRTH}</b><br/>
<input type="submit" value="�����ϱ�">
</form>