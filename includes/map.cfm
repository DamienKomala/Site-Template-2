<cfoutput>

	<style type="text/css">
	  ##map-canvas { height: 408px;}
	</style>
	
	<script type="text/javascript"
	  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1brFwmR_pBqOuMIatxCSTafv2MUXAt1U&sensor=true">
	</script>
	
	<cfparam name="nhaddress" default="">
	<cfparam name="nhtitle" default="">
			  
	<script>

		var geocoder = new google.maps.Geocoder();
		var address = '#nhaddress#';
		var nhname = '#nhtitle#';
		
		geocoder.geocode( { 'address': address}, function(results, status) {
		
		  if (status == google.maps.GeocoderStatus.OK) {
			var latitude = results[0].geometry.location.lat();
			var longitude = results[0].geometry.location.lng();
			var myLatlng = new google.maps.LatLng(latitude,longitude); //for marker
			
			var mapOptions = {
  				zoom: 16,
  				center: myLatlng
			};
			
			var map = new google.maps.Map(document.getElementById("map-canvas"),
				mapOptions);
			
			var marker = new google.maps.Marker({
				position: myLatlng,
				map: map,
				title:nhname
			});
				
			google.maps.event.addDomListener(window, 'load', initialize);
		  } 
		}); 
	</script>

	<div id="map-canvas" class="img-polaroid"></div>

</cfoutput>
