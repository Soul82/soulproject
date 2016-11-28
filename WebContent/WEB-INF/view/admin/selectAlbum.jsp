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
	<h2>${sessionScope.userId} ���� �ٹ� ���</h2> <hr/>
  
    <div >
    	<br/>
    	<h4>�� <b> ${total }</b> ���� �뷡 ���� </h4>
    	<br/> 	<hr/>
    	
    	<table class="table">
			<thead>
				<tr>
					<th>�ٹ���</th>
					<th>���ϵ� �뷡 ����</th>
					<th>��������</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="m" items="${m }">
				<tr>
					<td>${m.ALBUMNAME }</td>
					<td>�뷡 ��</td>
					<td>${m.MY_DATE }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
    </div>
    
    <div class="form-group" id="complete">	
      <label for="focusedInput">�ٹ���</label>
      <input class="form-control" id="albumName" type="text">
      <button type="submit" class="btn btn-default" id="make">�����</button>
    </div>
  
</div>

<script>
$("#make").click(function(){
    var url="/mp3/makeAlbum?name="+$("#albumName").val();  
    $.ajax({      
        type:"get",  
        url:url,      
    }).done(function(resp){
    	$("#result").html(resp);
    });  
});  

</script>
