<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<p><button onclick="geoFindMe()">현 위치</button></p>
<div id="out"></div>


<div id="view" style="width:500; height: 300; border:1 solid;"></div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCK-gDA5ufIotTNiMa7PgjWeHcKJpJj-Es&callback=initMap"  async defer></script>
<script src="//content.jwplatform.com/players/9QMDyRrF-c66oCBjK.js"></script>


<script>
function geoFindMe() {
  var output = document.getElementById("out");

  if (!navigator.geolocation){
    output.innerHTML = "<p>사용자의 브라우저는 지오로케이션을 지원하지 않습니다.</p>";
    return;
  }

  function success(position) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;

    output.innerHTML = '<p>위도 : ' + latitude + '° <br>경도 : ' + longitude + '°</p>';

    var img = new Image();
    img.src = "http://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=13&size=300x300&sensor=false";

    output.appendChild(img);
  };

  function error() {
    output.innerHTML = "사용자의 위치를 찾을 수 없습니다.";
  };

  output.innerHTML = "<p>Locating…</p>";

  navigator.geolocation.getCurrentPosition(success, error);
}
</script>



<script>
      function initMap() {
		var pos= {
		          lat: 37.566535, 
		          lng: 126.97796919999999
          		};
		
		var src={
			"lat" : 37.497942,
			"lng" : 127.027620
			};
		
		
        var map = new google.maps.Map(document.getElementById('view'), {
          center: pos,
          scrollwheel: true,
          zoom: 16
        });
        
        var marker=new google.maps.Marker({
        	"position" : pos,
        	"map" : map,
        	"zoom" : 16 ,
        	"titme" : "${data.pname}"
        });
        
        var directionsDisplay = new google.maps.DirectionsRenderer({
            map: map
          });


          // Pass the directions request to the directions service.
          var directionsService = new google.maps.DirectionsService();
          directionsService.route(request, function(response, status) {
            if (status == 'OK') {
              // Display the route on the map.
              directionsDisplay.setDirections(response);
            }
          });
        }


    </script>