<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>SoulSeller</title>
<style>
div.container {
	width: 100%;
	border: 1px solid gray;
}

header, footer {
	min-height : 10%;
	padding: 1em;
	color: white;
	background-color: black;
	clear: left;
	text-align: center;
}

nav.left{
	float: left;
	width: 220px;
	margin: 0;
	padding: 1em;
	max-width: 220px;
	overflow: auto;
}

nav.left ul {
	list-style-type: none;
	padding: 0;
}

nav.left ul a {
	text-decoration: none;
}

article {
	margin-left: 170px;
	border-left: 1px solid gray;
	padding: 1em;
	overflow: hidden;
	min-height: 90%;
}
</style>

</head>
<body>
	<div class="container">
		<header>
			<tiles:insertAttribute name="header"/>
		</header>
		<nav class="left">
			<tiles:insertAttribute name="nav"/>
		</nav>
		<article>
			<tiles:insertAttribute name="body"/>
		</article>
		<footer>
			<tiles:insertAttribute name="footer"/>
		</footer>
	</div>
</body>
</html>
