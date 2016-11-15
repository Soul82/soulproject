<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container">
	<h2>Q & A</h2> 
	<hr/>
	<table class="table">
		<thead>
			<tr>
				<th>�� ��ȣ</th>
				<th>�з�</th>
				<th>�ۼ���</th>
				<th>����</th>
				<th>�ۼ���</th>
				<th>��ȸ��</th>
			</tr>
		</thead>


		<tbody>
		<c:forEach var="obj" items="${data }">
			<tr id="f${obj.num}">
				<td> ${obj.num } </td>
				<td> ${obj.cate } </td>
				<td> �ۼ��� </td>
				<td><a href="/qna/view?num=${obj.num }"> ${obj.title }</a> </td>
				<td> ${obj.writedate } </a></td>
				<td><span style="color: green">${obj.hit }</span> </td>
<%-- 				<td><a href="/file/reviewView.cnd?filenum=${obj.num }"> review </a></td> --%>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


<div align="right">
	<form action="/qna/regpage">

		<input type="hidden" name="menu" value="board" />
		<button type="submit" class="btn btn-primary" name="write">���� ���</button>
	</form>
</div>

	
<div align="center">
	<ul class="pagination">
	<c:forEach var="i" begin="1" end="${last }" >
		<li class="active"><a href="/file/list.cnd?p=${i }">${i }</a></li>
	</c:forEach>
	</ul>
	
<!-- 	<form action="/file/searchReview.cnd"> -->
	<form action="/file/searchReview.cnd?search=${obj.NUM }">
	
		<input type="text" name="search" />
		<input type="submit" value="�˻�" />
	</form>
</div>

<script>
	function reviewPage(num){
		var url = "/file/reviewView.cnd?filenum="+num;
		window.open(url,"_blank","width=370,height=360,resizable=no");
	} 
	
	
</script>