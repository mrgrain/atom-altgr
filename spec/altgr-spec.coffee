Altgr = require '../lib/altgr'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "when Altgr is activated", ->
  it "initializes the AltgrManager", ->
    expect(atom.altgr).toBe false
