TalkExampleView = require './talk-example-view'
{CompositeDisposable} = require 'atom'

module.exports = TalkExample =
  talkExampleView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @talkExampleView = new TalkExampleView(state.talkExampleViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @talkExampleView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'talk-example:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @talkExampleView.destroy()

  serialize: ->
    talkExampleViewState: @talkExampleView.serialize()

  toggle: ->
    console.log 'TalkExample was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
