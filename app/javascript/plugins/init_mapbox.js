import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 100, maxZoom: 10, duration: 1000 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/tpmartin7/ckpheg9be05e717p9n06xmeor'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window);
      const element = document.createElement('div');
      element.className = 'marker';
      // element.style.backgroundImage = url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAADTUlEQVR4Xu2bSciOURTHf58iU8qwELK0sVIyZGvYEhaGJYrYUBasKclC5CvDjpQhtoatUFaShR0iG5QMRaE/z6vX132/5w7nGb7nvnf73HvuOb977nTOfUbIvIxkbj9DAEMPyJxAlVNgObAHmJPI+ANwHniSKMfZvCoAMv4BMMVI6e/AmiogVAVAI7bbyPiemAuFR5mKrQrADWCzqaZwE9hiLLOybXAIwOEBb4BHniO4Clg4pu6E94AQA1weFNLekzO1ToEQAzoLYCewDFgKLAJmAT+Bj8BL4CnwDLjmmEIhAFvpAd/463FTS7T7AkwCpnVtDfAelQEVJ5QH3APWplo8pv19YJ2xTPNFcDpwEdhmrWgh7yqwC/hqJd/yJKgF7S6w0kq5AXIeA+uBTxb9WAGYAchFdYCpozwspoMWzKRiBeAKsD1Jk/DG6lPbalKxAKA5qZtaSDnlOBbLew6FCCnWg0uBbf6rngpgHvACmB2oxFZAp73+opve9UA5CpYsAd4HtvtXPRXAGWB/ROdWANT1WeBAhA5/mqQA0Oi/cpzYfHSxBKAtcXGsF6QAOAyc8LHWUccSgMRLl5MxuqQA0H68IqZTwBqAdInagmMBzAfeJkwhawC/gAXAu9ABiQWwEbgV2llffWsAEr0JuB2qUyyAI8Cx0M5KACgEttoh03drPAocD9UpFsA5YG9oZyUABomTe/uUUWCfT8X+OrEALgM7QjurGEDU0bgpAEqZ+R6ffT2gVgCpU0B5PqW6lPIqK74Aap0CqYugjBYEpdAUEB2vtHIRTN0Gy0Y95nut22DqQSjGwPHa1H4QkjIpR2FrALUfhWVAymXIGkAjl6G5wOvI67AlgMauwzIiNiBiCaCxgIiMiA2JWQFoPCQmQ2KColYA1HejQdGeIVmHxQVBiRHlA13XWavR7pfTusSIlFNq7E5saCqAkp7ZbGhbaqynf9bJ0f5BzDY93oMwfCbneOPzA5jsOddddSfUC5FBr7wOAnpHrEdSCmPPLIB8LsLsz4uk6ekuPpIKGcHOPpPzfevbSQDZP5X1XP8GVguZQt59xYbFyzrIfhvM/oeJ7H+Z0RTJ+qepsjWiNd+rWgRbY2CZIkMAZYS6/j17D/gNQ0O3QY7BvfAAAAAASUVORK5CYII=);
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.width = '35px';
      element.style.height = '35px';
      element.style.backgroundSize = 'cover';
      element.style.backgroundPosition = 'center';

      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
