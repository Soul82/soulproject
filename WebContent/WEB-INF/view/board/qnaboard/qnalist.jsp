<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container">
	<h2>Q & A</h2> 
	<hr/>
	<table class="table">
		<c:if test="${hit ne null}">
		<b style="color:red">최근 인기자료 TOP3 </b><br/>
			<c:forEach var="i" items="${hit }">
				${i.cate } = <a href="#f${obj.num}" style="text-decoration:non"><b>${i.filename }</b></a>   || 
			</c:forEach>
		</c:if>
		<thead>
			<tr>
				<th>글 번호</th>
				<th>작성자</th>
				<th>파일설명</th>
				<th>파일명</th>
				<th>다운로드수</th>
				<th>리뷰보기</th>
			</tr>
		</thead>


		<tbody>
		<c:forEach var="obj" items="${data }">
			<tr id="f${obj.num}">
				<td> ${obj.num } </td>
				<td> ${obj.uploader } </td>
				<td> ${obj.comments } </td>
				<td><a href="/file/down.cnd?num=${obj.num }"> ${obj.filename }</a> </td>
				<td><span style="color: green">${obj.count }</span> </td>
				<td><a href="#" onclick="reviewPage(${obj.num})"> review </a></td>
<%-- 				<td><a href="/file/reviewView.cnd?filenum=${obj.num }"> review </a></td> --%>
				
					<c:choose>
						<c:when test="${obj.filesize gt 1024*1024*1024 }">
							<fmt:formatNumber value="${obj.filesize / (1024*1024*1024) }"/>  
						</c:when>
						<c:when test="${obj.filesize gt 1024*1024 }">
							<fmt:formatNumber value="${obj.filesize / (1024*1024) }"/> 
						</c:when>
						<c:otherwise>
							<fmt:formatNumber value="${obj.filesize / (1024) }"/> 
						</c:otherwise>
					</c:choose>  
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


<div align="right">
	<form action="/qna/register">
		<input type="hidden" name="menu" value="board" />
		<button type="submit" class="btn btn-primary" name="write">질문 등록</button>
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
		<input type="submit" value="검색" />
	</form>
</div>

<script>
	function reviewPage(num){
		var url = "/file/reviewView.cnd?filenum="+num;
		window.open(url,"_blank","width=370,height=360,resizable=no");
	} 
	
	
</script>