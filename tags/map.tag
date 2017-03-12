<map class="map">
  <div class="back" onclick="{ click }"><i class="glyphicon glyphicon-remove"></i></div>
  <script type="es6">
    const div = document.createElement( 'div' )
    this.root.appendChild( div )
    div.style.width = '100%'
    document.querySelector( '#panel' ).style.height = '100%'
    document.body.classList.add( 'fixed' )
    const map = L.map( div )

    const show_map = function() {
      const h = document.body.clientHeight - document.querySelector( '.fixed-header' ).clientHeight
      div.style.height = h + 'px'

      const lat = opts.lat
      const lng = opts.lng

      map.setView( new L.LatLng( lat, lng ), 14 )

      const osm = L.tileLayer( 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
      } )

      const gsi = L.tileLayer( 'http://cyberjapandata.gsi.go.jp/xyz/std/{z}/{x}/{y}.png', {
        attribution: '<a href="http://maps.gsi.go.jp/development/ichiran.html" target="_blank">gsi.go.jp</a>'
      } )

      const photo = L.tileLayer( 'https://cyberjapandata.gsi.go.jp/xyz/seamlessphoto/{z}/{x}/{y}.jpg', {
        attribution: '<a href="http://maps.gsi.go.jp/development/ichiran.html" target="_blank">gsi.go.jp</a>'
      } )

      // const gsi4 = L.tileLayer( 'http://cyberjapandata.gsi.go.jp/xyz/gazo4/{z}/{x}/{y}.jpg', {
      //   attribution: '<a href="http://maps.gsi.go.jp/development/ichiran.html" target="_blank">gsi.go.jp</a>'
      // } )
      //
      // const gsi3 = L.tileLayer( 'http://cyberjapandata.gsi.go.jp/xyz/gazo3/{z}/{x}/{y}.jpg', {
      //   attribution: '<a href="http://maps.gsi.go.jp/development/ichiran.html" target="_blank">gsi.go.jp</a>'
      // } )
      //
      // const gsi2 = L.tileLayer( 'http://cyberjapandata.gsi.go.jp/xyz/gazo2/{z}/{x}/{y}.jpg', {
      //   attribution: '<a href="http://maps.gsi.go.jp/development/ichiran.html" target="_blank">gsi.go.jp</a>'
      // } )

      const gsi1 = L.tileLayer( 'https://cyberjapandata.gsi.go.jp/xyz/gazo1/{z}/{x}/{y}.jpg', {
        attribution: '<a href="http://maps.gsi.go.jp/development/ichiran.html" target="_blank">gsi.go.jp</a>'
      } )

      const gsi_old = L.tileLayer( 'https://cyberjapandata.gsi.go.jp/xyz/ort_old10/{z}/{x}/{y}.png', {
        attribution: '<a href="http://maps.gsi.go.jp/development/ichiran.html" target="_blank">gsi.go.jp</a>'
      } )

      osm.addTo( map )

      const baseMaps = {
        'Open Street Map': osm,
        '国土地理院': gsi,
        '現在': photo,
        '1974-1978年': gsi1,
        '1961-1964年': gsi_old
      }

      L.control.layers( baseMaps, null, { position: 'bottomleft' } ).addTo( map )

      L.marker( [ lat, lng ] ).addTo( map ).on( 'click', function() {
        location.href='http://maps.apple.com/?q='+lat+','+lng
      } )
    }

    this.click = function() {
      window.history.back()
    }.bind( this )

    window.addEventListener( 'resize', function() {
      if ( global.resizeTimer !== false ) {
        clearTimeout( global.resizeTimer )
      }
      global.resizeTimer = setTimeout( function() {
        show_map()
      }, Math.floor( 1000 / 60 * 10 ) )
    } )

    show_map()
  </script>
</map>
