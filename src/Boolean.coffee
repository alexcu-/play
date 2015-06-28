Integer = require './Integer'

###
This class extends Integer for 0 or 1 boolean types
###
class Boolean extends Integer
  "=": (newValue) =>
    oldValue = @_value
    newValue = 0 if newValue in ['false', false]
    newValue = 1 if newValue in ['true' , true ]
    super(newValue)
    unless newValue in [0, 1]
      @_value = oldValue
      throw Error "#{newValue} is not true or false"

module.exports = Boolean