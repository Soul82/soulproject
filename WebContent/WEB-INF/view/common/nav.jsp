<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${sessionScope.userId eq null }">
		<div>
			<fieldset style="width: 500">
				<legend>
					<b>로그인</b>
				</legend>
				<form action="/index.jsp">
					<b>ID</b> &nbsp;
						
							<br />
							<input type="text" required="required"
								placeholder="ID를 입력해주세요" name="id" />
					<br /> <b>PASS</b><br /> <input type="password"
						required="required" name="pass" /><br />
					<hr />
					<input type="submit" value="로그인" />
				</form>
			</fieldset>
			<a href="">아직회원이아니십니까?</a>
		</div>
	</c:when>
	<c:otherwise>
		<div>
			<fieldset style="width: 500">
				<legend>
					<b>&gt;이용가능서비스&lt;</b>
				</legend>
				<ul>
					<li><a href="">내 정보</a></li>
					<li><a href="">방명록</a></li>
					<li><a href="">로그아웃</a></li>
					<li><a href="">이메일 인증</a></li>
				</ul>
			</fieldset>
		</div>
	</c:otherwise>
</c:choose>
