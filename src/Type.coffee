###
This class defines the root object for all types
###
class Type extends Object
  ###
  The address table maps each address to this
  ###
  @__addressTable: {}
  ###
  @param  [string]  _internalType  The internal JavaScript type given to this variable
  @param  [object]  _value         The actual value assigned to this variable
  ###
  constructor: (@_internalType, @_value) ->
    @__addressNumber = (Object.keys(Type.__addressTable) || []).length + 1
    Type.__addressTable[@__addressNumber] = @
  ###
  Assignment operator ensures that the newValue is equal to the internal type of this variable
  @param  [object]  newValue  The new value to assign to this variable
  ###
  "=": (newValue) =>
    typeOfNew = typeof newValue
    if typeOfNew isnt @_internalType
      throw Error "#{newValue} of type #{typeOfNew} is not a #{@__internalType}"
    @_value = newValue
  ###
  @returns The unique address of this object
  ###
  "@": ->
    @__addressNumber

module.exports = Type