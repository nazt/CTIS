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
					    document.forms[0].accuracy.value = accuracy ;
				        speed = position.coords.speed;
					    document.forms[0].latitude.value = latitude;
					    document.forms[0].longitude.value = longitude;				
						var latlng =new GLatLng(latitude, longitude);
   						geocoder.getLocations(latlng, showAddress);						
			}
		    function showAddress(response) {
		     
		      if (!response || response.Status.code != 200) {
			 	document.getElementById('address').innerText = "unknown location";		
		        alert("Status Code:" + response.Status.code);
		      } else {
		        place = response.Placemark[0];
		        // point = new GLatLng(place.Point.coordinates[1],
		        //                     place.Point.coordinates[0]);
				// alert( place.address );
				   document.getElementById('address').innerText = place.address;
				   document.mapicon.src = "/CTIS/Framework/thumbs/mapsearched.png";


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
				document.getElementById('address').innerText = "GPS Error! Please Check Location Service.";
			    alert('Error during location: ' + error.code + ' ' + error.message + ' Please Check Location Service. ');
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
				<img alt="list" src="/CTIS/Framework/thumbs/mapsearch.png" id="mapicon" name="mapicon"/>
				<span class="name" id="address">Resolving ... </span><span class="comment">Adjust..</span><span class="arrow"></span></a></li>
			
				</ul>	
				<g:form method="post" url="[action:'isave',controller:'report']" >
				
				<span class="graytitle">ระดับความติดขัด</span><ul class="pageitem">
						<li class="form">                                   
								<g:select optionKey="id" from="${CongestionLevel.list().sort{it.level}}" name="congestion_level.id" value="${reportInstance?.congestion_level?.id}" ></g:select>
							<span class="arrow"></span> 
						</li>

				</ul>
				
								
				<span class="graytitle">สาเหตุ</span><ul class="pageitem">
						<li class="form">                                   
							 <g:select optionKey="id" from="${CongestionCause.list()}" name="congestion_cause.id" value="${reportInstance?.congestion_cause?.id}" ></g:select>
							<span class="arrow"></span> 
						</li>
				</ul>



				<span class="graytitle">ข้อความ.. (optional)</span><ul class="pageitem">
						<li class="textbox"><textarea name="message" id="message"></textarea></li>
					</ul>
					<ul class="pageitem">
						<li class="form"><button name="button">Send</button></li>

						</ul>
					
					<span class="graytitle">Geo Location (please don't change)</span><ul class="pageitem">
							<li class="form">                                   
							  <input type="text" id="latitude" name="latitude" value="14.11101" />	
							</li>
							<li class="form">
							  <input type="text" id="longitude" name="longitude" value="100.00125" />
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