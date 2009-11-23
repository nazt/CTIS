<html>
<head>
    <title>GMaps Circle Test</title>
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAnGpifcTyPEhEhb5IwFOjbhTaJM1gin6IW72XsrpkrP10yMBIQBRXy5v5L1tb-wZeQdbbjNG551qKEg" type="text/javascript"></script>

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
		var numPoints = 40;

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
        if (isCompatible) {
            // Create Map
            map = new GMap2(document.getElementById("map"));
            map.setCenter(new GLatLng(100, -74), 6);

            // Add controls
            map.addControl(new GLargeMapControl());
            map.addControl(new GMapTypeControl());
			
			// Create and add the circle
            // circle = new CircleOverlay(map.getCenter(), circleRadius, "#336699", 1, 1, '#336699', 0.2);
			// map.addOverlay(circle);
        }
    }
    //]]>
    function getLocation() {
        navigator.geolocation.getCurrentPosition(displayLocation, handleError, {maximumAge:600000, timeout:0, enableHighAccuracy:true});
    }
    function displayLocation(position) {
		        latitude = position.coords.latitude;
		        longitude = position.coords.longitude;
		        accuracy = position.coords.accuracy;
		        speed = position.coords.speed;
		 		map.setCenter(new GLatLng(latitude, longitude),15);
		
				alert('Found location: ' + latitude + ', ' + longitude + ', '); 
				circle = new CircleOverlay(map.getCenter(), accuracy/1609.344 , "#336699", 1, 1, '#336699', 0.2);
							map.addOverlay(circle);
			// // getCirclePoints(new google.maps.LatLng(latitude, longitude),30){	
			//         document.getElementById("locationInfoId").childNodes[0].nodeValue = "Long: " + longitude.toFixed(5) + " Lat: " + latitude.toFixed(5) + " Acc: " + accuracy.toFixed(0);
			//         var latlng = new google.maps.LatLng(latitude, longitude);
			//         map.set_center(latlng);
			//         if (geocoder) {
			//       geocoder.geocode({'latLng': latlng}, function(results, status) {
			//         if (status == google.maps.GeocoderStatus.OK) {
			//           if (results[0]) {
			//             marker = new google.maps.Marker({
			//                 position: latlng, 
			//                 map: map,
			// 		draggable: true
			//             },this.markerOptions); 
			//             document.getElementById("addressId").childNodes[0].nodeValue=results[0].formatted_address;
			//           } else {
			//             alert("No results found");
			//           }
			//         } else {
			//           ;//alert("Geocoder failed due to: " + status);
			//         }
			//       });
			//     }
    }
	function foundLocation(position) 
	{ 
		var lat = position.coords.latitude; 
		var long = position.coords.longitude; 
		// var city= position.address.country;
	alert('Found location: ' + lat + ', ' + long+ ', '); 
	}
	
    function handleError(error) {
        alert('Error during location: ' + error.code + ' ' + error.message);
    }
    </script>
</head>
<body onload="load();getLocation();" onunload="GUnload()">
	<div id="map" style="width: 400px; height: 300px; border: 1px solid #666666;"></div>
</body>
</html>