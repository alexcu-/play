Type = require './Type'

###
This class extends Type for specifically wrapping Number types as Integers
###
class Integer extends Type
  constructor: ->
    super(typeof 0, null)
  "=": (newValue) =>
    oldValue = @_value
    super(newValue)
    unless newValue % 1 is 0
      @_value = oldValue
      throw Error "#{newValue} is not an Integer"

module.exports = Integer