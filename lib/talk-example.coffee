module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', "talk-example:do-math", => @doMath()

  doMath: ->
    editor = atom.workspace.getActivePaneItem()
    selections = editor.getSelections()
    for selection in selections
      text = selection.getText()
      matchData = text.match /^(-*\d+)\s*(\+|-|\*|\/)\s*(-*\d+)$/
      if matchData
        numOne = parseFloat(matchData[1])
        operator = matchData[2]
        numTwo = parseFloat(matchData[3])
        selection.insertText(@calc(numOne, numTwo, operator).toString())

  calc: (numOne, numTwo, operator) ->
    if operator == "+"
      numOne + numTwo
    else if operator == "-"
      numOne - numTwo
    else if operator == "*"
      numOne * numTwo
    else if operator == "/"
      numOne / numTwo
