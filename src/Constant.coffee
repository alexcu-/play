Type = require './Type'

###
This class extends type for constant representation by wrapping a type object that cannot be
reassigned. Note that the this._value._value reference will still have write access
###
class Constant extends Type
  ###
  @param  [object]  value       The value of the constant
  ###
  constructor: (value) ->
    unless Type.__checkInstanceOf value
      throw TypeError "Constant must be a Type"
    typeName = 'ConstantOf' + value._internalType
    super(typeName, value)
  ###
  Throws an exception, as constants cannot be reassigned
  ###
  '=': (newValue) =>
    throw Error "Cannot reassign constant"

module.exports = Constant