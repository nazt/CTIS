<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="index,follow" name="robots" /><meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" />
		<link href="http://iwebkit.net/apple-touch-icon.png" rel="apple-touch-icon" />
		<meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
		<link href="/CTIS/Framework/css/style.css" rel="stylesheet" type="text/css" />
		<script src="/CTIS/Framework/javascript/functions.js" type="text/javascript"></script>
		<script type="text/javascript" charset="utf-8">
			var useragent = navigator.userAgent,browser;

		    function load() {
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
						// alert("lat = "+latitude +"\n" + "lon = " + longitude);
						// document.forms[0].accuracy.value = accuracy ;
					    document.myform.latitude.value = latitude;
					    document.myform.longitude.value = longitude;
					
						document.myform.submit();
					
					//	window.location = "/CTIS/vms/getVms/"+latitude+";"+longitude;
						
 					
			}
 			function handleError(error) {
			    alert('Error during location: ' + error.code + ' ' + error.message + 'Please Check Location Service. ');
				history.go(-1);
			}
		</script>
		<title>ป้ายจราจรอัจฉริยะ</title>
		<meta content="Community-gnerated Traffic Information System" name="description" />
	</head>
	<body onload="iWebkit();load()">

		<div id="topbar">
			<div id="title">
				ป้ายจราจรอัจฉริยะ</div>
		</div>
		<div id="content">
			กำลังระบุพิกัด
				<form name="myform" action="/CTIS/vms/getVms/1" method='post'>
					<g:hiddenField name="latitude" value="someValue" />
					<g:hiddenField name="longitude" value="someValue" />
					<g:hiddenField name="accuracy" value="0" />										
				</form>
		</div> 
		<div id="footer">
			<a href="http://iwebkit.net"></a></div>
	</body>
</html>