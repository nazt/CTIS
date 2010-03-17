<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="yes" name="apple-mobile-web-app-capable" />
	<meta content="index,follow" name="robots" />
	<meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" />
	<link href="http://iwebkit.net/apple-touch-icon.png" rel="apple-touch-icon" />
	<meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
	<link href="/CTIS/Framework/css/style.css" rel="stylesheet" type="text/css" />
	<script src="/CTIS/Framework/javascript/functions.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript">
	  var geocoder;
	  function initialize() {
	    geocoder = new google.maps.Geocoder();
	    var latlng = new google.maps.LatLng(40.730885,-73.997383);
		codeLatLng();
	  }

	  function codeLatLng() {
	    var input = "40.730885,-73.997383";
	    var latlngStr = input.split(",",2);
	    var lat = latlngStr[0];
	    var lng = latlngStr[1];
		var latlng = new google.maps.LatLng(lat, lng);
	
	    if (geocoder) {
	      geocoder.geocode({'latLng': latlng}, function(results, status) {
	        if (status == google.maps.GeocoderStatus.OK) {
	          if (results[1]) {
 				// alert(results[1].formatted_address);
	          } else {
	            alert("No results found");
	          }
	        } else {
	          alert("Geocoder failed due to: " + status);
	        }
	      });
	    }	
	  }

	</script>
		
<title>Traffic ListView Report</title>
<meta content="iPod,iPhone,Webkit,iWebkit,Website,Create,mobile,Tutorial,free" name="keywords" />
<meta content="Community-generated Traffic Information System" name="description" /></head>

<body class="list" onload="initialize();iWebkit();">

	<div id="topbar">
		<div id="title">
			รายการข้อมูล</div>
		<div id="leftnav">
			<a href="/CTIS/iwebkit/view">Back</a>
		</div>
	</div>
<div id="content">
 <ul class="autolist">
	<li class="title">Traffic  Report</li>
	 <g:each in="${reportInstanceList}" status="i" var="reportInstance">
			<li class="withimage " >
					<a class="noeffect" href="/CTIS/iwebkit/report/${reportInstance?.id}">
					<img src="/CTIS/Framework/images/${reportInstance?.congestion_cause?.iconName}${reportInstance?.congestion_level?.colour}" alt="${reportInstance?.congestion_cause?.iconName}"/>
					<span class="name">${fieldValue(bean:reportInstance,field:'message')}</span>
					<span class="comment">${reportInstance?.locationName?.toString()}<br>
					${reportInstance.dateCreated}</span>
					<span class="arrow"></span>
				</a>
			</li>
		  </g:each>
		<li class=" autolisttext  "><a href="#" class="noeffect">Show 10 more items...</a></li>
	</ul>
</div>
 
</body>
</html>