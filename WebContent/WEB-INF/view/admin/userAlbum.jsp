<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
	<h2>${sessionScope.userId} 丛狼 举裹 格废</h2> <hr/>
  
    <div >
    	<h4>醚 <b> ${total }</b> 俺狼 举裹 </h4>
    	<hr/>
    	
    	<table class="table">
			<thead>
				<tr>
					<th>举裹疙</th>
					<th>积己老磊</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="m" items="${m }">
				<tr>
					<td><a onclick="albumList('${m.NUM}')">${m.ALBUMNAME }</a></td>
					<td>${m.CREATEDATE }</td>
					<td><button type="button" class="btn btn-danger" onclick="del('${m.NUM}')">昏力</button></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
    </div>
</div>


<script>
function albumList(val){
	console.log(val);
	var url="/mp3/albumlist?albumNum="+val;
	window.open(url, "", "height=500; width=800");
// 	setTimeout(function(){top.window.opener = top;top.window.open('','_parent','');top.window.close();});
}

function del(val){
	location.href="/mp3/deleteAlbum?num="+val;
}

</script>