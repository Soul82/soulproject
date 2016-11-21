<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<header>
	<div class="header-content">
	    <div class="header-content-inner">
	        <h1 id="homeHeading">Soul Music</h1>
	        <hr>
	        <a href="soulPlayer.jsp" class="btn btn-primary btn-xl page-scroll">Play music</a>
	    </div>
	</div>
</header>

    <section class="bg-primary" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">MusicPlayer!!</h2>
                    <hr class="light">
<%--                    <jsp:include page="/soulPlayer.jsp" flush="true"/> --%>
                </div>
            </div>
        </div>
    </section>

    <section id="music">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">노래듣기</h2>
                    <hr class="primary">
                </div>
            </div>
        </div>
        <div class="container" align="center">
             <c:import url="/soulPlayer"/>
        </div>
    </section>




    <section class="no-padding" id="musicchart">
        <div class="container-fluid">
           
			<div class="container">
				<h2>Soul Music Chart</h2>
					<tr>
						<th>  <button type="button" class="btn btn-success">전체 선택</button></th>
						<th>  <button type="button" class="btn btn-success">선택 듣기</button></th>
						<th>  <button type="button" class="btn btn-success">선택 담기</button></th>
					</tr>
				<div class="table-responsive">
					<table class="table">
							<thead>
								<tr>
									<th>select</th>
									<th>rank</th>
									<th>album</th>
									<th>title</th>
									<th>artist</th>
									<th>like</th>
									<th>MV</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bugs" items="${bugs }" varStatus="status">
								<tr>
									<td><input type="checkbox" name="chk"></td>
									<td>${status.count }</td>
									<td><img src="${bugs.album }"/></td>
									<td>${bugs.title }</td>
									<td>${bugs.artist }</td>
									<td><img src="/img/like.jpg" width="30" height="30" /></td>
									<td><img src="/img/mv.png" width="30" height="30" /></td>
								</tr>
								</c:forEach>
							</tbody>
					</table>
				</div>
			</div>
           
        </div>
    </section>




    <aside class="bg-dark">
        <div class="container text-center">
            <div class="call-to-action">
                <h2>Welcome to Music Soul!</h2>
                <a href="#" class="btn btn-default btn-xl sr-button">chart!</a>
            </div>
        </div>
    </aside>

    <section id="chat">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Let's Get In Touch!</h2>
                    <hr class="primary">
                    <p>Ready to start your next project with us? That's great! Give us a call or send us an email and we will get back to you as soon as possible!</p>
                </div>
                <div class="col-lg-4 col-lg-offset-2 text-center">
                    <i class="fa fa-phone fa-3x sr-contact"></i>
                    <p>123-456-6789</p>
                </div>
                <div class="col-lg-4 text-center">
                    <i class="fa fa-envelope-o fa-3x sr-contact"></i>
                    <p><a href="mailto:your-email@your-domain.com">feedback@startbootstrap.com</a></p>
                </div>
            </div>
        </div>
    </section>

    
    