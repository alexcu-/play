Boolean = require './Boolean'
Integer = require './Integer'
Decimal = require './Decimal'
Pointer = require './Pointer'
Constant = require './Constant'

# Decimals
z = new Decimal
z['='] 1
z['='] 1.2
z['='] 3

# Pointers
x = new Pointer Integer
y = new Integer
y['='] 0
console.log y._value # should be 0
x['='] y['@']()
x['^'] (yy)-> yy._value = yy._value + 10
console.log y._value # should be 10

# Boolean assignment
x = new Boolean
x['='] 1
x['='] 'true'
x['='] false

# Constant Pointers
try
  x = new Integer
  x['='] 256
  x = new Constant x
  console.log "created new constant of #{x._value._value}"
  console.log "trying to change constant to 512"
  x['='] 512
catch e
  console.log "not changing constant!!"

x = new Integer
x['='] 11
console.log x._value # should be 11
xptr = new Pointer Integer
xptr['='] x['@']()
XPTR = new Constant xptr
XPTR._value['^'] (xx) -> xx._value++
console.log x._value # should be 12