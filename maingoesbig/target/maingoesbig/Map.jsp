<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Place Autocomplete Address Form</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
  </head>
  <body>
    <div id="locationField">
      <input id="autocomplete" placeholder="Enter your address" onFocus="geolocate()" type="text" autofocus></input>
    </div>
    <script>
      var autocomplete;
      /* $(function () {
          if (typeof google === "undefined") {
              alert("Lazy loading Google maps");
              lazyLoadGoogleMaps();
          } else {                
              alert("Google Maps is already loaded");
              initAutocomplete();
          }
      });

      function lazyLoadGoogleMaps() {
          // Note the callback function name 
          $.getScript("https://maps.googleapis.com/maps/api/js?key=AIzaSyDwDjx6u8i7YId716VD1FrtCvo6BdRQGg8&libraries=places&callback=initAutocomplete")
          .done(function (script, textStatus) {            
              alert("Google maps loaded successfully");
          })
          .fail(function (jqxhr, settings, ex) {
              alert("Could not load Google Maps: ", ex);
          });
      } */
      function initAutocomplete() {
        autocomplete = new google.maps.places.Autocomplete(
			(document.getElementById('autocomplete')),
            {types: ['geocode']});
        autocomplete.addListener('place_changed', fillInAddress);
      }

      function fillInAddress() {
        var place = autocomplete.getPlace();
        console.log(place);
      }
      var defaultBounds = new google.maps.LatLngBounds(
    		  new google.maps.LatLng(18.5643478, 73.781288),
    		  new google.maps.LatLng(18.5643478, 73.781288));

    		var input = document.getElementById('searchTextField');
    		var options = {
    		  bounds: defaultBounds,
    		  types: ['establishment']
    		};

    		autocomplete = new google.maps.places.Autocomplete(input, options);
    		
    		searchBox.addListener('places_changed', function() {
    			  var places = searchBox.getPlaces();
    			  if (places.length == 0) {
    			    return;
    			  }
    			  
       function geolocate() {
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var geolocation = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            console.log(geolocation);
            var circle = new google.maps.Circle({
              center: geolocation,
              radius: position.coords.accuracy
            });
            autocomplete.setBounds(circle.getBounds());
          });
        }
      }
    </script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDwDjx6u8i7YId716VD1FrtCvo6BdRQGg8&libraries=places&callback=initAutocomplete"
        async defer></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
  </body>
</html>