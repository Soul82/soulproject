<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<h2>질문남기기</h2>


<div align="left" style="width: 50%">
<form action="/qna/regqna" method="get" style="border-color: black">
	<select name="cate">
		<option value="music">노래 관련</option>
		<option value="manage">운영 관련</option>
		<option value="membership">로그인 관련</option>
		<option value="etc">기타</option>
	</select>
	<input type="text" name="title" size="81"/> <br/>
	<textarea name="content" id="ta">
	</textarea>
	<br/>
	<div align="right">
		<input type="submit" class="btn btn-primary" value="등록"/>
	</div>
</form>
</div>

<script src="/ckeditor/ckeditor.js"></script>

<script>
	CKEDITOR.replace("ta",{
		"height":200,
		"width":600
	});
</script>