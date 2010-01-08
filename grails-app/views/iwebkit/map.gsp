<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="index,follow" name="robots" /><meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" />
		<link href="http://iwebkit.net/apple-touch-icon.png" rel="apple-touch-icon" />
		<meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
		<link href="/CTIS/Framework/css/style.css" rel="stylesheet" type="text/css" />
		<script src="/CTIS/Framework/javascript/functions.js" type="text/javascript"></script>
  <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAnGpifcTyPEhEhb5IwFOjbhSKxM24ZlyNZgLKBcZWsVdveIArVBQeFEasr_Ised3Jg_JcOMYzbXQiFg" type="text/javascript"></script>
		<script type="text/javascript">

		// This file adds a new circle overlay to GMaps2
		// it is really a many-pointed polygon, but look smooth enough to be a circle.
		var CircleOverlay = function(latLng, radius, strokeColor, strokeWidth, strokeOpacity, fillColor, fillOpacity) {
			this.latLng = latLng;
			this.radius = radius;
			this.strokeColor = strokeColor;
			this.strokeWidth = strokeWidth;
			this.strokeOpacity = strokeOpacity;
			this.fillColor = fillColor;
			this.fillOpacity = fillOpacity;
		}

		// Implements GOverlay interface
		CircleOverlay.prototype = GOverlay;

		CircleOverlay.prototype.initialize = function(map) {
			this.map = map;
		}

		CircleOverlay.prototype.clear = function() {
			if(this.polygon != null && this.map != null) {
				this.map.removeOverlay(this.polygon);
			}
		}

		// Calculate all the points and draw them
		CircleOverlay.prototype.redraw = function(force) {
			var d2r = Math.PI / 180;
			circleLatLngs = new Array();
			var circleLat = this.radius * 0.014483;  // Convert statute miles into degrees latitude
			var circleLng = circleLat / Math.cos(this.latLng.lat() * d2r);
			var numPoints =  50		;

			// 2PI = 360 degrees, +1 so that the end points meet
			for (var i = 0; i < numPoints + 1; i++) { 
				var theta = Math.PI * (i / (numPoints / 2)); 
				var vertexLat = this.latLng.lat() + (circleLat * Math.sin(theta)); 
				var vertexLng = this.latLng.lng() + (circleLng * Math.cos(theta));
				var vertextLatLng = new GLatLng(vertexLat, vertexLng);
				circleLatLngs.push(vertextLatLng); 
			}

			this.clear();
			this.polygon = new GPolygon(circleLatLngs, this.strokeColor, this.strokeWidth, this.strokeOpacity, this.fillColor, this.fillOpacity);

			this.map.addOverlay(this.polygon);
		}

		CircleOverlay.prototype.remove = function() {
			this.clear();
		}

		CircleOverlay.prototype.containsLatLng = function(latLng) {
			// Polygon Point in poly 
			if(this.polygon.containsLatLng) {
				return this.polygon.containsLatLng(latLng);
			}
		}

		CircleOverlay.prototype.setRadius = function(radius) {
			this.radius = radius;
		}

		CircleOverlay.prototype.setLatLng = function(latLng) {
			this.latLng = latLng;
		}



		var circle = null;
		var circleRadius = 50; // Miles
		var map = null;
		var isCompatible = GBrowserIsCompatible();

		//<![CDATA[
		function load() {
				iWebkit();
		    if (isCompatible) {
		        // Create Map
		        map = new GMap2(document.getElementById("map"));
		        map.setCenter(new GLatLng(100.58,14.06), 6);
		    }
		}
		//]]>
		function detectBrowser() {
		  var useragent = navigator.userAgent;
		  var mapdiv = document.getElementById("map");

		  if (useragent.indexOf('iPhone') != -1 || useragent.indexOf('Android') != -1 ) {
		    mapdiv.style.width = '100%';
		    mapdiv.style.height = '100%';
		  } else {
		    mapdiv.style.width = '600px';
		    mapdiv.style.height = '800px';
		  }
		}

		function getLocation() {
		    navigator.geolocation.getCurrentPosition(displayLocation, handleError, {maximumAge:600000, timeout:0, enableHighAccuracy:true});
		}
		function displayLocation(position) {
			        latitude = position.coords.latitude;
			        longitude = position.coords.longitude;
			        accuracy = position.coords.accuracy;
			        speed = position.coords.speed;
					var center =new GLatLng(latitude, longitude);
			 		map.setCenter(center,16);

					//alert('Found location: ' + latitude + ', ' + longitude + ', '); 
					circle = new CircleOverlay(map.getCenter(), accuracy/1609.344 , "#336699", 1, 1, '#336699', 0.2);
								map.removeOverlay(circle);
								map.addOverlay(circle);
								var marker = new GMarker(center, {draggable: true});
								        GEvent.addListener(marker, "dragstart", function() {
								          map.closeInfoWindow();
								        });

								        GEvent.addListener(marker, "dragend", function() {
								        marker.openInfoWindowHtml(""+ this.getLatLng()); //
								        });

								        map.addOverlay(marker);

		}
		function foundLocation(position) 
		{ 
			var lat = position.coords.latitude; 
			var long = position.coords.longitude; 
			// var city= position.address.country;
		alert('Found location: ' + lat + ', ' + long+ ', '); 
		}

		function handleError(error){
			switch (error.code){
				case error.PERMISSION_DENIED:
					alert('Sorry. Permission to find your location has been denied.');
					break;
				case error.POSITION_UNAVAILABLE:
					alert('Sorry. Position unavailable.');
					break;
				default:
					alert('Error code: ' + error.code);
			}
		}
		</script>	
		<title>Adjust your Location  </title>
		<meta content="Community-gnerated Traffic Information System" name="description" />
	</head>
	<body onload="load();getLocation();" onunload="GUnload()">


		<div id="topbar">
			<div id="title">
				Adjust</div>
			<div id="leftnav">
				<a href="/CTIS/iwebkit/say"><img src="/CTIS/Framework/images/home.png" alt="say"/></a>
			</div>
		</div>
		<div id="content">
				<span class="graytitle">Location</span><ul class="pageitem">
				<div id="map" style="width: 300px; height: 300px; border: 1px solid #666666;"></div>
		</div>
				 
		<div id="footer">	<a href="http://www.together.in.th"></a></div>
	</body>
</html>