
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="yes" name="apple-mobile-web-app-capable" />
	<meta content="index,follow" name="robots" /><meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" />
	<link href="http://iwebkit.net/apple-touch-icon.png" rel="apple-touch-icon" />
	<meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
	<link href="/CTIS/Framework/css/style.css" rel="stylesheet" type="text/css" />
	<script src="/CTIS/Framework/javascript/functions.js" type="text/javascript"></script>
 	<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false
	    &amp;key=ABQIAAAAnGpifcTyPEhEhb5IwFOjbhR1wSRVmMbOrujw8e51Mx44QJJHQBTy8LTe7VSHRgo7P2RqStjh2W6T8g"
	    type="text/javascript">
	</script>

	


	
</head>

	<body onload="iWebkit();">

	<div id="topbar">
		<div id="title">
			ข้อมูลบนแผนที่</div>
			
		<div id="leftnav">
			<a href="/CTIS/iwebkit/listview"><img src="/CTIS/Framework/images/home.png" alt="say"/></a>
		</div>
		
	</div>
	
	<div id="content">
			<span class="graytitle"></span><ul class="pageitem">
				
			<div id="map" style="width: 300px; height: 300px; border: 1px solid #666666;"></div>
	</div>
			 
 
	<script type="text/javascript">
	//<![CDATA[

	_mPreferMetric=true;

	////map

	var map = new GMap2(document.getElementById("map"));

	var start =  new GLatLng(${reportInstance.latitude.toString()},${reportInstance.longitude.toString()});

	map.setCenter(start, 10);
	//map.setUIToDefault();
	map.addControl(new GMapTypeControl(1));
	map.addControl(new GLargeMapControl());
	map.addControl(new GScaleControl(256));
	new GKeyboardHandler(map);
	map.enableContinuousZoom();
	map.enableDoubleClickZoom();




		//calling circle drawing function
		function draw(pnt){
		map.clearOverlays();
		bounds = new GLatLngBounds();
		//var givenRad = document.getElementById("radius").value*1;
		//var givenQuality = document.getElementById("seqments").value*1;
		var givenRad = '${fieldValue(bean: reportInstance, field: "accuracy").toString().replaceAll(",","").trim()}';
	        givenRad = givenRad/1000;
		var givenQuality = 40;
		var centre = pnt || map.getCenter()
		drawCircle(centre, givenRad, givenQuality);
		//fit();
	        map.panTo(bounds.getCenter()); 
	       map.setZoom(map.getBoundsZoomLevel(bounds));

		}

		////////////////////////// circle///////////////////////////////

	function drawCircle(center, radius, nodes, liColor, liWidth, liOpa, fillColor, fillOpa)
	{
	// Esa 2006
		//calculating km/degree
		var latConv = center.distanceFrom(new GLatLng(center.lat()+0.1, center.lng()))/100;
		var lngConv = center.distanceFrom(new GLatLng(center.lat(), center.lng()+0.1))/100;

		//Loop 
		var points = [];
		var step = parseInt(360/nodes)||10;
		for(var i=0; i<=360; i+=step)
		{
		var pint = new GLatLng(center.lat() + (radius/latConv * Math.cos(i * Math.PI/180)), center.lng() + 
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

	///////////////////////////////////


	draw();


	// Add the target point
	var point = new GLatLng(${reportInstance.latitude.toString()},${reportInstance.longitude.toString()});

	var tweetMarker = new GMarker(point);

	var myStreetNumber='';
	var myStreet='0000 Kila Laemthong 19 Kor';
	var myCity='00 Sung';
	var myRegion='0000';
	var myZip='00';
	var myCountry='Thailand';
	var myAccuracy='${fieldValue(bean: reportInstance, field: "accuracy")}';

	var myAddress;
	if(myStreet=='' && myCity=='' && myRegion=='' && myZip=='')
	    myAddress='( accurate to within '+myAccuracy+'  meters )';
	else
	    myAddress=myStreetNumber+ ' ' + myStreet + ' ' + myCity + ' ' + myRegion + ' ' + myZip + ' ' + myCountry+'<br/>( accurate to within '+myAccuracy+'  meters )';

	var tweetText = '<b>ระดับ</b> : ${reportInstance?.congestion_level?.info.trim()} <br><b>สาเหตุ</b> : ${reportInstance?.congestion_cause?.reason.trim()} <br>  <b>ข้อความ</b> : ${fieldValue(bean: reportInstance, field: "message")} <br> <b>เวลา</b> : ${reportInstance.dateCreated.toString().trim()[11..18]}';
	
	//${fieldValue(bean: reportInstance, field: "latitude").toString().trim()}
	//${fieldValue(bean: reportInstance, field: "longitude").toString().trim()}

	var info2Html =  tweetText;
	map.addOverlay(tweetMarker);

	tweetMarker.bindInfoWindowHtml(info2Html);
	tweetMarker.show();
	tweetMarker.openInfoWindowHtml(info2Html);

	map.setZoom(12);

	//]]>

	</script>


  
</body>
</html>