class AlignmentCenterButton extends Simditor.Button

  name: "alignment-center"

  icon: 'align-center'

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
      @setActive @nodes.first().css('text-align') == 'center'

  command: () ->
    @nodes.css
      'text-align': 'center'

    @editor.trigger 'valuechanged'
    @editor.inputManager.throttledSelectionChanged()

Simditor.Toolbar.addButton AlignmentCenterButton