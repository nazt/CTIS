<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="index,follow" name="robots" /><meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" />
		<link href="http://iwebkit.net/apple-touch-icon.png" rel="apple-touch-icon" />
		<meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
		<link href="/CTIS/Framework/css/style.css" rel="stylesheet" type="text/css" />
		<script src="/CTIS/Framework/javascript/functions.js" type="text/javascript"></script>
  <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAnGpifcTyPEhEhb5IwFOjbhR1wSRVmMbOrujw8e51Mx44QJJHQBTy8LTe7VSHRgo7P2RqStjh2W6T8g" type="text/javascript"></script>	
		<script type="text/javascript" charset="utf-8">
		    var map;
		    var geocoder;
		    var address;
			var useragent = navigator.userAgent,browser;

		    function load() {
		      geocoder = new GClientGeocoder();
			  getLocation();
		    }

			function getLocation() 
			{
				if (useragent.indexOf('Firefox') != -1) {
					browser = 'Firefox';
				} else if (useragent.indexOf('iPhone') != -1) {
					browser = 'iPhone';
				} else if (useragent.indexOf('Android') != -1) {
					browser = 'Android';
				} else if (useragent.indexOf('Pre') != -1) {
					browser = 'Pre';
				} else {
					browser = 'Unknown Browser';
				} //end first if
				if (navigator.geolocation)
				{	
					if (browser === 'iPhone' || browser === 'Android' || browser === 'Pre') 
					{
						navigator.geolocation.watchPosition(displayLocation, handleError, {maximumAge:5000, timeout:0, enableHighAccuracy:true});
					} 
					else {
						navigator.geolocation.getCurrentPosition(displayLocation, handleError, { maximumAge:5000, timeout:0, enableHighAccuracy:true});
					}
				}else
				{
					document.getElementById('address').innerText = "Browser Not Support!";	
					alert('Sorry, this browser is NOT location aware. -> ' + browser );
					history.go(-1);

				}
			}
			function displayLocation(position) {
				        latitude = position.coords.latitude;
				        longitude = position.coords.longitude;
				        accuracy = position.coords.accuracy;
				        speed = position.coords.speed;
						heading=position.coords.heading;
					    document.forms[0].accuracy.value = accuracy ;
					    document.forms[0].latitude.value = latitude;
					    document.forms[0].longitude.value = longitude;	
					    document.forms[0].speed.value = speed;	
						if(speed=="NaN")
							document.forms[0].speed.value=0
					    document.forms[0].heading.value = heading;								
						var latlng =new GLatLng(latitude, longitude);
   						geocoder.getLocations(latlng, showAddress);						
			}
		    function showAddress(response) {
		      if (!response || response.Status.code != 200) {
			 	document.getElementById('address').innerText = "unknown location";		
			 					
		        alert("Status Code:" + response.Status.code);
		      } else {
		        place = response.Placemark[0];
				   document.getElementById('address').innerText = place.address;
				   document.forms[0].locationName.value=place.address;	
				   document.mapicon.src = "/CTIS/Framework/thumbs/mapsearched.png";
		      }
		}					
			function handleError(error) {
				document.getElementById('address').innerText = "GPS Error! Please Check Location Service.";
			    alert('Error during location: ' + error.code + ' ' + error.message + ' Please Check Location Service. ');
				history.go(-1);
			}
		</script>
		<title>ระบบรายงานสภาพจราจรโดยเครือข่ายผู้ใช้งาน</title>
		<meta content="Community-gnerated Traffic Information System" name="description" />
	</head>
	<body onload="iWebkit();load()">

		<div id="topbar">
			<div id="title">
				แจ้งสภาพจราจร</div>
			<div id="leftnav" >
				<a href="/CTIS/iwebkit/index">Back</a>
			</div>
		</div>
		<div id="content">

			<span class="graytitle">สถานที่</span><ul class="pageitem">
 
				<li class="menu"><a href="/CTIS/iwebkit/map">		
				<img alt="list" src="/CTIS/Framework/thumbs/mapsearch.png" id="mapicon" name="mapicon"/>
				<span class="name" id="address">Resolving ... </span><span class="comment"></span><span class="arrow"></span></a></li>
			
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
							 <g:select optionKey="id" from="${CongestionCause.list().sort{it.reason}.reverse()}" name="congestion_cause.id" value="${reportInstance?.congestion_cause?.id}" ></g:select>
							<span class="arrow"></span> 
						</li>
				</ul>



				<span class="graytitle">ข้อความ.. (ทางเลือก)</span><ul class="pageitem">
						<li class="textbox"><textarea name="message" id="message"></textarea></li>
					</ul>
					<ul class="pageitem">
						<li class="form"><button name="button">ส่งข้อมูล</button></li>

						</ul>
							 <input type="hidden" id="latitude" name="latitude" value="14.11101" />	
							 <input type="hidden" id="longitude" name="longitude" value="100.00125" />
							 <input type="hidden" id="accuracy" name="accuracy" value="10" />
							 <input type="hidden" id="heading" name="heading" value="-1" />
							 <input type="hidden" id="speed" name="speed" value="-1" />
							 <input type="hidden" id="locationName" name="locationName" value="Unknown Location" />
					</div>
		</g:form>
		<div id="footer">
			<a href="http://iwebkit.net"></a></div>
	</body>
</html>