class AlignmentLeftButton extends Simditor.Button

  name: "alignment-left"

  icon: 'align-left'

  htmlTag: 'p, h1, h2, h3, h4, td, th'

  _init: ->
    super()


  _status: ->
    @nodes = @editor.selection.nodes().filter(@htmlTag)
    if @nodes.length < 1
      @setDisabled true
      @setActive false
    else
      @setDisabled false
      @setActive @nodes.first().css('text-align') == 'left'

  command: () ->
    @nodes.css
      'text-align': 'left'

    @editor.trigger 'valuechanged'
    @editor.inputManager.throttledSelectionChanged()

Simditor.Toolbar.addButton AlignmentLeftButton