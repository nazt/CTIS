<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="yes" name="apple-mobile-web-app-capable" />
	<meta content="index,follow" name="robots" /><meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" />
	<link href="http://iwebkit.net/apple-touch-icon.png" rel="apple-touch-icon" />
	<meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
	<link href="/CTIS/Framework/css/style.css" rel="stylesheet" type="text/css" />
	<script src="/CTIS/Framework/javascript/functions.js" type="text/javascript"></script>
  <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAnGpifcTyPEhEhb5IwFOjbhSKxM24ZlyNZgLKBcZWsVdveIArVBQeFEasr_Ised3Jg_JcOMYzbXQiFg" type="text/javascript"></script>
 


	<script type="text/javascript">
	var usCenterPoint = new GLatLng(14.068, 100.599)
	
	var usZoom = 8;

	function load() {
		iWebkit();
	  if (GBrowserIsCompatible()) {
		var santaIcon = new GIcon();
		santaIcon.image = '/CTIS/markers/santa_image.png';
		santaIcon.shadow = '/CTIS/markers/santa_shadow.png';
		santaIcon.iconSize = new GSize(21,30);
		santaIcon.shadowSize = new GSize(36,30);
		santaIcon.iconAnchor = new GPoint(11,30);
		santaIcon.infoWindowAnchor = new GPoint(11,0);
		santaIcon.printImage = '/CTIS/markers/santa_printImage.gif';
		santaIcon.mozPrintImage = '/CTIS/markers/santa_mozPrintImage.gif';
		santaIcon.printShadow = '/CTIS/markers/santa_printShadow.gif';
		santaIcon.transparent = '/CTIS/markers/santa_transparent.png';
		santaIcon.imageMap = [10,0,11,1,12,2,13,3,14,4,17,5,19,6,20,7,20,8,20,9,20,10,19,11,19,12,20,13,20,14,20,15,20,16,18,17,19,18,19,19,19,20,18,21,17,22,16,23,17,24,18,25,19,26,19,27,19,28,18,29,0,29,0,28,0,27,0,26,1,25,1,24,1,23,1,22,1,21,1,20,2,19,2,18,0,17,0,16,0,15,0,14,0,13,0,12,1,11,2,10,3,9,4,8,4,7,4,6,4,5,4,4,4,3,5,2,6,1,7,0];

		var accidentIcon = new GIcon();
		accidentIcon.image = '/CTIS/markers/accident/image.png';
		accidentIcon.printImage = '/CTIS/markers/accident/printImage.gif';
		accidentIcon.mozPrintImage = '/CTIS/markers/accident/mozPrintImage.gif';
		accidentIcon.iconSize = new GSize(50,35);
		accidentIcon.shadow = '/CTIS/markers/accident/shadow.png';
		accidentIcon.transparent = '/CTIS/markers/accident/transparent.png';
		accidentIcon.shadowSize = new GSize(68,35);
		accidentIcon.printShadow = '/CTIS/markers/accident/printShadow.gif';
		accidentIcon.iconAnchor = new GPoint(0,35);
		accidentIcon.infoWindowAnchor = new GPoint(25,0);
		accidentIcon.imageMap = [31,0,31,1,32,2,34,3,38,4,40,5,42,6,43,7,44,8,45,9,45,10,46,11,46,12,46,13,47,14,48,15,48,16,49,17,49,18,49,19,49,20,49,21,49,22,49,23,49,24,49,25,49,26,49,27,49,28,49,29,49,30,49,31,49,32,49,33,49,34,1,34,0,33,0,32,0,31,0,30,0,29,0,28,0,27,0,26,0,25,0,24,0,23,0,22,0,21,0,20,0,19,0,18,0,17,1,16,1,15,1,14,2,13,2,12,4,11,10,10,10,9,10,8,11,7,11,6,13,5,14,4,14,3,14,2,15,1,18,0];


		var rainingIcon = new GIcon();
		rainingIcon.image = '/CTIS/markers/raining/image.png';
		rainingIcon.printImage = '/CTIS/markers/raining/printImage.gif';
		rainingIcon.mozPrintImage = '/CTIS/markers/raining/mozPrintImage.gif';
		rainingIcon.iconSize = new GSize(50,35);
		rainingIcon.shadow = '/CTIS/markers/raining/shadow.png';
		rainingIcon.transparent = '/CTIS/markers/raining/transparent.png';
		rainingIcon.shadowSize = new GSize(68,35);
		rainingIcon.printShadow = '/CTIS/markers/raining/printShadow.gif';
		rainingIcon.iconAnchor = new GPoint(0,35);
		rainingIcon.infoWindowAnchor = new GPoint(25,0);
		rainingIcon.imageMap =[26,0,29,1,31,2,32,3,33,4,39,5,42,6,43,7,45,8,46,9,46,10,47,11,48,12,48,13,49,14,53,15,54,16,56,17,56,18,57,19,58,20,58,21,59,22,59,23,59,24,59,25,60,26,60,27,60,28,60,29,60,30,59,31,59,32,59,33,58,34,57,35,55,36,53,37,50,38,50,39,50,40,50,41,50,42,50,43,44,44,43,45,44,46,44,47,45,48,45,49,45,50,44,51,43,52,42,53,42,54,41,55,40,56,40,57,39,58,38,59,38,60,27,61,26,62,26,63,24,63,16,62,14,61,14,60,14,59,13,58,13,57,13,56,13,55,13,54,13,53,13,52,13,51,7,50,6,49,6,48,6,47,6,46,7,45,7,44,8,43,11,42,12,41,12,40,12,39,12,38,12,37,7,36,6,35,6,34,6,33,7,32,7,31,6,30,5,29,5,28,5,27,4,26,4,25,4,24,4,23,4,22,5,21,5,20,5,19,6,18,6,17,6,16,7,15,8,14,9,13,10,12,11,11,11,10,11,9,12,8,12,7,13,6,13,5,14,4,15,3,16,2,18,1,22,0];



		var markerOptions = {icon:santaIcon, draggable: false};
		var accidentOptions = {icon:accidentIcon, draggable: false};
		var rainingOptions = {icon:rainingIcon, draggable: false};
		var santaOptions = {icon:rainingIcon, draggable: false};
		// var marker = new GMarker(santaPoint,markerOptions );
		
		
	    var map = new GMap2(document.getElementById("map"))
	    map.setCenter(usCenterPoint, usZoom)
		window.setTimeout(function() {
		  map.panTo(new GLatLng(14.068, 100.600));
		}, 2000);
	    map.addControl(new GLargeMapControl());
	    map.addControl(new GMapTypeControl()); 

	      <g:each in="${reportInstanceList}" status="i" var="report">
	         var point${report.id} = new GLatLng(${report.latitude}, ${report.longitude})
	      var marker${report.id} = new GMarker(point${report.id},${report.congestion_cause?.iconName.trim()}Options)
	      marker${report.id}.bindInfoWindowHtml("${report.congestion_cause}<br/>${report.message.trim()}")
	         map.addOverlay(marker${report.id})
	      </g:each>
		drawCircle(30, givenRad, givenQuality);

	  }
	}
	////////////////////////// circle///////////////////////////////
	//calling circle drawing function
	function draw(pnt){
	  map.clearOverlays();
	  bounds = new GLatLngBounds();
	  var givenRad = document.getElementById("radius").value*1;
	  var givenQuality = document.getElementById("seqments").value*1;
	  var centre = pnt || map.getCenter()
	  drawCircle(centre, givenRad, givenQuality);
	  fit();
	}
 
	function drawCircle(center, radius, nodes, liColor, liWidth, liOpa, fillColor, fillOpa){
	  // Esa 2006
	  //calculating km/degree
	  var latConv = center.distanceFrom(new GLatLng(center.lat()+0.1, center.lng()))/100;
	  var lngConv = center.distanceFrom(new GLatLng(center.lat(), center.lng()+0.1))/100;

	  //Loop 
	  var points = [];
	  var step = parseInt(360/nodes)||10;
	  for(var i=0; i<=360; i+=step)
	  {
	    var pint = new GLatLng(center.lat() + (radius/latConv * Math.cos(i * Math.PI/180)), 
	      center.lng() + 
	      (radius/lngConv * Math.sin(i * Math.PI/180)));
	    points.push(pint);
	    bounds.extend(pint); //this is for fit function
	  }
	  points.push(points[0]); // Closes the circle, thanks Martin
	  fillColor = fillColor||liColor||"#0055ff";
	  liWidth = liWidth||2;
	  var poly = new GPolygon(points,liColor,liWidth,liOpa,fillColor,fillOpa);
	  map.addOverlay(poly);
	}
	/////////////////////////////////////////////////////////////////////
	
	</script>
	
	
</head>

<body onload="load()" onunload="GUnload()" >
	<div id="topbar">
		<div id="title">
			Map View</div>
		<div id="leftnav">
			<a href="/CTIS/iwebkit/view"><img src="/CTIS/Framework/images/home.png" alt="say"/></a>
		</div>
	</div>
	<div id="content">
			<span class="graytitle">Location</span><ul class="pageitem">
			<div id="map" style="width: 400px; height: 300px; border: 1px solid #666666;"></div>
	</div>
			 
	<div id="footer">	<a href="http://iwebkit.net"></a></div>	
</body>
</html>