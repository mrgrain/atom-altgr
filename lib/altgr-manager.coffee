module.exports =
class AltGrManager

  #Section One: (De)Register Handlers
  constructor: ->

  destroy: ->
    eventQueue: []

  #Section Two: Properties
  eventQueue: []
  timeout: 5 #in ms

  #Section Three: Handlers
  onKeypress: (event) ->
    #Check timing and key
    last = @eventQueue.shift()
    if last && last.keyCode != event.keyCode && @timeout > event.timeStamp - last.timeStamp > 0
    else
      @eventQueue.unshift last;


  onKeydown: (event) ->
    # ctrl-alt + other key pressed
    if event.altKey && event.ctrlKey && event.keyCode != 18
      @eventQueue.push event
      setTimeout ->
        last = atom.altgr.eventQueue.shift()
        if last && last == event
          atom.windowEventHandler.onKeydown last,
      @timeout+1
      return

    # call original handler
    atom.windowEventHandler.onKeydown event
