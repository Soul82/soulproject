<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<p><button onclick="geoFindMe()">�� ��ġ</button></p>
<div id="out"></div>

<script>
function geoFindMe() {
  var output = document.getElementById("out");

  if (!navigator.geolocation){
    output.innerHTML = "<p>������� �������� ���������̼��� �������� �ʽ��ϴ�.</p>";
    return;
  }

  function success(position) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;

    output.innerHTML = '<p>���� : ' + latitude + '�� <br>�浵 : ' + longitude + '��</p>';

    var img = new Image();
    img.src = "http://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=13&size=300x300&sensor=false";

    output.appendChild(img);
  };

  function error() {
    output.innerHTML = "������� ��ġ�� ã�� �� �����ϴ�.";
  };

  output.innerHTML = "<p>Locating��</p>";

  navigator.geolocation.getCurrentPosition(success, error);
}
</script>