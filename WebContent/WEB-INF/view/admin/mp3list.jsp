<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
<h2>Soul Music Chart</h2>
	<tr>
		<th>  <button type="button" class="btn btn-success" id="cBox_all">전체 선택</button></th>
		<th>  <button type="button" class="btn btn-success" id="listen">선택 듣기</button></th>
		<th>  <button type="button" class="btn btn-success" id="select">선택 담기</button></th>
	</tr>
<div class="table-responsive">
	<table class="table">
			<thead>
				<tr>
					<th>check</th>
					<th>rank</th>
					<th>title</th>
					<th>artist</th>
					<th>like</th>
					<th>MV</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list }" varStatus="status">
				<tr>
					<td><input type="checkbox" id="cBox"></td>
					<td>${status.count }</td>
					<td id="tt" onclick="selectOne('${list.title}', ${list.num })">${list.title }</td>
					<td>${list.artist }</td>
					<td><img src="/img/like.jpg" width="30" height="30" /></td>
					<td><img src="${list.mv }" width="30" height="30" /></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script>

//전체선택
$(function(){
	var chk=false;
	$("#cBox_all").click(function(){
		chk= !chk;
		console.log(chk);
		if(chk){
			$("input:checkbox[id='cBox']").prop("checked", true);
		}else{
			$("input:checkbox[id='cBox']").prop("checked", false);
		}
	});
});

//선택담기
$(function(){
	$("#select").click(function(){
		var url = "/mp3/pass?mp3="
		$("input:checkbox[id='cBox']:checked").each(function(idx,row){
			var record = $(row).parents("tr").children("#tt");
			var t=record[0].innerText+"@@";
			console.log(t);
			url+=t;
		});
		window.open(url, "", "height=500; width=800");
	});
});

//선택듣기
$(function(){
	$("#listen").click(function(){
		var url = "/mp3/listen?mp3="
		$("input:checkbox[id='cBox']:checked").each(function(idx,row){
			var record = $(row).parents("tr").children("#tt");
			var t=record[0].innerText+"@@";
			console.log(t);
			url+=t;
		});
		window.open(url, "", "height=500; width=800");
	});
});

//선택한 한곡 듣기
function selectOne(val,num){
	console.log(num);
	window.open("/mp3/Onelisten?num="+num, "", "width=410,height=580");
}

</script>