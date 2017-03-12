<main-contents class="main-contents">

  <section class="item" each={ data }>
    <div class="wrap">
      <header class="item-header">
        <h2 class="item-title">{ title }</h2>
        <div class="item-toggle" show={ lat && lng }><i class="show-map glyphicon glyphicon-map-marker" onclick={ parent.click } data-lat="{ lat }" data-lng={ lng }></i></div>
      </header>
      <p class="item-description">{ content }<br>
      <span show={ tel }><i class="glyphicon glyphicon-phone-alt"></i> <a href="tel:{ tel }">{ tel }</a></span></p>

      <ul>
        <li show={ business_hours }>営業時間: { business_hours }</li>
        <li show={ closing_day }>定休日: { closing_day }</li>
        <li show={ parking }>駐車場: { parking }</li>
        <li show={ toilet }>トイレ: { toilet }</li>
      </ul>
    </div>
  </section>

  <script type="es6">
    if ( opts.data ) {
      this.data = opts.data
    }

    this.click = function( e ) {
      route( 'map/' + e.target.dataset.lat.trim() + ',' + e.target.dataset.lng.trim() )
    }.bind( this )
  </script>

</main-contents>
