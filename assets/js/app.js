$(document).ready(function()
{
	function initialize() {
        var map_canvas = document.getElementById('map_canvas');
        var myLatlng = new google.maps.LatLng(6.4475657, 3.4724711);
        var MY_MAPTYPE_ID = 'custom_style';

        var featureOpts = [
	    {
	      stylers: [
	        { hue: '#fdbc40' },
	        { gamma: 1 },
	        { weight: 3 }
	      ]
	    },
	    {
	      featureType: 'water',
	      stylers: [
	        { color: '#43bcf0' }
	      ]
	    }
	  ];

        var map_options = {
          center: myLatlng,
          zoom: 16,
           mapTypeControlOptions: {
		      mapTypeIds: [google.maps.MapTypeId.ROADMAP, MY_MAPTYPE_ID]
		   },
		   mapTypeId: MY_MAPTYPE_ID
        };

        var map = new google.maps.Map(map_canvas, map_options);

        var marker = new google.maps.Marker({
        	position: myLatlng,
        	map: map,
        	title: 'SuperGeeks',
    		animation: google.maps.Animation.DROP,
        });

        google.maps.event.addListener(marker, 'click', toggleBounce);

        var styledMapOptions = {
		    name: 'Custom Style'
		 };

		 var customMapType = new google.maps.StyledMapType(featureOpts, styledMapOptions);

        map.mapTypes.set(MY_MAPTYPE_ID, customMapType);
      };

      function toggleBounce() {
		  if (marker.getAnimation() != null) {
		    marker.setAnimation(null);
		  } else {
		    marker.setAnimation(google.maps.Animation.BOUNCE);
		  }
		}
      

      initialize();
});