$ ( ->
  tag = document.createElement('script')
  tag.src = 'https://www.youtube.com/iframe_api'
  firstScriptTag = document.getElementsByTagName('script')[0]
  firstScriptTag.parentNode.insertBefore tag, firstScriptTag

  player = undefined

  onYouTubeIframeAPIReady = ->
    player = new (YT.Player)('player',
      height: '315'
      width: '560'
      videoId: 'l-gQLqv9f4o'
      events: 'onStateChange': onPlayerStateChange)
    return

  stopVideo = ->
    player.stopVideo()
    return

  playVideo = ->
    player.playVideo()
    return

  pauseVideo = ->
    player.pauseVideo()
    return



  $(document).on 'opened.fndtn.reveal', '[data-reveal]', ->
    playVideo()
    return
  $(document).on 'closed.fndtn.reveal', '[data-reveal]', ->
    pauseVideo()
    return
)