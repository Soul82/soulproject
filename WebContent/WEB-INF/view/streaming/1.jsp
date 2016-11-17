<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<meta name="naver-site-verification" content="0bb3050dc41ea04e8ed950addb5c72ae8ef6b72d"/>
<meta name="google-site-verification" content="vVlSAV5XexCR-vnCYgDl7zlYxFM_uwvyiG2xgcfeHyk" />
<meta name="msvalidate.01" content="97FC7CA81CB70C59A2B1A47AB0253A36" />
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
<link rel="stylesheet" href="//www.soundcloud-save.com/style.css?t=1479348789"/>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script src="//apis.google.com/js/platform.js" async defer></script>
<script src="//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.5&appId=169330660074384" async defer></script>
<script src="//www.dropbox.com/static/api/2/dropins.js" id="dropboxjs" data-app-key="9d0yjo9zc95k6lc"></script>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<!-- default -->
<meta name="keywords" content="soundcloud, mp3, converter, downloader, music, song" />
<meta name="author" content="soundcloud-save.com" />
<meta name="robots" content="index, follow" />
<meta name="description" content="사운드클라우드 MP3 음원추출 다운로드 서비스 제공" />
<link rel="canonical" href="http://www.soundcloud-save.com" />
<link rel="alternate" href="http://www.soundcloud-save.com" />
<link rel="shortcut icon" href="http://www.soundcloud-save.com/img/favicon.ico">
<link rel="image_src" href="http://www.soundcloud-save.com/img/image.jpg" />


<header>

<div id="reg">
	<form name="fsoundcloud" method="get">
		<div>사운드클라우드 주소를 입력해주세요.</div>
		<div><input type="text" name="url" id="url" value=""></div>
		<div class="button">
		    <button type="button" name="button" id="button">MP3 추출</button>
		    <div class="fb-follow" data-href="https://www.facebook.com/curlychoi" data-layout="button_count" data-action="like" data-show-faces="true"></div>
		</div>
	</form>
</div>


<p id="loading">
    <img src="/img/loading.gif" align="absmiddle">
    사운드클라우드 영상을 MP3로 변환중입니다. 잠시만 기다려주세요. 감사합니다.         </p>

<div class="use">
    <div>soundcloud 뒤에 -save 만 추가하세요</div>
    <div><img src="/img/soundcloud-use.png"/></div>
</div>

<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>

</header>

<script>
$(document).ready(function () {
    var loading = $("#loading").html();

    var refresh = true;

    function loading_url(url)
    {
        $("#loading").css("display", "none");
        $("#loading").html(loading);
        $("#loading").css("display", "block");

        if (refresh) {
            $.get(url + '&check=1', function () {
                location.href = url;
            });
        }
        else {
            url = url.replace(/-save/, '');
            $("#url").val(url);
            mp3_download();
        }
    }

    function mp3_download()
    {
        //$("form[name=fsoundcloud]").css("display", "none");
        $("#loading").css("display", "none");
        $("#loading").html(loading);
        $("#loading").css("display", "block");

        if (!refresh) {
            $("#result").remove();
        }

        $.get("/index.php", $("form[name=fsoundcloud]").serialize(), function (js)
        {
            try {
                js = JSON.parse(js);
            }
            catch (e) {
                alert(js);
                $("#loading").css("display", "none");
                return;
            }
            $("#loading").html("");
            $("#loading").append('<div id="result"/>');
            $("#result").append("<ul/>");
            $("<li/>").appendTo("#result > ul").addClass("thumb").append('<img src="'+js.thumbnail+'"/>');
            $("<li/>").appendTo("#result > ul").addClass("title").append(js.title + ' (' + js.duration + ')');
            $("<li/>").appendTo("#result > ul").addClass("download").append('<a href="/d/'+js.v+'">MP3 Download</a>');
            $("#result").append('<div class="block"/>');
            //$("#loading").html(str);

            $("#result > ul").find("li.download").append('<div id="cloud"></div>');

            var cloud_download = "http://www.soundcloud-save.com/d/8l8oh50mn3u5u1nphn9k541og3/" + js.v;
            var cloud_filename = js.title.replace("/", "") + '.mp3';

        });
    }

    $("button[name=button]").click(function ()
    {
        if (refresh)
            var url = "//www.soundcloud-save.com/?url=" + encodeURIComponent($("#url").val());
        else
            var url = $("#url").val();

        loading_url(url);
    });

    });
</script>