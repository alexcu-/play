Type = require './Type'

###
This class extends Type for specifically wrapping Number types as Floating point
###
class Float extends Type
  constructor: ->
    super(typeof 0, null)
  "=": (newValue) =>
    oldValue = @_value
    super(newValue)
    unless newValue % 1 is 0
      @_value = oldValue
      throw Error "#{newValue} is not a Float"

module.exports = Float