<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>



<div class="container">
	<h2>Q & A</h2> 
	<hr/>
	<table class="table">
		<thead>
			<tr>
				<th>${obj.num }</th>
				<th>${obj.cate }</th>
				<th>${obj.writer }</th>
				<th>${obj.title }</th>
				<th>${obj.writedate }</th>
				<th>${obj.hit }</th>
			</tr>
		</thead>

		<tbody>
			<tr id="f${obj.num}">
				<td> ${obj.content } </td>
			</tr>
		</tbody>
	</table>
</div>


<div align="right">
	<form action="/qna/regpage">

		<input type="hidden" name="menu" value="board" />
		<button type="submit" class="btn btn-primary" name="write">질문 등록</button>
	</form>
</div>