<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="yes" name="apple-mobile-web-app-capable" />
	<meta content="index,follow" name="robots" />
	<meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" />
	<link href="http://iwebkit.net/apple-touch-icon.png" rel="apple-touch-icon" />
	<meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
	<link href="/CTIS/Framework/css/style.css" rel="stylesheet" type="text/css" />
	<script src="/CTIS/Framework/javascript/functions.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&hl=th&amp;key=ABQIAAAAnGpifcTyPEhEhb5IwFOjbhR1wSRVmMbOrujw8e51Mx44QJJHQBTy8LTe7VSHRgo7P2RqStjh2W6T8g"></script>
	<script type="text/javascript">
	/**
	 * Data for the markers consisting of a name, a LatLng and a zIndex for
	 * the order in which these markers should display on top of each
	 * other.
	 */
	var beaches = [
	 <g:each in="${reportInstanceList}" status="i" var="reportInstance">["${reportInstance.congestion_cause?.iconName}", ${reportInstance.latitude.toString()},${reportInstance.longitude.toString()}, ${reportInstance.id},"${reportInstance?.congestion_level?.info.trim()}","${reportInstance?.congestion_cause?.reason.trim()}","${reportInstance.message.toString().trim()}","${reportInstance.dateCreated.toString().trim()[0..10]
	}","${reportInstance.dateCreated.toString().trim()[11..18]}"],</g:each>];
	var image=Array;
  	var geocoder;
  	var map;
  function load() {
	<g:each var="icon" in="${congestionCauseInstanceList}">

	  	image['${icon.iconName}'] = new google.maps.MarkerImage('/CTIS/markers/${icon.iconName}/image.png',
	      // This marker is 20 pixels wide by 32 pixels tall.
	      new google.maps.Size(30, 30),
	      // The origin for this image is 0,0.
	      new google.maps.Point(0,0),
	      // The anchor for this image is the base of the flagpole at 0,32.
	      new google.maps.Point(0, 32));		
	</g:each>
		
 	window.scrollTo(0, 0.9);
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(13.744456,100.533272);
    var myOptions = {
      zoom: 9,
      center: latlng,
    navigationControl: true,
    navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
		scaleControl: true,
	  mapTypeControl: true,
	disableDoubleClickZoom: false,
	    mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

	setMarkers(map,beaches);
  }
  function codeAddress() {
    var address = document.getElementById("address").value;
    if (geocoder) {

      geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          map.setCenter(results[0].geometry.location);
		  map.setZoom(12); 
        } else {
          alert("Geocode was not successful for the following reason: " + status);
        }
      });
    }
  }

	function setMarkers(map, locations) 
	{
	 	var infoWindow = new google.maps.InfoWindow;


	  for (var i = 0; i < locations.length; i++) 
		{
	    	var beach = locations[i];
		    var myLatLng = new google.maps.LatLng(beach[1], beach[2]);
		    var marker	 = new google.maps.Marker({
		        position: myLatLng,
		        map: map,
		        icon: image[beach[0]],
		        title: beach[0],
		        zIndex: beach[3]
		    });
			bindInfoWindow(marker, map,  infoWindow,  "<b>ระดับ :</b> " +beach[4]+"<br><b>สาเหตุ:</b> " +beach[5]+"<br><b>ข้อความ:</b> " +beach[6] +"<br><b>เวลา:</b> " +beach[8]+"<br><b>วันที่:</b> " +beach[7]  );
		}
	}
    function bindInfoWindow(marker, map, infoWindow, html) {
      google.maps.event.addListener(marker, 'click', function() {
        infoWindow.setContent(html);
        infoWindow.open(map, marker);
      });
    }

</script>
	
	<title>ระบบรายงานสภาพจราจรโดยเครือข่ายผู้ใช้งาน</title>
</head>

<body onload="load();">

	<div id="topbar">
		<div id="title">
			ข้อมูลบนแผนที่</div>
			
		<div id="leftnav">
			<a href="javascript:history.back();">Back</a>
		</div>
		
	</div>
	
	<div id="content">
			<span class="graytitle">ค้นหา  <input id="address" type="textbox" value="Thammasat" onclick = "this.value='';" TITLE="Search"	>
		    <img alt="list" src="/CTIS/Framework/thumbs/mapsearch.png" width="20" height="18" id="mapicon" name="mapicon" onclick="codeAddress()"/></span><ul class="pageitem">
				
			<div id="map_canvas" style="width: 300px; height: 300px; border: 1px solid #666666;"></div>
	</div>
			 
	<div id="footer"> </div>	

  
</body>
</html>