<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="yes" name="apple-mobile-web-app-capable" />
	<meta content="index,follow" name="robots" />
	<meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" />
	
	<link href="http://iwebkit.net/apple-touch-icon.png" rel="apple-touch-icon" />
	<meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
  <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAnGpifcTyPEhEhb5IwFOjbhTaJM1gin6IW72XsrpkrP10yMBIQBRXy5v5L1tb-wZeQdbbjNG551qKEg" type="text/javascript"></script>
    <script type="text/javascript">
    //<![CDATA[
    function load() {
      if (GBrowserIsCompatible()) {
        var map = new GMap2(document.getElementById("map"));
        map.setCenter(new GLatLng(14.068, 100.599), 13);
      }
    }
    //]]>
    </script>


	<script type="text/javascript">
	var usCenterPoint = new GLatLng(14.068, 100.599)
	var usZoom = 11

	function load() {
	  if (GBrowserIsCompatible()) {
	    var map = new GMap2(document.getElementById("map"))
	    map.setCenter(usCenterPoint, usZoom)
	    map.addControl(new GLargeMapControl());
	    map.addControl(new GMapTypeControl()); 

	      <g:each in="${reportInstanceList}" status="i" var="report">
	         var point${report.id} = new GLatLng(${report.latitude}, ${report.longitude})
	      var marker${report.id} = new GMarker(point${report.id})
	      marker${report.id}.bindInfoWindowHtml("${report.congestion_cause}<br/>${report.message}")
	         map.addOverlay(marker${report.id})
	      </g:each>
	  }
	}
	</script>
	
	
</head>

<body onload="load()" onunload="GUnload()">
  <div id="map" style="width: 500px; height: 300px"></div>
</body>
</html>