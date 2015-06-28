Type = require './Type'

###
This class extends Type for specifically wrapping String types
###
class String extends Type
  constructor: ->
    super(typeof "", null)

module.exports = String