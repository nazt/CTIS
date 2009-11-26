<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="index,follow" name="robots" /><meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" />
		<link href="http://iwebkit.net/apple-touch-icon.png" rel="apple-touch-icon" />
		<meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
		<link href="/CTIS/Framework/css/style.css" rel="stylesheet" type="text/css" />
		<script src="/CTIS/Framework/javascript/functions.js" type="text/javascript"></script>
		 <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAnGpifcTyPEhEhb5IwFOjbhTaJM1gin6IW72XsrpkrP10yMBIQBRXy5v5L1tb-wZeQdbbjNG551qKEg" type="text/javascript"></script>		
		<script type="text/javascript" charset="utf-8">
		    var map;
		    var geocoder;
		    var address;

		    function load() {
		      geocoder = new GClientGeocoder();
			  getLocation();
		    }

			function getLocation() {
			    navigator.geolocation.getCurrentPosition(displayLocation, handleError, {maximumAge:600000, timeout:0, enableHighAccuracy:true});
			}
			function displayLocation(position) {
				        latitude = position.coords.latitude;
				        longitude = position.coords.longitude;
				        accuracy = position.coords.accuracy;
				        speed = position.coords.speed;
						var latlng =new GLatLng(latitude, longitude);
   						geocoder.getLocations(latlng, showAddress);						

			}
			

		    function showAddress(response) {
		      
		      if (!response || response.Status.code != 200) {
		        alert("Status Code:" + response.Status.code);
		      } else {
		        place = response.Placemark[0];
		        // point = new GLatLng(place.Point.coordinates[1],
		        //                     place.Point.coordinates[0]);
				// alert( place.address );
				   document.getElementById('address').innerText = place.address;
				  document.forms[0].latitude.value = place.Point.coordinates[1];
				  document.forms[0].longitude.value = place.Point.coordinates[0];
				  document.forms[0].accuracy.value = place.AddressDetails.Accuracy ;
		        // marker = new GMarker(point);
		        // map.addOverlay(marker);
		        // marker.openInfoWindowHtml(
		        // '<b>orig latlng:</b>' + response.name + '<br/>' + 
		        // '<b>latlng:</b>' + place.Point.coordinates[1] + "," + place.Point.coordinates[0] + '<br>' +
		        // '<b>Status Code:</b>' + response.Status.code + '<br>' +
		        // '<b>Status Request:</b>' + response.Status.request + '<br>' +
		        // '<b>Address:</b>' + place.address + '<br>' +
		        // '<b>Accuracy:</b>' + place.AddressDetails.Accuracy + '<br>' +
		        // '<b>Country code:</b> ' + place.AddressDetails.Country.CountryNameCode);
		      }
		}



					
			function handleError(error) {
			    alert('Error during location: ' + error.code + ' ' + error.message);
			}
		</script>
		<title>Share  </title><meta content="Community-gnerated Traffic Information System" name="description" />
	</head>
	<body onload="iWebkit();load()">

		<div id="topbar">
			<div id="title">
				Say</div>
			<div id="leftnav">
				<a href="/CTIS/iwebkit/index"><img src="/CTIS/Framework/images/home.png" alt="home"/></a>
			</div>
		</div>
		<div id="content">

			<span class="graytitle">Location</span><ul class="pageitem">
 
				<li class="menu"><a href="/CTIS/iwebkit/map">
				<img alt="list" src="/CTIS/Framework/thumbs/contacts.png" /><span class="name" id="address">Seaching ...</span><span class="comment">Adjust..</span><span class="arrow"></span></a></li>
			
				</ul>	
				<g:form method="post" url="[action:'save',controller:'report']" >

			<span class="graytitle">Congestion</span><ul class="pageitem">
					<li class="form">                                   
							<g:select optionKey="id" from="${CongestionLevel.list()}" name="congestion_level.id" value="${reportInstance?.congestion_level?.id}" ></g:select>
						<span class="arrow"></span> 
					</li>

			</ul>
			<span class="graytitle">Cause</span><ul class="pageitem">
					<li class="form">                                   
						 <g:select optionKey="id" from="${CongestionCause.list()}" name="congestion_cause.id" value="${reportInstance?.congestion_cause?.id}" ></g:select>
						<span class="arrow"></span> 
					</li>

			</ul>
				<span class="graytitle">Say.. (optional)</span><ul class="pageitem">
						<li class="textbox"><textarea name="message" id="message"></textarea></li>
					</ul>
					<ul class="pageitem">
						<li class="form"><button name="button">Send</button></li>

						</ul>
					
					<span class="graytitle">Geo Location</span><ul class="pageitem">
							<li class="form">                                   
							  <input type="text" id="latitude" name="latitude" value="14.068048" />	
							</li>
							<li class="form">
							  <input type="text" id="longitude" name="longitude" value="100.598779" />
							</li>
							<li class="form">
								 <input type="text" id="accuracy" name="accuracy" value="10" />
							</li>

					</ul>				
		</div>
		</g:form>
		<div id="footer">
			<a href="http://iwebkit.net"></a></div>
	</body>
</html>