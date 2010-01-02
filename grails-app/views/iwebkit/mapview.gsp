<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="yes" name="apple-mobile-web-app-capable" />
	<meta content="index,follow" name="robots" /><meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" />
	<link href="http://iwebkit.net/apple-touch-icon.png" rel="apple-touch-icon" />
	<meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
	<link href="/CTIS/Framework/css/style.css" rel="stylesheet" type="text/css" />
	<script src="/CTIS/Framework/javascript/functions.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

 


	<script type="text/javascript">
	/**
	 * Data for the markers consisting of a name, a LatLng and a zIndex for
	 * the order in which these markers should display on top of each
	 * other.
	 */
	var beaches = [
	  ['santa', -33.890542, 151.274856, 4],
	  ['accident', -33.923036, 151.259052, 5],
	  ['raining', -34.028249, 151.157507, 3],
	  ['raining', -33.80010128657071, 151.28747820854187, 2],
	  ['santa', -33.950198, 151.259302, 1]
	];
	var image=Array;
  var geocoder;
  var map;
  function load() {
 window.scrollTo(0, 0.9);
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(-34.397, 150.644);
    var myOptions = {
      zoom: 8,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	setMarkers(map,beaches);
  }


  function codeAddress() {
    var address = document.getElementById("address").value;
    if (geocoder) {
      geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          map.setCenter(results[0].geometry.location);
          var marker = new google.maps.Marker({
              map: map, 
              position: results[0].geometry.location
          });
        } else {
          alert("Geocode was not successful for the following reason: " + status);
        }
      });
    }
  }

	function setMarkers(map, locations) 
	{
	 	var infoWindow = new google.maps.InfoWindow;

	  	image['santa'] = new google.maps.MarkerImage('/CTIS/markers/santa_image.png',
	      // This marker is 20 pixels wide by 32 pixels tall.
	      new google.maps.Size(20, 32),
	      // The origin for this image is 0,0.
	      new google.maps.Point(0,0),
	      // The anchor for this image is the base of the flagpole at 0,32.
	      new google.maps.Point(0, 32));
	  image['accident'] = new google.maps.MarkerImage('/CTIS/markers/accident/image.png',
	      // This marker is 20 pixels wide by 32 pixels tall.
	      new google.maps.Size(50, 32),
	      // The origin for this image is 0,0.
	      new google.maps.Point(0,0),
	      // The anchor for this image is the base of the flagpole at 0,32.
	      new google.maps.Point(0, 32));	
	  image['raining'] = new google.maps.MarkerImage('/CTIS/markers/raining/image.png',
	      // This marker is 20 pixels wide by 32 pixels tall.
	      new google.maps.Size(64, 64),
	      // The origin for this image is 0,0.
	      new google.maps.Point(0,0),
	      // The anchor for this image is the base of the flagpole at 0,32.
	      new google.maps.Point(0, 32));
	  for (var i = 0; i < locations.length; i++) 
		{
	    	var beach = locations[i];
		    var myLatLng = new google.maps.LatLng(beach[1], beach[2]);
		    var marker	 = new google.maps.Marker({
		        position: myLatLng,
		        map: map,
		        icon: image[beach[0]],
		        title: beach[0],
		        zIndex: beach[3]
		    });
			bindInfoWindow(marker, map,  infoWindow, "wtf"+i);
		}
	}
    function bindInfoWindow(marker, map, infoWindow, html) {
      google.maps.event.addListener(marker, 'click', function() {
        infoWindow.setContent(html);
        infoWindow.open(map, marker);
      });
    }
</script>
	
	
</head>

<body onload="load();">
	<div id="topbar">
		<div id="title">
			Map View</div>
			
		<div id="leftnav">
			<a href="/CTIS/iwebkit/view"><img src="/CTIS/Framework/images/home.png" alt="say"/></a>
		</div>
		
	</div>
	
	<div id="content">
			<span class="graytitle"><input id="address" type="textbox" value="สยามพารากอน">
		    <a href="#" onclick="codeAddress()">Search</a></span><ul class="pageitem">

			<div id="map_canvas" style="width: 400px; height: 300px; border: 1px solid #666666;"></div>
	</div>
			 
	<div id="footer">	<a href="http://iwebkit.net"></a></div>	

  
</body>
</html>