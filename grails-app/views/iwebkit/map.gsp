<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="yes" name="apple-mobile-web-app-capable" />
	<meta content="index,follow" name="robots" />
	<meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" />
	
	<link href="http://iwebkit.net/apple-touch-icon.png" rel="apple-touch-icon" />
	<meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
	<link href="/CTIS/Framework/css/style.css" rel="stylesheet" type="text/css" />
	<script src="/CTIS/Framework/javascript/functions.js" type="text/javascript"></script>
	<title>iWebKit Demo - Try out iWebKit and create the ultimate iPhone website!</title>	
	<meta content="iPod,iPhone,Webkit,iWebkit,Website,Create,mobile,Tutorial,free" name="keywords" />
	<meta content="Try out all exclusive features iWebKit 4.0 has to offer and discover how far web developement can go. Create the ultimate WebApp!" name="description" />
	
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript">
	    var map;
	    var geocoder;
	    var infowindow = new google.maps.InfoWindow();
	    var marker;
		var blueIcon = new google.maps.GIcon(G_DEFAULT_ICON);

		
	    function initialize() {
	        geocoder = new google.maps.Geocoder();
	        var latlng = new google.maps.LatLng(48.76918, 2.27742);
	        var myOptions = {
	            zoom: 15,
	            center: latlng,
	            mapTypeId: google.maps.MapTypeId.ROADMAP
	        };
	
	        map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	    }

	    function displayLocation(position) {
		
	        latitude = position.coords.latitude;
	        longitude = position.coords.longitude;
	        accuracy = position.coords.accuracy;
	        speed = position.coords.speed;
	        document.getElementById("locationInfoId").childNodes[0].nodeValue = "Long: " + longitude.toFixed(5) + " Lat: " + latitude.toFixed(5) + " Acc: " + accuracy.toFixed(0);
	        var latlng = new google.maps.LatLng(latitude, longitude);
	        map.set_center(latlng);
	        if (geocoder) {
	      geocoder.geocode({'latLng': latlng}, function(results, status) {
	        if (status == google.maps.GeocoderStatus.OK) {
	          if (results[0]) {
	            marker = new google.maps.Marker({
	                position: latlng, 
	                map: map,
					draggable: true
	            },this.markerOptions); 
	            document.getElementById("addressId").childNodes[0].nodeValue=results[0].formatted_address;
	          } else {
	            alert("No results found");
	          }
	        } else {
	          ;//alert("Geocoder failed due to: " + status);
	        }
	      });
	    }
	    }   

	    var watchId = 0;
	    function getLocation() {
	        navigator.geolocation.getCurrentPosition(displayLocation, handleError, {maximumAge:600000, timeout:0, enableHighAccuracy:true});
	    }

	    function watchLocation() {
	        watchId = navigator.geolocation.watchPosition(displayLocation, handleError);
	    }

	    function clearWatch() {
	        alert('Clearing watch: ' + watchId);
	        navigator.geolocation.clearWatch(watchId);
	    }

	    function handleError(error) {
	        alert('Error during location: ' + error.code + ' ' + error.message);
	    }
		function ok()
		{
			window.location = "/CTIS/iwebkit/say";
		}




	</script>
	
	
</head>

<body onload="initialize();getLocation()">
	<div id="topbar">
		<div id="title">
			Say</div>
		<div id="leftnav">
			<a href="/CTIS/iwebkit/index"><img src="/CTIS/Framework/images/home.png" alt="home"/></a>
		</div>
	</div>
	<div id="content">

		<span class="graytitle">Location</span><ul class="pageitem">
  <div id="map_canvas" style="width:300px; height:220px"></div>
 		<div id="locationInfoId">Location: </div>
 		<div id="addressId">Address: </div>
		<form action="/CTIS/iwebkit/say" method="post" id="user-login">
				<ul class="pageitem">
				  <li class="form"><input name="Submit input" name="op"  type="submit" value="Submit" /></li>
				</ul>
		</form>		
 
     </p>
</body>
</html>