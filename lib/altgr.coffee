AltGrManager = require './altgr-manager'

module.exports = Altgr =

  activate: (state) ->
    if atom
      #Create AltGrManager
      atom.altgr = new AltGrManager();

      #Deregister original keydown handler
      document.removeEventListener 'keydown', atom.windowEventHandler.onKeydown

      #Register atom-altgr handlers
      document.addEventListener 'keypress', @onKeypress
      document.addEventListener 'keydown', @onKeydown

  deactivate: ->
    #Deregister atom-altgr handlers
    document.removeEventListener 'keypress', @onKeypress
    document.removeEventListener 'keydown', @onKeydown

    #Register original keydown handler
    if atom
      document.addEventListener 'keydown', atom.windowEventHandler.onKeydown
      delete atom.altgr

  onKeydown: (event) ->
    atom.altgr.onKeydown event

  onKeypress: (event) ->
    atom.altgr.onKeypress event
