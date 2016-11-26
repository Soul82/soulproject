<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<style>
		.tg  {border-collapse:collapse;border-spacing:0;border-width:1px;border-style:solid;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;}
		.tg .tg-yw4l{vertical-align:top}
		table.tg {
 		    opacity: 0.9; 
 		    filter: alpha(opacity=90); 
		}
	</style>
</head>


<h1>검색결과????</h1>

<body>
<div>
	<c:forEach var="i" items="${searchMusic }">
		${i.TITLE } + ${i.ARTIST } <br/>
	</c:forEach>
</div>
