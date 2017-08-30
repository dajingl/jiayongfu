class VideoButton extends Simditor.Button

  name: "video"

  icon: 'video'

  htmlTag: 'iframe'

  render: (args...) ->
    super args...
    @popover = new VideoPopover
      button: @

  _init: ->
    @menu = [{
      name: 'youku'
      text: '优酷视频',
      param: 'youku'
    }, {
      name: 'tencent'
      text: '腾讯视频'
      param: 'tencent'
    }]
    super()

  _status: ->
    super()

    if @active and !@editor.selection.rangeAtEndOf(@node)
      @popover.show @node
    else
      @popover.hide()

  command: (param) ->
    $rootBlock = @editor.selection.rootNodes().first()
    @popover.show $rootBlock

class VideoPopover extends Simditor.Popover

  render: ->
    tpl = """
    <div class="video-settings">
      <div class="settings-field">
        <label>视频地址</label>
        <input class="video-url" type="text"/>
        <a href='#' class='video-confirm'>确定</button>
      </div>
    </div>
    """
    @el.addClass('video-popover').append(tpl)
    @urlEl = @el.find '.video-url'
    @confirmBtn = @el.find '.video-confirm'

    @urlEl.on 'keyup', (e) =>
      return if e.which == 13

      val = @urlEl.val()
      val = 'http://' + val unless /https?:\/\/|^\//ig.test(val) or !val

      @target.attr 'href', val
      @editor.inputManager.throttledValueChanged()

    @confirmBtn.on 'click', (e) =>
      e.preventDefault();
      src = @generateIframeUrlFromVideoUrl(@urlEl.val())
      if !src || src == ''
        alert('解析视频地址失败，目前仅支持优酷和腾讯视频，请复制正确的链接到输入框后重试')
        return

      if @target.prop("tagName").toLowerCase() == 'iframe'
        console.log('should update iframe')
      else
        iframeId = "videoiframe" + (Math.random() * 100).toFixed(0)
        $video = $('<iframe/>', {
          id: iframeId,
          frameborder: "0",
          onload: "var video = document.getElementById('#{iframeId}');video.setAttribute('style', 'width: ' + video.scrollWidth + 'px; height: ' + video.scrollWidth * 9 / 16 + 'px;')"
          width: "100%",
          src: src,
          allowfullscreen: true
        })
        $video.insertAfter @target
        $('<p><br></p>').insertAfter $video
        @hide()

  generateIframeUrlFromVideoUrl: (url) ->
    youkuVideoRegex = "https?://.*youku\.com/v_show/id_([^.]*)\.html.*"
    qqVideoRegex = "https?://.*qq\.com/x/cover/.*/([^.]*)\.html.*"
    youkuResult = url.match(youkuVideoRegex)
    qqResult = url.match(qqVideoRegex)

    if youkuResult
      "http://player.youku.com/embed/#{youkuResult[1]}"
    else if qqResult
      "https://v.qq.com/iframe/player.html?vid=#{qqResult[1]}&tiny=0&auto=0"

  show: (args...) ->
    super args...
    @urlEl.val('')

Simditor.Toolbar.addButton VideoButton