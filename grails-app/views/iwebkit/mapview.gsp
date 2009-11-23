<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="yes" name="apple-mobile-web-app-capable" />
	<meta content="index,follow" name="robots" />
	<meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" />
	
	<link href="http://iwebkit.net/apple-touch-icon.png" rel="apple-touch-icon" />
	<meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
  <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAnGpifcTyPEhEhb5IwFOjbhTaJM1gin6IW72XsrpkrP10yMBIQBRXy5v5L1tb-wZeQdbbjNG551qKEg" type="text/javascript"></script>
 


	<script type="text/javascript">
	var usCenterPoint = new GLatLng(14.068, 100.599)
	
	var usZoom = 5	

	function load() {
	  if (GBrowserIsCompatible()) {
	    var map = new GMap2(document.getElementById("map"))
	    map.setCenter(usCenterPoint, usZoom)
//		map.setZoom(usZoom11);
		window.setTimeout(function() {
		  map.panTo(new GLatLng(14.068, 100.600));
		}, 2000);
	    map.addControl(new GLargeMapControl());
	    map.addControl(new GMapTypeControl()); 

	      <g:each in="${reportInstanceList}" status="i" var="report">
	         var point${report.id} = new GLatLng(${report.latitude}, ${report.longitude})
	      var marker${report.id} = new GMarker(point${report.id})
	      marker${report.id}.bindInfoWindowHtml("${report.congestion_cause}<br/>${report.message}")
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

<body onload="load()" onunload="GUnload()">
  <div id="map" style="width: 500px; height: 300px"></div>
</body>
</html>