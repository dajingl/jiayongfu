class AlignmentRightButton extends Simditor.Button

  name: "alignment-right"

  icon: 'align-right'

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
      @setActive @nodes.first().css('text-align') == 'right'

  command: () ->
    @nodes.css
      'text-align': 'right'

    @editor.trigger 'valuechanged'
    @editor.inputManager.throttledSelectionChanged()

Simditor.Toolbar.addButton AlignmentRightButton