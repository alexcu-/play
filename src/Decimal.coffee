Type = require './Type'

###
This class extends Type for specifically wrapping Number types as Floating point
###
class Decimal extends Type
  constructor: ->
    super(typeof 0, null)

module.exports = Decimal