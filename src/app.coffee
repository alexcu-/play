Boolean = require './Boolean'
Integer = require './Integer'
Decimal = require './Decimal'
Pointer = require './Pointer'

# Decimals
z = new Decimal
z['='] 1
z['='] 1.2
z['='] 3

# Pointers
x = new Pointer Decimal
y = new Decimal
y['='] 11.2

console.log y._value
x['='] y['@']()
x['^'] (yy)-> yy._value = yy._value + 1
console.log y._value

y = new Integer
x['@']

x = new Boolean
x['='] 1
x['='] 'true'
x['='] false