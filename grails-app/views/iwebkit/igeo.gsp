<script type="text/javascript" charset="utf-8">
    navigator.geolocation.getCurrentPosition(foundLocation, noLocation, {maximumAge:60000, timeout:0, enableHighAccuracy:true});

	function foundLocation(position) 
	{ 
	var lat = position.coords.latitude; 
	var long = position.coords.longitude; 
	// var city= position.address.country;
	alert('Found location: ' + lat + ', ' + long+ ', '); 
	} 
	function noLocation() 
	{ 
	alert('Could not find location'); 
	}
</script>