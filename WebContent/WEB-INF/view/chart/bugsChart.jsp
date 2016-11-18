<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<h2 style="padding-top:7%">bugs차트페이지</h2>

<c:forEach var="bugs" items="${bugs }">
	bugs : ${bugs.artist } - ${bugs.title } //${bugs.album } <br/>  
</c:forEach>


<c:forEach var="mnet" items="${mnet }">
	m.net : ${mnet.artist } - ${mnet.title } //${mnet.album } <br/>  
</c:forEach>