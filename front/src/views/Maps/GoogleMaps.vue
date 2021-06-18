<template>
  <div>
    <b-container fluid class="mt--7">
      <b-row>
        <b-col>
          <b-card no-body class="border-0">
            <div id="map-custom" class="map-canvas" style="height: 500px;"></div>
          </b-card>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>
<script>
import { API_KEY } from './API_KEY';
import GoogleMapsLoader from 'google-maps';

GoogleMapsLoader.KEY = API_KEY;

export default {
  name: 'GoogleMaps',
  props: {
    동: String,
    구: String,
    lat: String,
    lng: String,
    change: Boolean,
  },
  data() {
    return {};
  },
  methods: {
    initMap(google) {
      let lat = Number(this.lat),
        lng = Number(this.lng),
        color = '#5e72e4';
      //      document.getElementById('map-custom').removeAttribute;
      let map = document.getElementById('map-custom');

      let myLatlng = new google.maps.LatLng(lat, lng);
      console.log(myLatlng);

      let mapOptions = {
        zoom: 15,
        scrollwheel: false,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        styles: [
          {
            featureType: 'administrative',
            elementType: 'labels.text.fill',
            stylers: [{ color: '#444444' }],
          },
          {
            featureType: 'landscape',
            elementType: 'all',
            stylers: [{ color: '#f2f2f2' }],
          },
          {
            featureType: 'poi',
            elementType: 'all',
            stylers: [{ visibility: 'off' }],
          },
          {
            featureType: 'road',
            elementType: 'all',
            stylers: [{ saturation: -100 }, { lightness: 45 }],
          },
          {
            featureType: 'road.highway',
            elementType: 'all',
            stylers: [{ visibility: 'simplified' }],
          },
          {
            featureType: 'road.arterial',
            elementType: 'labels.icon',
            stylers: [{ visibility: 'off' }],
          },
          {
            featureType: 'transit',
            elementType: 'all',
            stylers: [{ visibility: 'off' }],
          },
          {
            featureType: 'water',
            elementType: 'all',
            stylers: [{ color: color }, { visibility: 'on' }],
          },
        ],
      };

      map = new google.maps.Map(map, mapOptions);

      let marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        animation: google.maps.Animation.DROP,
        title: 'Hello World!',
      });

      let contentString =
        '<div class="info-window-content"><h2>' + this.구 + ' ' + this.동 + '</h2></div>';

      let infowindow = new google.maps.InfoWindow({
        content: contentString,
      });
      infowindow.open(map, marker);

      // google.maps.event.addListener(marker, 'click', function() {
      //   infowindow.open(map, marker);
      // });
    },
  },
  mounted() {
    GoogleMapsLoader.load((google) => {
      this.initMap(google);
    });
  },
  watch: {
    lat: function() {
      console.log(this.lat);
      console.log(this.lng);
      GoogleMapsLoader.load((google) => {
        this.initMap(google);
      });
    },
    lng: function() {
      console.log(this.lat);
      console.log(this.lng);
      GoogleMapsLoader.load((google) => {
        this.initMap(google);
      });
    },
  },
};
</script>
