<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<header>
	<div class="header-content">
	    <div class="header-content-inner">
	        <h1 id="homeHeading">Soul Music</h1>
	        <hr>
	        <a onclick="soulplayer()" class="btn btn-primary btn-xl page-scroll">Play music</a>
	    </div>
	</div>
</header>

    <section class="bg-primary" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">TODAY TOP 10!</h2>
                    <hr class="light">
                </div>
            </div>
        </div>
    </section>


	<section class="no-padding" id="album">
        <div class="container-fluid">
            <div class="row no-gutter popup-gallery">
            <c:forEach var="bugs2" items="${bugs2 }" varStatus="status">
                <div class="col-lg-33 col-sm-2">
                    <a href="${bugs2.album}" class="portfolio-box">
                        <img src="${bugs2.album}" class="img-responsive" style="width:300px;height:300px">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                   ${bugs2.title }
                                </div>
                                <div class="project-name">
                                    ${bugs2.artist }
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>


    <section class="no-padding" id="musicchart">
        <div class="container-fluid">
           
			<div class="container">
				<h2>Soul Music Chart</h2>
					<tr>
						<th><button type="button" class="btn btn-success" onclick="allChk2()">전체 선택</button></th>
						<th><button type="button" class="btn btn-success">선택 듣기</button></th>
						<th><button type="button" class="btn btn-success" id="choice" name="title">선택 담기</button></th>
					</tr>
				<div class="table-responsive">
					<table class="table">
							<thead>
								<tr>
									<th><input type="checkbox" name="chk_all" onclick="allChk()"></th>
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
                <a href="#" class="btn btn-default btn-xl sr-button">JoinUS</a>
                <%--              <c:import url="/soulPlayer"/> --%>
            </div>
        </div>
    </aside>


    <section id="chat">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">문의사항이 있을 경우 탈퇴하세요!</h2>
                    <hr class="primary">
                    <p>우리 일꾼들 연락처</p>
                </div>
                <div class="col-lg-4 col-lg-offset-2 text-center">
                    <i class="fa fa-phone fa-3x sr-contact"></i>
                    <p>voice-fishing</p>
                </div>
                <div class="col-lg-4 text-center">
                    <i class="fa fa-envelope-o fa-3x sr-contact"></i>
                    <p><a href="mailto:soulteam@gmail.com">soulteam@gmail.com</a></p>
                </div>
            </div>
        </div>
    </section>

<script>
	function soulplayer(){
		window.open("/playmusic", "", "width=410,height=580");
	}
	
	function allChk(){
		var chk = $("input[name='chk_all']").is(":checked");
		
		if(chk){
			$("input[name='chk']").prop("checked", true);
		}else{
			$("input[name='chk']").prop("checked", false);
		}
	}
	
	function allChk2(){
		var chk = $("input[name='chk_all']").is(":checked");
		
		if(chk){
			$("input[name='chk']").prop("checked", false);
			$("input[name='chk_all']").prop("checked", false);	
		}else{
			$("input[name='chk']").prop("checked", true);
			$("input[name='chk_all']").prop("checked", true);	
		}
	}
	
	document.getElementById("choice").addEventListener("click", function(){
		
		var url = "/choice/list?tt=";

		if(${sessionScope.userId eq null}){
			window.alert("로그인이 필요합니다 !");
		}else{
			$(".chkc").each(function(){
				//	console.log($(this).val());
				//	console.log($(this).prop("checked"));
				
					if($(this).prop("checked")){
						var tt = Array();
						tt = $(this).val() + "/";
						console.log(tt);
						url += tt;
					}
			});
		}
		console.log(url);
		window.open(url, "choice", "height=200; width=100");
	});

</script>    


    