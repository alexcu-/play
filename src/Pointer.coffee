Type = require './Type'

###
This class extends type for pointer representation
###
class Pointer extends Type
  ###
  Resolves pointer type names
  @param  [object]  type  The object to resolve a name from
  @returns [string] The type name of this pointer
  ###
  _resolvePtrType = (type) ->
    unless Type.__checkInstanceOf type
      throw TypeError "Pointer must point to Type"
    'PointerTo' + type.name
  ###
  @param  [Type]  ptrTo  The type the pointer points to
  ###
  constructor: (ptrTo) ->
    super(_resolvePtrType ptrTo, null)
  ###
  Assignment operator ensures that the newValue is equal to the internal type of this variable
  and in addition, as this is a pointer, will accept integers for the address of other types
  @param  [object]  newValue  The new value to assign to this variable
  ###
  '=': (newValue) =>
    # Not given an address? Then must check if same internal types (ptrX to ptrX)
    unless typeof newValue is typeof 1
      if not newValue._internalType? or newValue._internalType isnt @_internalType
        throw TypeError "Invalid pointer type assignment from #{newValue}"
      @_value = newValue._value
    # Given address?
    else
      address = newValue
      object = Type.__lookup address
      @_value = address
  ###
  Applies the block provided to the object in the lookup table
  @param    [function]  block the function to apply to the object at the end of the pointer
  ###
  '^': (block) =>
    # Return nil if unassigned pointer
    unless @_value?
      throw Error "Cannot apply block to null pointer"
    # Apply the block with the object found
    block(Type.__lookup @_value)

module.exports = Pointer