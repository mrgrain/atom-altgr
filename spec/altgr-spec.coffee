Altgr = require '../lib/altgr'
AltGrManager = require '../lib/altgr-manager'


describe "when AltGrManager is constructed", ->
  it "the event Queue is empty", ->
    altGrManager = new AltGrManager
    expect(altGrManager).toBeDefined()
    expect(altGrManager.eventQueue.length).toBe(0)
