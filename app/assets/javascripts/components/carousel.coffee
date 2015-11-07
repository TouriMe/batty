$(
  d = React.DOM
  c = React.createElement

  counter = 1
  getKey = -> counter += 1; counter

  window.Carousel = React.createClass
    getInitialState: -> img_idx: 0
    handle_click: (type, evt) ->
      img_idx = @state.img_idx
      if(type == 'prev')
        img_idx += 1
      else
        img_idx -= 1

      @setState {img_idx: ((@props.images.length + img_idx) % @props.images.length)}
      evt.preventDefault()

    render: ->
      img = @props.images[@state.img_idx]
      window.t = @props.images
      img = {src: '', alt: 'No Image'} if typeof img == 'undefined'

      d.div className: 'images carousel',
        d.a className: 'ctrl prev', href: '#', onClick: @handle_click.bind(this,'prev'), '<'
        d.img className: '', src: img['url'], alt: img['alt']
        d.a className: 'ctrl next', href: '#', onClick: @handle_click.bind(this,'next'), '>'

)