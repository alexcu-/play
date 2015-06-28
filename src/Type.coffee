###
This class defines the root object for all types
###
class Type extends Object
  ###
  The address table maps each address to this
  ###
  @__addressTable: {}
  ###
  Looks up an address in the __addressTable
  @param    [integer] address The address to lookup
  @returns  [Type]    The type stored in that address
  ###
  @__lookup: (address) ->
    lookedUp = @__addressTable[address]
    unless lookedUp?
      throw Error "Nothing stored at #{address}"
    lookedUp
  ###
  Checks if the given object is an instanceof Type
  @param    [object]  obj The object to check
  @returns  [boolean] True if so, false otherwise
  ###
  @__checkInstanceOf: (obj) ->
    obj instanceof Type or
    obj.__super__? and obj.__super__.constructor.name is Type.name
  ###
  @param  [string]  _internalType   The internal JavaScript type given to this variable
  @param  [object]  _value          The actual value assigned to this variable
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
      throw TypeError "#{newValue} of type #{typeOfNew} is not a #{@_internalType}"
    @_value = newValue
  ###
  @returns The unique address of this object
  ###
  "@": ->
    @__addressNumber

module.exports = Type