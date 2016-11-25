<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<script type="text/javascript" src="/themes/js/froogaloop.js"></script>
<script type="text/javascript">
$(function(){
    var iframe = $('#player1')[0],
        player = $f(iframe),
        status = $('.status');

// When the player is ready, add listeners for pause, finish, and playProgress
    player.addEvent('ready', function() {
        status.text('ready');

        player.addEvent('pause', onPause);
        player.addEvent('finish', onFinish);
        player.addEvent('playProgress', onPlayProgress);
    });

  // Call the API when a button is pressed
    $('button').bind('click', function() {
        player.api($(this).text().toLowerCase());
    });

    function onPause(id) {
        status.text('paused');
    }

    function onFinish(id) {
        status.text('finished');
    }

    function onPlayProgress(data, id) {
        status.text(data.seconds + 's played');
    }


});
</script>

<iframe id="player1" src="http://player.vimeo.com/video/27855315?api=1&player_id=player1"   width="400" height="225" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
